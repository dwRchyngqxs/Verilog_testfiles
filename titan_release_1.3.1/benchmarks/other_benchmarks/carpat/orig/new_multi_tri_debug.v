/*
New multi tri -- this module assumes that the model is fully pipelined. It produces 1 triangle every sys_clk and expects an answer from the model
every sys_clk (albeit for a triangle sent out ~70 cycles before)

This module never produces any junk triangles since it knows exactly how many triangles exist in the ROM. Hence it does not need to drop any triangles. 
*/

module new_multi_tri_debug(vga_clk, sys_clk, sdram_refclk_50mhz, reset,
				  intersected_tri,
       			  intersect_x,
        		  intersect_y,
        		  intersect_z,
				  intersect_r, intersect_g, intersect_b,
				  tri_reader_vertex_x, tri_reader_vertex_y, tri_reader_vertex_z,
				  tri_reader_edge1_x, tri_reader_edge1_y, tri_reader_edge1_z,
				  tri_reader_edge2_x, tri_reader_edge2_y, tri_reader_edge2_z,
				  tri_reader_r, tri_reader_g, tri_reader_b,
				  final_r, final_g, final_b,
				  // sdram side
				  DRAM_DQ,						//	SDRAM Data bus 16 Bits
				  DRAM_ADDR,						//	SDRAM Address bus 12 Bits
				  DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
				  DRAM_UDQM,						//	SDRAM High-byte Data Mask
		          DRAM_WE_N,						//	SDRAM Write Enable
		          DRAM_CAS_N,						//	SDRAM Column Address Strobe
		          DRAM_RAS_N,						//	SDRAM Row Address Strobe
		          DRAM_CS_N,						//	SDRAM Chip Select
		          DRAM_BA_0,						//	SDRAM Bank Address 0
		          DRAM_BA_1,						//	SDRAM Bank Address 0
		          DRAM_CLK,						//	SDRAM Clock
		          DRAM_CKE,						//	SDRAM Clock Enable,
				  // Other SDRAM controller signals
	sdram_reset,
				  debug_x,
				  debug_y,
				  request,
				  debug_frame_done,
				  w1_full,
				  w2_full,
			      r1_empty,
				  r2_empty,
				  count_diff,
				  write_x,
				  write_y,
				  next_pixel_out,
				  request_triangle_out,
				  tri_reader_all_triangles_read_out,
				  accumulate,
				  rot_eyex,
				  rot_eyey,
				  rot_eyez,
				  next_pixel_in,
				  num_of_triangles_out
			      );

////////////////////////////////////////
// ROM size info
////////////////////////////////////////

parameter TRI_READER_ADDRESS_SIZE = 12;
//parameter TRI_READER_NUM_TRIANGLES = 3;

// End ROM size info
////////////////////////////////////////

input		next_pixel_in;
input           sdram_reset;
input           request;
//output  		found_res_word;

input accumulate;

output next_pixel_out;
output request_triangle_out;
output tri_reader_all_triangles_read_out;		

// Assign resets

output w1_full, w2_full, r1_empty, r2_empty;
output debug_frame_done;

assign debug_frame_done = frame_done;
							 			
input vga_clk;
input sys_clk;
input sdram_refclk_50mhz;
input reset;

input [9:0] debug_x;
input [9:0] debug_y;

reg [9:0] last_x_reg;
reg [9:0] last_y_reg;

wire  request_triangle;

parameter VERTEX_WORD_LENGTH = 20;
parameter REAL_COLOR_SIZE = 10;
parameter TRI_READER_COORD_SIZE = 12;
parameter TRI_READER_COLOR_SIZE = 4;
parameter SQ_SIZE = 2*VERTEX_WORD_LENGTH + 2;

parameter REAL_COLOR_SIZE_OVERFLOW = 11'b10000000000;
parameter FULL_COLOR = 10'b11111_11111;

//parameter X_MIN = 0;
//parameter X_MAX = 640;
//parameter Y_MIN = 0;
//parameter Y_MAX = 480;

