// James Lee
// University of Washington
// EE 271 Lab 8
// Fall 2021

// NOTE: This project has modified versions of the EE 271 Winter 2021 peripheral tutorial source files

// References (Last accessed 12/7/2021)
// 	1. Course Page: https://class.ece.uw.edu/271/hauck2/de1/index.html
//		2. Starter Files: https://class.ece.uw.edu/271/hauck2/de1/LEDboard/led_driver.zip

module pixelSel (RST, CLK, PixRST, PixSTART, RPixRUN, GPixRUN, PixEND, STARTen, RUNen, ENDen, RedPixels, GrnPixels);
	input logic RST, CLK, STARTen, RUNen, ENDen;
	input logic [15:0][15:0] PixRST, PixSTART, RPixRUN, GPixRUN, PixEND;
	output logic [15:0][15:0] RedPixels, GrnPixels;
	
	always_ff @(posedge CLK) begin
		if (ENDen) begin // End Condition
			RedPixels <= PixEND;
			GrnPixels <= '0;
		end
	
		else if (RUNen) begin // Run condition
			RedPixels <= RPixRUN;
			GrnPixels <= GPixRUN;
		end
		
		else if (STARTen) begin // Start condition
			RedPixels <= PixSTART;
			GrnPixels <= '0;
		end
		
		else begin // Reset condition
			RedPixels <= '0;
			GrnPixels <= PixRST;
		end
	end
	
endmodule

//module pixelSel_testbench();
//	logic RST, CLK, STARTen, RUNen, ENDen;
//	logic [15:0][15:0] PixRST, PixSTART, PixRUN, PixEND;
//	logic [15:0][15:0] RedPixels;
//	
//	shipPositions pos0 (.position(4'b0000), .RedPixels(PixRST));
//	shipPositions pos1 (.position(4'b0001), .RedPixels(PixSTART));
//	shipPositions pos2 (.position(4'b0010), .RedPixels(PixRUN));
//	shipPositions pos3 (.position(4'b0011), .RedPixels(PixEND));
//	
//	// Set up a simulated  clock
//	parameter CLOCK_PERIOD = 100;
//	initial begin
//		CLK <= 0;
//		forever # (CLOCK_PERIOD/2) CLK <= ~CLK;	// Forever toggle clock
//	end
//	
//	pixelSel dut (.RST, .CLK, .PixRST, .PixSTART, .RPixRUN, .GPixRUN, .PixEND, .STARTen, .RUNen, .ENDen, .RedPixels);
//	
//	initial begin
//		{ENDen, RUNen, STARTen} <= 3'b000;
//		RST <= 1; 				repeat(10) @(posedge CLK);
//		{RST, STARTen} <= 2'b01;	repeat(10) @(posedge CLK);
//		RUNen <= 1;				repeat(10) @(posedge CLK);
//		ENDen <= 1;				repeat(10) @(posedge CLK);
//		$stop;
//	end
//endmodule