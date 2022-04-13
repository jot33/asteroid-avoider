module resetSequence (NOT_RST, CLK, PixRST, STARTen);
	input logic NOT_RST, CLK;
	output logic STARTen;
	output logic [15:0][15:0] PixRST;
	
		assign PixRST[00] = 16'b0001110001111000;
		assign PixRST[01] = 16'b0001001001000000;
		assign PixRST[02] = 16'b0001110001111000;
		assign PixRST[03] = 16'b0001100001000000;
		assign PixRST[04] = 16'b0001010001111000;
		assign PixRST[05] = 16'b0000000000000000;
		assign PixRST[06] = 16'b0000000000000000;
		assign PixRST[07] = 16'b0000000000000000;
		assign PixRST[08] = 16'b0000000000000000;
		assign PixRST[09] = 16'b0000000000000000;
		assign PixRST[10] = 16'b0000000000000000;
		assign PixRST[11] = 16'b1111011110111110;
		assign PixRST[12] = 16'b1000010000001000;
		assign PixRST[13] = 16'b1111011110001000;
		assign PixRST[14] = 16'b0001010000001000;
		assign PixRST[15] = 16'b1111011110001000;
	
	logic q0;
	RST_FF DRST0 (.q(q0), .d(NOT_RST), .CLK);
	RST_FF DRST1 (.q(STARTen), .d(q0), .CLK);
endmodule

//module resetSequence_testbench();
//	logic NOT_RST, CLK;
//	logic STARTen;
//	logic [15:0][15:0] PixRST;
//	
//	resetSequence dut (.NOT_RST, .CLK, .STARTen, .PixRST);
//	
//	// Set up a simulated  clock
//	parameter CLOCK_PERIOD = 100;
//	initial begin
//		CLK <= 0;
//		forever # (CLOCK_PERIOD/2) CLK <= ~CLK;	// Forever toggle clock
//	end
//	
//	initial begin
//		NOT_RST <= 0; repeat(2) @(posedge CLK);
//		NOT_RST <= 1; repeat(5) @(posedge CLK);
//		$stop;
//	end
//endmodule