parameter X_MIN = 0;
parameter X_MAX = 20;
parameter Y_MIN = 0;
parameter Y_MAX = 20;

/*
Each port of the RAM stores 15 bits of the color for each pixel
number of pixels painted are:
(X_MAX-X_MIN)*(Y_MAX-Y_MIN)
*/

parameter X_SQ_MIN = 100;
parameter X_SQ_MAX = 130;
parameter Y_SQ_MIN = 100;
parameter Y_SQ_MAX = 200;

input [0:0] intersected_tri;
input [VERTEX_WORD_LENGTH-1:0] intersect_x;
input [VERTEX_WORD_LENGTH-1:0] intersect_y;
input [VERTEX_WORD_LENGTH-1:0] intersect_z;

input [VERTEX_WORD_LENGTH-1:0] rot_eyex;
input [VERTEX_WORD_LENGTH-1:0] rot_eyey;
input [VERTEX_WORD_LENGTH-1:0] rot_eyez;

input [REAL_COLOR_SIZE-1:0] intersect_r;
input [REAL_COLOR_SIZE-1:0] intersect_g;
input [REAL_COLOR_SIZE-1:0] intersect_b;

output [TRI_READER_COORD_SIZE-1:0] tri_reader_vertex_x;
output [TRI_READER_COORD_SIZE-1:0] tri_reader_vertex_y;
output [TRI_READER_COORD_SIZE-1:0] tri_reader_vertex_z;

output [TRI_READER_COORD_SIZE-1:0] tri_reader_edge1_x;
output [TRI_READER_COORD_SIZE-1:0] tri_reader_edge1_y;
output [TRI_READER_COORD_SIZE-1:0] tri_reader_edge1_z;

output [TRI_READER_COORD_SIZE-1:0] tri_reader_edge2_x;
output [TRI_READER_COORD_SIZE-1:0] tri_reader_edge2_y;
output [TRI_READER_COORD_SIZE-1:0] tri_reader_edge2_z;

output [TRI_READER_COLOR_SIZE-1:0] tri_reader_r;
output [TRI_READER_COLOR_SIZE-1:0] tri_reader_g;
output [TRI_READER_COLOR_SIZE-1:0] tri_reader_b;

output [REAL_COLOR_SIZE-1:0] final_r;
output [REAL_COLOR_SIZE-1:0] final_b;
output [REAL_COLOR_SIZE-1:0] final_g;

output [9:0] count_diff;
reg [9:0] count_diff_reg;

output [9:0] write_x;
output [9:0] write_y;

wire [REAL_COLOR_SIZE-1:0] sdram_r;
wire [REAL_COLOR_SIZE-1:0] sdram_b;
wire [REAL_COLOR_SIZE-1:0] sdram_g;

wire [15:0] sdram_word_1;
wire [15:0] sdram_word_2;

wire [REAL_COLOR_SIZE-1:0] sdram_write_r_wire;
wire [REAL_COLOR_SIZE-1:0] sdram_write_g_wire;
wire [REAL_COLOR_SIZE-1:0] sdram_write_b_wire;

reg [SQ_SIZE-1:0] distance_sq2;
reg [SQ_SIZE-1:0] distance_sq3;
reg [SQ_SIZE-1:0] distance_sq4;
reg [SQ_SIZE-1:0] distance_sq5;
reg [SQ_SIZE-1:0] distance_sq6;

reg [REAL_COLOR_SIZE-1:0] intersect_r2;
reg [REAL_COLOR_SIZE-1:0] intersect_r3;
reg [REAL_COLOR_SIZE-1:0] intersect_r4;
reg [REAL_COLOR_SIZE-1:0] intersect_r5;
reg [REAL_COLOR_SIZE-1:0] intersect_r6;

reg  [REAL_COLOR_SIZE-1:0] intersect_g2;
reg  [REAL_COLOR_SIZE-1:0] intersect_g3;
reg  [REAL_COLOR_SIZE-1:0] intersect_g4;
reg  [REAL_COLOR_SIZE-1:0] intersect_g5;
reg  [REAL_COLOR_SIZE-1:0] intersect_g6;

