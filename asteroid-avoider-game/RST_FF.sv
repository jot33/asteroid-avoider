// D flip-flop w/o reset used when input is RST signal
module RST_FF (q, d, CLK);
	output logic q;
	input logic d, CLK;
	
	always_ff @(posedge CLK) begin // Hold val until clock edge
		q <= d; // Otherwise out = d
	end
endmodule

//module RST_FF_testbench ();
//	logic CLOCK_50, KEY[3:0], SW[9:0], q1, q0, RST;
//	
//	RST_FF DFF0 (.q(q0), .d(KEY[3]), .RST(SW[9]), .CLK(CLOCK_50));
//	
//	RST_FF dut (.q(q1), .d(q0), .RST(SW[9]), .CLK(CLOCK_50));
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