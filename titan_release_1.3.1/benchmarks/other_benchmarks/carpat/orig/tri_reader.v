
module tri_reader(clk, reset, request_triangle, 
				  vertex_x, vertex_y, vertex_z,
				  edge1_x, edge1_y, edge1_z,
				  edge2_x, edge2_y, edge2_z,
				  r, g, b, all_triangles_read,
				  address_reg_out);

input clk;
input reset;
input request_triangle;

parameter COORD_SIZE = 12;
parameter COLOR_SIZE = 4;
parameter MIF_ADDRESS_SIZE = 3;
parameter MAX_ADDRESS = 4;

output [COORD_SIZE-1:0] vertex_x;
output [COORD_SIZE-1:0] vertex_y;
output [COORD_SIZE-1:0] vertex_z;

output [COORD_SIZE-1:0] edge1_x;
output [COORD_SIZE-1:0] edge1_y;
output [COORD_SIZE-1:0] edge1_z;

output [COORD_SIZE-1:0] edge2_x;
output [COORD_SIZE-1:0] edge2_y;
output [COORD_SIZE-1:0] edge2_z;

output [COLOR_SIZE-1:0] r;
output [COLOR_SIZE-1:0] g;
output [COLOR_SIZE-1:0] b;

output all_triangles_read;
output [MIF_ADDRESS_SIZE-1:0] address_reg_out;

reg [MIF_ADDRESS_SIZE-1:0] address_reg;
reg all_triangles_read_reg;

wire [((9*COORD_SIZE) + (3*COLOR_SIZE)):0] word;

tri_rom my_rom(
.address(address_reg),
.clock(clk),
.q(word));			
			
always @(posedge clk)
begin
	if (reset)
	begin	
		address_reg <= 0;	
	end
	else
	begin
		if (request_triangle)
		begin
			if (address_reg != (MAX_ADDRESS-1))
			begin		
				// Get a new triangle from the rom
				// Increment address
				address_reg <= address_reg + 1;
				all_triangles_read_reg <= 0;
			end						
			else
			begin
				address_reg <= 0;
				if (!all_triangles_read_reg) 
					all_triangles_read_reg <= 1;
				else all_triangles_read_reg <= 0;
			end
		end
		else
		begin
			all_triangles_read_reg <= 0;
		end	
	end
end

// Seperate out word
// Syntax is:
// VertexX, VertexY, VertexZ, Edge1X, Edge1Y, Edge1Z, Edge2X, Edge2Y, Edge2Z, R, G, B

assign vertex_x = word[(((9*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((8*COORD_SIZE) + (3*COLOR_SIZE))];
assign vertex_y = word[(((8*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((7*COORD_SIZE) + (3*COLOR_SIZE))];
assign vertex_z = word[(((7*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((6*COORD_SIZE) + (3*COLOR_SIZE))];	

assign edge1_x = word[(((6*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((5*COORD_SIZE) + (3*COLOR_SIZE))];
assign edge1_y = word[(((5*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((4*COORD_SIZE) + (3*COLOR_SIZE))];
assign edge1_z = word[(((4*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((3*COORD_SIZE) + (3*COLOR_SIZE))];	

assign edge2_x = word[(((3*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((2*COORD_SIZE) + (3*COLOR_SIZE))];
assign edge2_y = word[(((2*COORD_SIZE)) + (3*COLOR_SIZE) - 1):((COORD_SIZE) + (3*COLOR_SIZE))];
assign edge2_z = word[(((COORD_SIZE)) + (3*COLOR_SIZE) - 1):(3*COLOR_SIZE)];

assign r = word[((3*COLOR_SIZE)-1):(2*COLOR_SIZE)];
assign g = word[((2*COLOR_SIZE)-1):COLOR_SIZE];
assign b = word[(COLOR_SIZE-1):0];

assign all_triangles_read = all_triangles_read_reg;
assign address_reg_out = address_reg;

endmodule

