
module multi_tri(vga_clk, sys_clk, sdram_refclk_50mhz, reset,
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
				  tri_reader_all_triangles_read_out
			      );

input           sdram_reset;
input           request;
//output  		found_res_word;

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
parameter COORD_SIZE = 12;
parameter COLOR_SIZE = 4;

parameter X_MIN = 0;
parameter X_MAX = 640;
parameter Y_MIN = 0;
parameter Y_MAX = 480;

//parameter MODEL_VHD_LATENCY = 200;
//Kamal's rough calculation: 10 for view-trans + 70 for my-ray 
//parameter MODEL_VHD_LATENCY = 80;
//Kamal's detailed calculation shows 58 cycles. So I am keeping 60 for now.
//parameter MODEL_VHD_LATENCY = 60;

//trying to do fully pipe lined
parameter MODEL_VHD_LATENCY = 2;

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

input [REAL_COLOR_SIZE-1:0] intersect_r;
input [REAL_COLOR_SIZE-1:0] intersect_g;
input [REAL_COLOR_SIZE-1:0] intersect_b;

output [COORD_SIZE-1:0] tri_reader_vertex_x;
output [COORD_SIZE-1:0] tri_reader_vertex_y;
output [COORD_SIZE-1:0] tri_reader_vertex_z;

output [COORD_SIZE-1:0] tri_reader_edge1_x;
output [COORD_SIZE-1:0] tri_reader_edge1_y;
output [COORD_SIZE-1:0] tri_reader_edge1_z;

output [COORD_SIZE-1:0] tri_reader_edge2_x;
output [COORD_SIZE-1:0] tri_reader_edge2_y;
output [COORD_SIZE-1:0] tri_reader_edge2_z;

output [COLOR_SIZE-1:0] tri_reader_r;
output [COLOR_SIZE-1:0] tri_reader_g;
output [COLOR_SIZE-1:0] tri_reader_b;

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

reg [REAL_COLOR_SIZE-1:0] sdram_write_r_reg;
reg [REAL_COLOR_SIZE-1:0] sdram_write_g_reg;
reg [REAL_COLOR_SIZE-1:0] sdram_write_b_reg;

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

wire tri_reader_all_triangles_read;

reg [COORD_SIZE-1:0] tri_reader_vertex_x;
reg [COORD_SIZE-1:0] tri_reader_vertex_y;
reg [COORD_SIZE-1:0] tri_reader_vertex_z;

reg [COORD_SIZE-1:0] tri_reader_edge1_x;
reg [COORD_SIZE-1:0] tri_reader_edge1_y;
reg [COORD_SIZE-1:0] tri_reader_edge1_z;

reg [COORD_SIZE-1:0] tri_reader_edge2_x;
reg [COORD_SIZE-1:0] tri_reader_edge2_y;
reg [COORD_SIZE-1:0] tri_reader_edge2_z;

reg [COLOR_SIZE-1:0] tri_reader_r;
reg [COLOR_SIZE-1:0] tri_reader_g;
reg [COLOR_SIZE-1:0] tri_reader_b;

reg read_en_1;
reg read_en_2;
reg write_en_1;
reg write_en_2;

reg frame_done;

reg [9:0] latency_count;
reg reserved_bit_port1_out;
reg reserved_bit_port1_in;

reg [9:0] write_x_reg;
reg [9:0] write_y_reg;

reg next_pixel;
reg tri_reader_all_triangles_read_reg;
reg request_triangle_reg;

reg [9:0] nearest_z;
reg [9:0] nearest_z_r;
reg [9:0] nearest_z_g;
reg [9:0] nearest_z_b;

reg reset_nearest_z_rgb;
reg reset_nearest_z_rgb2;
reg	reset_nearest_z_rgb3;
reg	reset_nearest_z_rgb4;

/*
vga_clk is the 27 Mhz clock that runs the VGA interface. We need to produce a new pixel color every tick of this clock. 
  - We read data from the SDRAM controller on this clock.
sys_clk is the clock that runs the rest of the system. 
  - We write words into the SDRAM controller on this clock.

When writing any synchronous block you need to be careful that you are using the correct clock.
*/


// Get the triangle out of the tri_reader (ROM)
tri_reader my_tri_reader(.clk(sys_clk), .reset(reset), .request_triangle(request_triangle_reg), 
				         .vertex_x(tri_reader_vertex_x), .vertex_y(tri_reader_vertex_y), .vertex_z(tri_reader_vertex_z),
				  		 .edge1_x(tri_reader_edge1_x), .edge1_y(tri_reader_edge1_y), .edge1_z(tri_reader_edge1_z),
				  	     .edge2_x(tri_reader_edge2_x), .edge2_y(tri_reader_edge2_y), .edge2_z(tri_reader_edge2_z),
				  		 .r(tri_reader_r), .g(tri_reader_g), .b(tri_reader_b), .all_triangles_read(tri_reader_all_triangles_read));

