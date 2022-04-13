// Counter select used for selecting different speed counters based on input
module countersel (CLK, RST, MSB, whichCounter);
	input logic	CLK, RST;
	input	logic [2:0]	whichCounter;
	output logic [3:0] MSB;
	
	logic [31:0] MSBs;
	logic	[7:0] EnableCounts;
	
	// Increasingly slower counter options
	rowcounter0 counter0 (.CLK, .RST, .MSB0(MSBs[3:0]), .EnableCount0(EnableCounts[0]));
	rowcounter1 counter1 (.CLK, .RST, .MSB1(MSBs[7:4]), .EnableCount1(EnableCounts[1]));
	rowcounter2 counter2 (.CLK, .RST, .MSB2(MSBs[11:8]), .EnableCount2(EnableCounts[2]));
	rowcounter3 counter3 (.CLK, .RST, .MSB3(MSBs[15:12]), .EnableCount3(EnableCounts[3]));
	rowcounter4 counter4 (.CLK, .RST, .MSB4(MSBs[19:16]), .EnableCount4(EnableCounts[4]));
	rowcounter5 counter5 (.CLK, .RST, .MSB5(MSBs[23:20]), .EnableCount5(EnableCounts[5]));
	rowcounter6 counter6 (.CLK, .RST, .MSB6(MSBs[27:24]), .EnableCount6(EnableCounts[6]));
	rowcounter7 counter7 (.CLK, .RST, .MSB7(MSBs[31:28]), .EnableCount7(EnableCounts[7]));
	
	logic [3:0] whichMSB;
	
	always_comb begin
		if 			(whichCounter == 3'b000) begin
			whichMSB = MSBs[3:0];
			EnableCounts = 8'b00000001;
		end else if (whichCounter == 3'b001) begin
			whichMSB = MSBs[7:4];
			EnableCounts = 8'b00000010;
		end else if (whichCounter == 3'b010) begin
			whichMSB = MSBs[11:8];
			EnableCounts = 8'b00000100;
		end else if (whichCounter == 3'b011) begin
			whichMSB = MSBs[15:12];
			EnableCounts = 8'b00001000;
		end else if (whichCounter == 3'b100) begin
			whichMSB = MSBs[19:16];
			EnableCounts = 8'b00010000;
		end else if (whichCounter == 3'b101) begin
			whichMSB = MSBs[23:20];
			EnableCounts = 8'b00100000;
		end else if (whichCounter == 3'b110) begin
			whichMSB = MSBs[27:24];
			EnableCounts = 8'b01000000;
		end else if (whichCounter == 3'b111) begin
			whichMSB = MSBs[31:28];
			EnableCounts = 8'b10000000;
		end else begin
			whichMSB = MSBs[3:0];
			EnableCounts = 8'b00000000;
		end
	end
	
	assign MSB = whichMSB;
endmodule