reg [REAL_COLOR_SIZE-1:0] intersect_b2;
reg [REAL_COLOR_SIZE-1:0] intersect_b3;
reg [REAL_COLOR_SIZE-1:0] intersect_b4;
reg [REAL_COLOR_SIZE-1:0] intersect_b5;
reg [REAL_COLOR_SIZE-1:0] intersect_b6;


reg [VERTEX_WORD_LENGTH-1:0] intersect_z_dist;
reg [VERTEX_WORD_LENGTH-1:0] intersect_y_dist;
reg [VERTEX_WORD_LENGTH-1:0] intersect_x_dist;

reg [SQ_SIZE-1:0] intersect_z_dist_sq;
reg [SQ_SIZE-1:0] intersect_y_dist_sq;
reg [SQ_SIZE-1:0] intersect_x_dist_sq;

reg [SQ_SIZE-1:0] distance_sq_new;

//reg found_res_word_reg;

///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable

reg read_en_1;
reg read_en_2;
reg write_en_1;
reg write_en_2;

reg frame_done;

reg reserved_bit_port1_out;
reg reserved_bit_port1_in;

reg [9:0] write_x_reg;
reg [9:0] write_y_reg;

reg next_pixel;
reg next_pixel_in_reg2;
reg next_pixel_in_reg3;
reg next_pixel_in_reg4;
reg next_pixel_in_reg5;
reg next_pixel_in_reg6;
reg next_pixel_in_reg7;

reg [9:0] nearest_distance_sq;
reg [9:0] nearest_distance_sq_r;
reg [9:0] nearest_distance_sq_g;
reg [9:0] nearest_distance_sq_b;

reg reset_nearest_distance_sq_rgb;
reg reset_nearest_distance_sq_rgb2;
reg	reset_nearest_distance_sq_rgb3;
reg	reset_nearest_distance_sq_rgb4;
reg	reset_nearest_distance_sq_rgb5;
reg	reset_nearest_distance_sq_rgb6;

reg [SQ_SIZE-1:0] smallest_distance_sq_reg;
reg [SQ_SIZE-1:0] smallest_distance_sq_reg2;
reg [SQ_SIZE-1:0] smallest_distance_sq_reg3;
reg [SQ_SIZE-1:0] smallest_distance_sq_reg4;
reg [SQ_SIZE-1:0] smallest_distance_sq_reg5;
reg [SQ_SIZE-1:0] smallest_distance_sq_reg6;

reg first_tri;
reg first_intersected_tri2;
reg first_intersected_tri3;
reg first_intersected_tri4;
reg first_intersected_tri5;
reg first_intersected_tri6;

reg intersected_tri2;
reg intersected_tri3;
reg intersected_tri4;
reg intersected_tri5;
reg intersected_tri6;

reg [TRI_READER_ADDRESS_SIZE-1:0] address_reg;
reg [TRI_READER_ADDRESS_SIZE-1:0] num_of_triangles;

output [TRI_READER_ADDRESS_SIZE-1:0] num_of_triangles_out;

wire [((9*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE)):0] word;

wire next_pixel_in_internal;

// This is from the model (after being pipelined with the computation on
// a triangle).
assign next_pixel_in_internal = next_pixel_in;

/*
vga_clk is the 27 Mhz clock that runs the VGA interface. We need to produce a new pixel color every tick of this clock. 
  - We read data from the SDRAM controller on this clock.
sys_clk is the clock that runs the rest of the system. 
  - We write words into the SDRAM controller on this clock.

When writing any synchronous block you need to be careful that you are using the correct clock.
*/

// Access the ROM directly
num_of_triangles_rom my_tri_num_rom(
.address(0),
.clock(sys_clk),
.q(num_of_triangles));

// Access the ROM directly
tri_rom my_rom(
.address(address_reg),
.clock(sys_clk),
.q(word));

