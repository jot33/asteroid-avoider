module SR_FF (SR, Q, CLK, RST);
	input logic CLK, RST;
	input logic [1:0] SR;
	output logic Q;
	
	logic ps;
	
	always_ff @(posedge CLK) begin
		if (RST) begin
			ps <= 0;
		end else if (SR == 2'b00) begin
			ps <= ps;
		end else if (SR == 2'b01) begin
			ps <= 0;
		end else if (SR == 2'b10) begin
			ps <= 1;
		end else begin
			ps <= 1'bX;
		end
	end
	
	assign Q = ps;
endmodule

//module SR_FF_testbench();
//	logic CLK, RST;
//	logic [1:0] SR;
//	logic Q;
//	
//	// Set up a simulated  clock
//	parameter CLOCK_PERIOD = 100;
//	initial begin
//		CLK <= 0;
//		forever # (CLOCK_PERIOD/2) CLK <= ~CLK;	// Forever toggle clock
//	end
//	
//	SR_FF dut (.SR, .Q, .CLK, .RST);
//	
//	initial begin
//		RST <= 1;
//		SR = 2'b00;	repeat(1) @(posedge CLK);
//		RST <= 0;
//		SR = 2'b10;	repeat(2) @(posedge CLK);
//		SR = 2'b00;	repeat(4) @(posedge CLK);
//		SR = 2'b01;	repeat(2) @(posedge CLK);
//		SR = 2'b00;	repeat(4) @(posedge CLK);
//		SR = 2'b11;	repeat(4) @(posedge CLK);
//		$stop;
//	end
//endmodule