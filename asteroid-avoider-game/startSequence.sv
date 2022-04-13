module startSequence (RST, CLK, PixSTART, STARTen, RUNen);
	input logic RST, CLK, STARTen;
	output logic [15:0][15:0] PixSTART;
	output logic RUNen;
	
	logic reset;
	assign reset = RST | ~STARTen;
	
	// count 0.75Hz
	logic [3:0] count;
	// Uncomment one 
	rowcounter0 #(.FREQDIV(25)) startCounter0 (.CLK, .RST(reset), .MSB0(count), .EnableCount0(STARTen)); // board
//	rowcounter0 #(.FREQDIV(2)) startCounter0 (.CLK, .RST(reset), .MSB0(count), .EnableCount0(STARTen)); // simulation
	
	logic [3:0] ps,ns;
	logic [1:0] SR_hold, SR_RUNen;
	logic hold;
	
	// SR latches for holding final display and RUNen signal
	SR_FF holdSR (.SR(SR_hold), .Q(hold), .CLK, .RST(reset));
	SR_FF RUNSR (.SR(SR_RUNen), .Q(RUNen), .CLK, .RST(reset));
	
	
	always_ff @(posedge CLK) begin
		if (reset) begin // reset to 0
			ps <= '0;
			SR_hold <= 2'b01;
			SR_RUNen <= 2'b01;
		end else if (count == 4) begin
			ps <= 4;
			SR_hold <= 2'b10;
		end else if (count == 5) begin
			ps <= 5;
			SR_RUNen <= 2'b10;
		end else if (hold) begin
			ps <= 6;
		end else
			ps <= count;
	end
	
	// Instantiate start sequence positions
	
	logic [3:0] STARTpos;
	assign STARTpos = ps;
	
	startPositions startPos0 (.STARTpos, .PixSTART);
endmodule

//module startSequence_testbench();
//	logic RST, CLK, STARTen;
//	logic [15:0][15:0] PixSTART;
//	logic RUNen;
//	
//	// Set up a simulated clock
//	parameter CLOCK_PERIOD=100;
//	initial begin
//		CLK <= 0;
//		forever #(CLOCK_PERIOD/2) CLK <= ~CLK;	// Forever toggle the clock
//	end
//	
//	startSequence dut (.RST, .CLK, .PixSTART, .STARTen, .RUNen);
//	
//	initial begin
//		RST <= 1; STARTen <= 0; repeat(1) @(posedge CLK);
//		RST <= 0; repeat(1) @(posedge CLK);
//		STARTen <= 1; repeat(60) @(posedge CLK);
//		$stop;
//	end
//endmodule