assign tri_reader_vertex_x = word[(((9*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((8*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];
assign tri_reader_vertex_y = word[(((8*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((7*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];
assign tri_reader_vertex_z = word[(((7*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((6*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];	

assign tri_reader_edge1_x = word[(((6*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((5*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];
assign tri_reader_edge1_y = word[(((5*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((4*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];
assign tri_reader_edge1_z = word[(((4*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((3*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];	

assign tri_reader_edge2_x = word[(((3*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((2*TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];
assign tri_reader_edge2_y = word[(((2*TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):((TRI_READER_COORD_SIZE) + (3*TRI_READER_COLOR_SIZE))];
assign tri_reader_edge2_z = word[(((TRI_READER_COORD_SIZE)) + (3*TRI_READER_COLOR_SIZE) - 1):(3*TRI_READER_COLOR_SIZE)];

assign tri_reader_r = word[((3*TRI_READER_COLOR_SIZE)-1):(2*TRI_READER_COLOR_SIZE)];
assign tri_reader_g = word[((2*TRI_READER_COLOR_SIZE)-1):TRI_READER_COLOR_SIZE];
assign tri_reader_b = word[(TRI_READER_COLOR_SIZE-1):0];

// SDRAM setup -- this is a 64Mbit SDRAM
// We currently only use 640x480x32 bits = ~9Mbit

Sdram_Control_4Port	u6	(	//	HOST Side
	.REF_CLK(sdram_refclk_50mhz),
						    .RESET_N(1'b1),
							//	FIFO Write Side 1
						    .WR1_DATA(	{1'b0, sdram_write_g_wire[9:5],
										 sdram_write_r_wire[9:0]}),
							
							.WR1(write_en_1),
							.WR1_ADDR(0),							
							.WR1_MAX_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)),
							.WR1_LENGTH(9'h100),
	.WR1_LOAD(sdram_reset),
	.WR1_CLK(sys_clk),
							//	FIFO Write Side 2
						    .WR2_DATA(	{1'b0, sdram_write_g_wire[4:0],
										 sdram_write_b_wire[9:0]}),							
							.WR2(write_en_2),
							.WR2_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)),
							.WR2_MAX_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)*2),
							.WR2_LENGTH(9'h100),
	.WR2_LOAD(sdram_reset),
	.WR2_CLK(sys_clk),
							//	FIFO Read Side 1
						    .RD1_DATA(sdram_word_1),
				        	.RD1(read_en_1),
				        	.RD1_ADDR(0),
							.RD1_MAX_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)),
							.RD1_LENGTH(9'h100),
	.RD1_LOAD(sdram_reset),
	.RD1_CLK(vga_clk),
							//	FIFO Read Side 2
						    .RD2_DATA(sdram_word_2),
				        	.RD2(read_en_2),
				        	.RD2_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)),
							.RD2_MAX_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)*2),
							.RD2_LENGTH(9'h100),
	.RD2_LOAD(sdram_reset),
	.RD2_CLK(vga_clk),
							//	SDRAM Side
						    .SA(DRAM_ADDR),
						    .BA({DRAM_BA_1,DRAM_BA_0}),
						    .CS_N(DRAM_CS_N),
						    .CKE(DRAM_CKE),
						    .RAS_N(DRAM_RAS_N),
				            .CAS_N(DRAM_CAS_N),
				            .WE_N(DRAM_WE_N),
						    .DQ(DRAM_DQ),
				            .DQM({DRAM_UDQM,DRAM_LDQM}),
	.SDR_CLK(DRAM_CLK)
							);

////////////////////////////////////////////////////////
// vga_clk domain
// This clock controls the read interface from the SDRAM
////////////////////////////////////////////////////////
// controller
always @(posedge vga_clk)
begin
	if (reset)
	begin
		read_en_1 <= 0;
		read_en_2 <= 0;
	end
	else
	begin
		// Set RE
		read_en_1 <= request;
		read_en_2 <= request;	
	end
end

//////////////////////////////////////////////////////
// sys_clk domain
// This clock handles all the processing requires to
// produce the color for a pixel on the screen.
// This includes communication with the tri reader,
// the model engine
// and the SDRAM controller write interface
////////////////////////////////////////////////////// 
always @(posedge sys_clk)
begin
	if (reset)
	begin
		write_en_1 <= 0;
		write_en_2 <= 0;
		
		frame_done <= 0;

		write_x_reg <= 0;
		write_y_reg <= 0;

		next_pixel <= 0;
		next_pixel_in_reg2 <= 0;
		next_pixel_in_reg3 <= 0;
		next_pixel_in_reg4 <= 0;
		next_pixel_in_reg5 <= 0;
		next_pixel_in_reg6 <= 0;
		next_pixel_in_reg7 <= 0;

		nearest_distance_sq <= 0;
		nearest_distance_sq_r <= 0;
		nearest_distance_sq_g <= 0;
		nearest_distance_sq_b <= 0;

		reset_nearest_distance_sq_rgb <= 0;
		reset_nearest_distance_sq_rgb2 <= 0;
		reset_nearest_distance_sq_rgb3 <= 0;
		reset_nearest_distance_sq_rgb4 <= 0;	
		reset_nearest_distance_sq_rgb5 <= 0;
		reset_nearest_distance_sq_rgb6 <= 0;	

        smallest_distance_sq_reg <= 0;
		smallest_distance_sq_reg2 <= 0;
		smallest_distance_sq_reg3 <= 0;
		smallest_distance_sq_reg4 <= 0;
		smallest_distance_sq_reg5 <= 0;
		smallest_distance_sq_reg6 <= 0;	

		first_tri <= 1; // Yes -- set to 1
		first_intersected_tri2 <= 0;
		first_intersected_tri3 <= 0;
		first_intersected_tri4 <= 0;
		first_intersected_tri5 <= 0;
		first_intersected_tri6 <= 0;
	
		intersected_tri2 <= 0;
		intersected_tri3 <= 0;
		intersected_tri4 <= 0;
		intersected_tri5 <= 0;
		intersected_tri6 <= 0;

		distance_sq2 <= 0;
		distance_sq3 <= 0;
		distance_sq4 <= 0;
		distance_sq5 <= 0;
		distance_sq6 <= 0;

		intersect_r2 <= 0;
		intersect_r3 <= 0;
		intersect_r4 <= 0;
		intersect_r5 <= 0;
		intersect_r6 <= 0;

		intersect_g2 <= 0;
		intersect_g3 <= 0;
		intersect_g4 <= 0;
		intersect_g5 <= 0;
		intersect_g6 <= 0;

		intersect_b2 <= 0;
		intersect_b3 <= 0;
		intersect_b4 <= 0;
		intersect_b5 <= 0;
		intersect_b6 <= 0;

		intersect_z_dist <= 0;
		intersect_y_dist <= 0;
		intersect_x_dist <= 0;

		intersect_z_dist_sq <= 0;
		intersect_y_dist_sq <= 0;
		intersect_x_dist_sq <= 0;

		distance_sq_new <= 0;

		// Tri reader stuff
		address_reg <= 0;
	end
	else
	begin

		// Assign write_x_reg and write_y_reg
		if (next_pixel)
		begin
		if (write_x_reg == (X_MAX-1))
		begin
			// Reset write_x_reg
			write_x_reg <= 0;
			if (write_y_reg < (Y_MAX-1))
				write_y_reg <= write_y_reg + 1;
			else
				write_y_reg <= 0;
		end		
		else
			write_x_reg <= write_x_reg + 1;	
		end

		// ROM/MIF read address logic		
		if (address_reg != (num_of_triangles-1))
		begin		
				// Get a new triangle from the rom
				// Increment address
				address_reg <= address_reg + 1;
		end
		else
		    address_reg <= 0;	

		// Assign next_pixel
		if (address_reg == (num_of_triangles-1))
		begin
			next_pixel <= 1;			
		end
		else
		begin
			next_pixel <= 0;
		end

		// next_pixel_in indicates that the model has sent back the last triangle's computation	
		reset_nearest_distance_sq_rgb <= next_pixel_in_internal;

		next_pixel_in_reg2 <= next_pixel_in_internal;	
		
		next_pixel_in_reg3 <= next_pixel_in_reg2;
		next_pixel_in_reg4 <= next_pixel_in_reg3;
		next_pixel_in_reg5 <= next_pixel_in_reg4;
		next_pixel_in_reg6 <= next_pixel_in_reg5;
		next_pixel_in_reg7 <= next_pixel_in_reg6;		

		reset_nearest_distance_sq_rgb2 <= reset_nearest_distance_sq_rgb;
		reset_nearest_distance_sq_rgb3 <= reset_nearest_distance_sq_rgb2;	
		reset_nearest_distance_sq_rgb4 <= reset_nearest_distance_sq_rgb3;
		reset_nearest_distance_sq_rgb5 <= reset_nearest_distance_sq_rgb4;
		reset_nearest_distance_sq_rgb6 <= reset_nearest_distance_sq_rgb5;

		first_intersected_tri3 <= first_intersected_tri2;
		first_intersected_tri4 <= first_intersected_tri3;
		first_intersected_tri5 <= first_intersected_tri4;
		first_intersected_tri6 <= first_intersected_tri5;

		smallest_distance_sq_reg2 <= smallest_distance_sq_reg;
		smallest_distance_sq_reg3 <= smallest_distance_sq_reg2;
		smallest_distance_sq_reg4 <= smallest_distance_sq_reg3;
		smallest_distance_sq_reg5 <= smallest_distance_sq_reg4;
		smallest_distance_sq_reg6 <= smallest_distance_sq_reg5;
		
		intersected_tri3 <= intersected_tri2;
		intersected_tri4 <= intersected_tri3;
		intersected_tri5 <= intersected_tri4;
		intersected_tri6 <= intersected_tri5;

	/*
	    distance_sq3 <= distance_sq2;
		distance_sq4 <= distance_sq3;
		distance_sq5 <= distance_sq4;
		distance_sq6 <= distance_sq5;
	*/

	 // distance_sq3 repl
	    intersect_z_dist_sq <= intersect_z_dist*intersect_z_dist;
	    intersect_y_dist_sq <= intersect_y_dist*intersect_y_dist;
	    intersect_x_dist_sq <= intersect_x_dist*intersect_x_dist;
		
	    // distance_sq4 repl
	    distance_sq4 <= intersect_x_dist_sq + intersect_y_dist_sq + intersect_z_dist_sq;

	    distance_sq5 <= distance_sq4;
	    distance_sq6 <= distance_sq5;
		
	    intersect_r3 <= intersect_r2;
		intersect_r4 <= intersect_r3;
		intersect_r5 <= intersect_r4;
		intersect_r6 <= intersect_r5;

		
	    intersect_g3 <= intersect_g2;
		intersect_g4 <= intersect_g3;
		intersect_g5 <= intersect_g4;
		intersect_g6 <= intersect_g5;

		
	    intersect_b3 <= intersect_b2;
		intersect_b4 <= intersect_b3;
		intersect_b5 <= intersect_b4;
		intersect_b6 <= intersect_b5;

		if (reset_nearest_distance_sq_rgb)
		begin			
		 	smallest_distance_sq_reg <= 0;			
		end

		// Critical
		// The first triangles result comes in the cycle after next_pixel_in goes high
		first_tri <= next_pixel_in_internal;

		intersected_tri2 <= intersected_tri;

		intersect_r2 <= intersect_r;
		intersect_g2 <= intersect_g;
		intersect_b2 <= intersect_b;

			/*
			// distance_sq regs hold the 
			// square of the distance to the camera (eye)
			//distance_sq2 <= (intersect_z - rot_eyez)*(intersect_z - rot_eyez) + 
			//		(intersect_y - rot_eyey)*(intersect_y - rot_eyey) +
			//		(intersect_x - rot_eyex)*(intersect_x - rot_eyex); 			
			*/			
		
		intersect_z_dist <= intersect_z - rot_eyez;
		intersect_y_dist <= intersect_y - rot_eyey;
		intersect_x_dist <= intersect_x - rot_eyex;

		first_intersected_tri2 <= intersected_tri && first_tri;						

		if (next_pixel_in_reg6)
		begin
			write_en_1 <= 1'b1; 
			write_en_2 <= 1'b1;
		end		
		else
		begin
			write_en_1 <= 1'b0; 
			write_en_2 <= 1'b0;
		end		

		// Z-buffering
		// Update nearest z r,g,b
		// Do this on the delayed intersection 
		if (intersected_tri6)
		begin
			if (first_intersected_tri6)
			begin
				nearest_distance_sq_r <= intersect_r6;
				nearest_distance_sq_g <= intersect_g6;
				nearest_distance_sq_b <= intersect_b6;

				smallest_distance_sq_reg <= distance_sq6;					
			end
			else
			begin
				// Intersected, but check if the pixel is in front of the last one
				if (accumulate)
				begin
					if (nearest_distance_sq_r + intersect_r6 < REAL_COLOR_SIZE_OVERFLOW)
						nearest_distance_sq_r <= nearest_distance_sq_r + intersect_r6;
					else
						nearest_distance_sq_r <= FULL_COLOR;

					if (nearest_distance_sq_g + intersect_g6 < REAL_COLOR_SIZE_OVERFLOW)
						nearest_distance_sq_g <= nearest_distance_sq_g + intersect_g6;
					else
						nearest_distance_sq_g <= FULL_COLOR;

					if (nearest_distance_sq_b + intersect_b6 < REAL_COLOR_SIZE_OVERFLOW)
						nearest_distance_sq_b <= nearest_distance_sq_b + intersect_b6;
					else
						nearest_distance_sq_b <= FULL_COLOR;	
				end
				else if (distance_sq6 <= smallest_distance_sq_reg6)
				begin
					// New intersection is closer
					smallest_distance_sq_reg <= distance_sq6;
						
					nearest_distance_sq_r <= intersect_r6;
					nearest_distance_sq_g <= intersect_g6;
					nearest_distance_sq_b <= intersect_b6;
				end
				else
				begin
					// Do nothing - keep the old color for this pixel
					// In the future we can add color accumulation to give transparency effect
				end			
			end	
		end				
		else
		begin
			// No intersection
			if (next_pixel_in_reg7)
			begin
				// Clear
				nearest_distance_sq_r <= 0;
				nearest_distance_sq_g <= 0;
				nearest_distance_sq_b <= 0;
			end
		end
		////////////////////////////////////
		// Assign r,g,b to write into SDRAM
		////////////////////////////////////
		
		/*
		if ((write_x_reg >= X_SQ_MIN) && (write_x_reg < X_SQ_MAX) 
		     && (write_y_reg >= Y_SQ_MIN) && (write_y_reg < Y_SQ_MAX))
		begin
			nearest_distance_sq_r <= 10'b11111_11111;
			nearest_distance_sq_g <= 10'b00000_11111;
			nearest_distance_sq_b <= 10'b00000_00000;
		end
		else
		begin
			nearest_distance_sq_r <= 10'b00000_00000;
			nearest_distance_sq_g <= 10'b00000_11111;
			nearest_distance_sq_b <= 10'b11111_11111;
		end		
		*/

		if ((debug_x == X_MAX) && (debug_y == Y_MAX)) frame_done <= 1;
		
	end // not in reset
end // always 

assign final_r = sdram_word_1[9:0];
assign final_g = {sdram_word_1[14:10], sdram_word_2[14:10]};
assign final_b =  sdram_word_2[9:0];

assign count_diff = sdram_g;
assign write_x = write_x_reg;
assign write_y = write_y_reg;

assign next_pixel_out = next_pixel;
assign request_triangle_out = 1'b0;
assign tri_reader_all_triangles_read_out = 1'b0;

assign sdram_write_r_wire = nearest_distance_sq_r;
assign sdram_write_g_wire = nearest_distance_sq_g;
assign sdram_write_b_wire = nearest_distance_sq_b;
assign num_of_triangles_out = num_of_triangles;
endmodule
