// D flip-flop w/synchronous reset
module D_FF (q, d, RST, CLK);
	output logic q;
	input logic d, RST, CLK;
	
	always_ff @(posedge CLK) begin // Hold val until clock edge
		if (RST)
			q <= 0; // On reset, set to 0
		else
			q <= d; // Otherwise out = d
	end
endmodule

//module D_FF_testbench ();
//	logic CLOCK_50, KEY[3:0], SW[9:0], q1, q0, RST;
//	
//	D_FF DFF0 (.q(q0), .d(KEY[3]), .RST(SW[9]), .CLK(CLOCK_50));
//	
//	D_FF dut (.q(q1), .d(q0), .RST(SW[9]), .CLK(CLOCK_50));
//	
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
//		KEY[3]	<=	1;	repeat(4) @(posedge CLOCK_50);	// key press on
//		KEY[3]	<= 0;	repeat(4) @(posedge CLOCK_50);	// key press off
//		KEY[3]	<= 1;	repeat(4) @(posedge CLOCK_50);	// key press on
//		SW[9]		<= 1;	repeat(5) @(posedge CLOCK_50);	// reset on
//		$stop;	// end simulation
//	end
//	
//endmodule