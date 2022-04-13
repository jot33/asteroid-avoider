module LSFR10b (out, RST, CLK);
	input 	logic			RST, CLK;
	output 	logic [9:0]	out;
	
	logic q1,q2,q3,q4,q5,q6,q7,q8,q9,q10;
	logic fb; // feedback
	assign fb = ~( q10 ^ q7 ); // XNOR q10 and q7

	D_FF D1	(.q(q1), .d(fb), .RST, .CLK);
	D_FF D2	(.q(q2), .d(q1), .RST, .CLK);
	D_FF D3	(.q(q3), .d(q2), .RST, .CLK);
	D_FF D4	(.q(q4), .d(q3), .RST, .CLK);
	D_FF D5	(.q(q5), .d(q4), .RST, .CLK);
	D_FF D6	(.q(q6), .d(q5), .RST, .CLK);
	D_FF D7	(.q(q7), .d(q6), .RST, .CLK);
	D_FF D8	(.q(q8), .d(q7), .RST, .CLK);
	D_FF D9	(.q(q9), .d(q8), .RST, .CLK);
	D_FF D10	(.q(q10), .d(q9), .RST, .CLK);
	
	assign out = {q10,q9,q8,q7,q6,q5,q4,q3,q2,q1};
endmodule

//module LSFR10b_testbench();
//	logic 		RST, CLOCK_50;
//	logic [9:0]	out;
//	
//	// Set up a simulated  clock
//	parameter CLOCK_PERIOD = 100;
//	
//	initial begin
//		CLOCK_50 <= 0;
//		forever # (CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50;	// Forever toggle clock
//	end
//	
//	LSFR10b dut (.out, .RST, .CLK(CLOCK_50));
//	
//	initial begin
//											@(posedge CLOCK_50);
//		RST <= 1;						@(posedge CLOCK_50);	// RST
//		// Run for 2^n + 2 cycles
//		// Check beginning and end
//		// Sequence should restart after 2^n
//		RST <= 0;	repeat(1026)	@(posedge CLOCK_50);	// run for 2^n + 2 cycles
//		$stop;	// End the simulatioin
//	end
//endmodule