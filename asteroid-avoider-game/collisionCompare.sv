module collisionCompare (RedPixels, GrnPixels, check);
	input logic [15:0][15:0] RedPixels, GrnPixels;
	output check;
	
	logic [15:0][15:0] collision;
	
	integer i,j;
	always_comb begin
		for (i=0; i<16; i++) begin
			for (j=0; j<16; j++) begin
				collision[i][j] = RedPixels[i][j] & GrnPixels[i][j];
			end
		end
	end
	
	collisionCheck collChk0 (.in(collision), .out(check));
endmodule

//module collisionCompare_testbench();
//	logic [15:0][15:0] RedPixels, GrnPixels;
//	logic check;
//	
//	collisionCompare dut (.RedPixels, .GrnPixels, .check);
//	
//	initial begin
//		RedPixels <= '0; GrnPixels <= '0; #10;
//		RedPixels[0][0] <= 1; #10;
//		GrnPixels[1][1] <= 1; #10;
//		GrnPixels[0][0] <= 1; #10;
//	end
//endmodule