// Column Choice maps a 4-bit choice to a 16-bit pixel row
module columnChoice (choice, COL);
	input logic [3:0] choice;
	output logic [15:0] COL;
	
	
	always_comb begin
		case(choice)
			0:  COL = 16'b0000000000000001;
			1:  COL = 16'b0000000000000010;
			2:  COL = 16'b0000000000000100;
			3:  COL = 16'b0000000000001000;
			4:  COL = 16'b0000000000010000;
			5:  COL = 16'b0000000000100000;
			6:  COL = 16'b0000000001000000;
			7:  COL = 16'b0000000010000000;
			8:  COL = 16'b0000000100000000;
			9:  COL = 16'b0000001000000000;
			10: COL = 16'b0000010000000000;
			11: COL = 16'b0000100000000000;
			12: COL = 16'b0001000000000000;
			13: COL = 16'b0010000000000000;
			14: COL = 16'b0100000000000000;
			15: COL = 16'b1000000000000000;
			default: COL = 0;
		endcase
	end
endmodule

//module columnChoice_testbench();
//	logic [3:0] choice;
//	integer COL;
//	
//	columnChoice dut (.choice, .COL);
//	
//	initial begin
//		choice <= 0; #10;
//		choice <= 4; #10;
//		choice <= 10; #10;
//	end
//endmodule