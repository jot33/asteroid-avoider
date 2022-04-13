// James Lee
// University of Washington
// EE 271 Lab 8
// Fall 2021

// NOTE: This project has modified versions of the EE 271 Winter 2021 peripheral tutorial source files

// References (Last accessed 12/7/2021)
// 	1. Course Page: https://class.ece.uw.edu/271/hauck2/de1/index.html
//		2. Starter Files: https://class.ece.uw.edu/271/hauck2/de1/LEDboard/led_driver.zip


// Counters take incoming clock and output repeated counts based on width
// MSB = 3 most significant bits
module rowcounter0 #(parameter FREQDIV = 27) (CLK, RST, MSB0, EnableCount0);
	input logic CLK, RST, EnableCount0;
	output logic [3:0]	MSB0;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB0 = Counter[(FREQDIV + 3):FREQDIV];

	logic reset;
	assign reset = RST | ~EnableCount0;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter1 #(parameter FREQDIV = 26) (CLK, RST, MSB1, EnableCount1);
	input logic CLK, RST, EnableCount1;
	output logic [3:0]	MSB1;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB1 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount1;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter2 #(parameter FREQDIV = 25) (CLK, RST, MSB2, EnableCount2);
	input logic CLK, RST, EnableCount2;
	output logic [3:0]	MSB2;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB2 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount2;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter3 #(parameter FREQDIV = 24) (CLK, RST, MSB3, EnableCount3);
	input logic CLK, RST, EnableCount3;
	output logic [3:0]	MSB3;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB3 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount3;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter4 #(parameter FREQDIV = 23) (CLK, RST, MSB4, EnableCount4);
	input logic CLK, RST, EnableCount4;
	output logic [3:0]	MSB4;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB4 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount4;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter5 #(parameter FREQDIV = 22) (CLK, RST, MSB5, EnableCount5);
	input logic CLK, RST, EnableCount5;
	output logic [3:0]	MSB5;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB5 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount5;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter6 #(parameter FREQDIV = 21) (CLK, RST, MSB6, EnableCount6);
	input logic CLK, RST, EnableCount6;
	output logic [3:0]	MSB6;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB6 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount6;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule

module rowcounter7 #(parameter FREQDIV = 20) (CLK, RST, MSB7, EnableCount7);
	input logic CLK, RST, EnableCount7;
	output logic [3:0]	MSB7;

   reg [(FREQDIV + 3):0] Counter;
   assign MSB7 = Counter[(FREQDIV + 3):FREQDIV];

   logic reset;
	assign reset = RST | ~EnableCount7;
	
   always_ff @(posedge CLK)
   begin
		if(reset) Counter <= 'b0;
		else Counter <= Counter + 1'b1;
	end
endmodule