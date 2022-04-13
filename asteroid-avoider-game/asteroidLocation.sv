module asteroidLocation (CLK, RST, ROW, GrnPixels, RUNen);
	input logic CLK, RST, RUNen;
	input logic [3:0] ROW;
	output logic [15:0][15:0] GrnPixels;

	logic [15:0][15:0] ps,ns;
	
	// LSFR chooses pseudorandom column
	logic [9:0] COLchoice;
	LSFR10b randColGen0 (.out(COLchoice), .RST, .CLK);
	
	// choice toggle latches choice at beginning of ROW count sequence
	logic [3:0] choice, choice_in;
	assign choice_in = COLchoice[3:0];
	choiceToggle toggle0 (.choice, .choice_in, .ROW, .RST, .CLK);
	
	// maps choice value to column pixel for given row
	logic [15:0] COL;
	columnChoice colChoice0 (.choice, .COL);
	
	always_comb begin
		case (ROW)
		0:  begin ns = '0; ns[00] = COL; end
		1:  begin ns = '0; ns[01] = COL; end
		2:  begin ns = '0; ns[02] = COL; end
		3:  begin ns = '0; ns[03] = COL; end
		4:  begin ns = '0; ns[04] = COL; end
		5:  begin ns = '0; ns[05] = COL; end
		6:  begin ns = '0; ns[06] = COL; end
		7:  begin ns = '0; ns[07] = COL; end
		8:  begin ns = '0; ns[08] = COL; end
		9:  begin ns = '0; ns[09] = COL; end
		10: begin ns = '0; ns[10] = COL; end
		11: begin ns = '0; ns[11] = COL; end
		12: begin ns = '0; ns[12] = COL; end
		13: begin ns = '0; ns[13] = COL; end
		14: begin ns = '0; ns[14] = COL; end
		15: begin ns = '0; ns[15] = COL; end
		default: begin ns = '0; end// all pixels off by default
		endcase
	end
	
	always_ff @(posedge CLK) begin
		if (RST) begin
			ps <= '0;
		end else begin
			ps <= ns;
		end
	end
	
	assign GrnPixels = ps;
	
endmodule

//module asteroidLocation_testbench();
//	logic CLK, RST;
//	logic [3:0] ROW;
//	logic [15:0][15:0] GrnPixels;
//	
//	// Set up a simulated  clock
//	parameter CLOCK_PERIOD = 100;
//	
//	initial begin
//		CLK <= 0;
//		forever # (CLOCK_PERIOD/2) CLK <= ~CLK;	// Forever toggle clock
//	end
//	
//	asteroidLocation dut (.CLK, .RST, .ROW, .GrnPixels);
//	integer i,j;
//	initial begin
//		RST <=1; ROW <= '0; @(posedge CLK);
//		RST <=0; @(posedge CLK);
//		for (j=0; j<3; j++) begin
//			for (i=0; i<16; i++) begin
//				ROW = i; @(posedge CLK);
//			end
//		end
//		$stop;
//	end
//endmodule