// User Input signal translates key press into single pulse
module UserInput (out, in, CLK, RST);
	input logic in, CLK, RST;
	output logic out;
	
	// Set up 3 DFF in series, which will all be offset by a clock cycle
	logic q0, q1, q2;
	D_FF DFF0 (.q(q0), .d(in), .RST, .CLK);
	D_FF DFF1 (.q(q1), .d(q0), .RST, .CLK);
	D_FF DFF2 (.q(q2), .d(q1), .RST, .CLK);
	
	assign out = q1 & ~q2; // output only one cycle when q1 and q2 are offset
	
endmodule

//module UserInput_testbench();
//
//	logic CLOCK_50, KEY[3:0], SW[9:0], out;
//	
//	UserInput dut (.out, .in(KEY[3]), .CLK(CLOCK_50), .RST(SW[9]));
//	
//	// Set up a simulated  clock
//	parameter CLOCK_PERIOD = 100;
//	initial begin
//		CLOCK_50 <= 0;
//		forever # (CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50;	// Forever toggle clock
//	end
//	
//	initial begin
//							repeat(1) @(posedge CLOCK_50);
//		SW[9] 	<= 1;	KEY[3] <= 0; repeat(4) @(posedge CLOCK_50);	// reset on, key press off
//		SW[9]		<=	0;	repeat(1) @(posedge CLOCK_50);	// reset off
//		KEY[3]	<=	1;	repeat(4) @(posedge CLOCK_50);	// key press on (long)
//		KEY[3]	<= 0;	repeat(4) @(posedge CLOCK_50);	// key press off
//		KEY[3]	<=	1;	repeat(1) @(posedge CLOCK_50);	// key press on (short)
//		KEY[3]	<= 0;	repeat(4) @(posedge CLOCK_50);	// key press off
//		KEY[3]	<= 1;	repeat(1) @(posedge CLOCK_50);	// key press on
//		SW[9]		<= 1;	repeat(5) @(posedge CLOCK_50);	// reset on
//		$stop;	// end simulation
//	end
//endmodule