module endSequence (RST, CLK, ENDen, PixEND);
	input logic RST, CLK, ENDen;
	output logic [15:0][15:0] PixEND;

	
	logic [3:0] ps;
	logic [1:0] S_hold;
	logic hold;
	
	// SR latch for holding final end display
	SR_FF holdSR (.SR(S_hold), .Q(hold), .CLK, .RST);

	logic reset;
	assign reset = RST | ~ENDen;
	
	logic [3:0] count;
	// Uncomment 1 counter
	rowcounter0 #(.FREQDIV(25)) endcounter (.CLK, .RST, .MSB0(count), .EnableCount0(ENDen)); // board
//	rowcounter0 #(.FREQDIV(2)) endcounter (.CLK, .RST, .MSB0(count), .EnableCount0(ENDen)); // simulation
	
	always_ff @(posedge CLK) begin
		if (reset) begin // reset to 0
			ps <= '0;
			S_hold <= 2'b01;
		end else if (count == 4'b0110) begin
			ps <= count;
			S_hold <= 2'b10;
		end else if (hold) begin
			ps <= 4'b0110;
		end else
			ps <= count;
	end
	
	// Instantiate end sequence positions
	logic [3:0] position;
	assign position = ps;
	
	endExplode end0 (.position, .PixEND);
endmodule

//module endSequence_testbench();
//	logic RST, CLK, ENDen;
//	logic [15:0][15:0] PixEND;
//	
//	// Set up a simulated clock
//	parameter CLOCK_PERIOD=100;
//	initial begin
//		CLK <= 0;
//		forever #(CLOCK_PERIOD/2) CLK <= ~CLK;	// Forever toggle the clock
//	end
//	
//	endSequence dut (.RST, .CLK, .ENDen, .PixEND);
//	
//	integer i;
//	initial begin
//		RST <= 1; ENDen <= 0; repeat(2) @(posedge CLK);
//		RST <= 0; repeat(2) @(posedge CLK);
//		ENDen <= 1; repeat(80) @(posedge CLK);
//		$stop;
//	end
//endmodule