// SDRAM setup -- this is a 64Mbit SDRAM
// We currently only use 640x480x32 bits = ~9Mbit

Sdram_Control_4Port	u6	(	//	HOST Side
	.REF_CLK(sdram_refclk_50mhz),
						    .RESET_N(1'b1),
							//	FIFO Write Side 1
						    .WR1_DATA(	{1'b0, sdram_write_g_reg[9:5],
										 sdram_write_r_reg[9:0]}),
							
							.WR1(write_en_1),
							.WR1_ADDR(0),							
							.WR1_MAX_ADDR((X_MAX-X_MIN)*(Y_MAX-Y_MIN)),
							.WR1_LENGTH(9'h100),
	.WR1_LOAD(sdram_reset),
	.WR1_CLK(sys_clk),
							//	FIFO Write Side 2
						    .WR2_DATA(	{1'b0, sdram_write_g_reg[4:0],
										 sdram_write_b_reg[9:0]}),							
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
		latency_count <= 0;
		
		frame_done <= 0;

		write_x_reg <= 0;
		write_y_reg <= 0;

		next_pixel <= 0;

		tri_reader_all_triangles_read_reg <= 0;
		request_triangle_reg <= 0;

		nearest_z <= 0;
		nearest_z_r <= 0;
		nearest_z_g <= 0;
		nearest_z_b <= 0;

		reset_nearest_z_rgb <= 0;
		reset_nearest_z_rgb2 <= 0;
		reset_nearest_z_rgb3 <= 0;
		reset_nearest_z_rgb4 <= 0;

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

		// Did we read all the triangles?		
		tri_reader_all_triangles_read_reg <= tri_reader_all_triangles_read;	
		
		// Assign next_pixel
		if (tri_reader_all_triangles_read_reg)
		begin
			next_pixel <= 1;			
		end
		else
		begin
			next_pixel <= 0;
		end
	
		reset_nearest_z_rgb <= next_pixel;	
		reset_nearest_z_rgb2 <= reset_nearest_z_rgb;
		reset_nearest_z_rgb3 <= reset_nearest_z_rgb2;	
		reset_nearest_z_rgb4 <= reset_nearest_z_rgb3;

		if (reset_nearest_z_rgb4)
		begin
			// When tri_reader_all_triangles_read_reg goes high we have already finished computing for all the triangles
			// and have asked for another one
			nearest_z_r <= 0;
			nearest_z_g <= 0;
			nearest_z_b <= 0;
		end

		// Assign request_triangle_reg -- next tri
		
		if (latency_count == MODEL_VHD_LATENCY)
		begin
			latency_count <= 0;
			request_triangle_reg <= 1;

			// Z-buffering
			// Update nearest z r,g,b
			if (intersected_tri)
			begin
//				nearest_z_r <= intersect_r;
//				nearest_z_g <= intersect_g;
//				nearest_z_b <= intersect_b;

				nearest_z_r <= intersect_r + nearest_z_r;
				nearest_z_g <= intersect_g + nearest_z_g;
				nearest_z_b <= intersect_b + nearest_z_b;
			end	
			// else keep the old value								
		end
		else
		begin
			latency_count <= latency_count + 1;
			request_triangle_reg <= 0;
		end

		if (next_pixel)
		begin
			write_en_1 <= 1'b1; 
			write_en_2 <= 1'b1;
		end		
		else
		begin
			write_en_1 <= 1'b0; 
			write_en_2 <= 1'b0;
		end				

		////////////////////////////////////
		// Assign r,g,b to write into SDRAM
		////////////////////////////////////
		
		/*
		if ((write_x_reg >= X_SQ_MIN) && (write_x_reg < X_SQ_MAX) 
		     && (write_y_reg >= Y_SQ_MIN) && (write_y_reg < Y_SQ_MAX))
		begin
			sdram_write_r_reg <= 10'b11111_11111;
			sdram_write_g_reg <= 10'b00000_11111;
			sdram_write_b_reg <= 10'b00000_00000;
		end
		else
		begin
			sdram_write_r_reg <= 10'b00000_00000;
			sdram_write_g_reg <= 10'b00000_11111;
			sdram_write_b_reg <= 10'b11111_11111;
		end		
		*/

		sdram_write_r_reg <= nearest_z_r;
		sdram_write_g_reg <= nearest_z_g;
		sdram_write_b_reg <= nearest_z_b;
			
		if ((debug_x == X_MAX) && (debug_y == Y_MAX)) frame_done <= 1;
		
	end
end

assign final_r = sdram_word_1[9:0];
assign final_g = {sdram_word_1[14:10], sdram_word_2[14:10]};
assign final_b =  sdram_word_2[9:0];

assign count_diff = sdram_g;
assign write_x = write_x_reg;
assign write_y = write_y_reg;

assign next_pixel_out = next_pixel;

endmodule
