// James Lee
// University of Washington
// EE 271 Lab 8
// Fall 2021

// NOTE: This project has modified versions of the EE 271 Winter 2021 peripheral tutorial source files

// References (Last accessed 12/7/2021)
// 	1. Course Page: https://class.ece.uw.edu/271/hauck2/de1/index.html
//		2. Starter Files: https://class.ece.uw.edu/271/hauck2/de1/LEDboard/led_driver.zip

// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
	output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0]  LEDR;
	input  logic [3:0]  KEY;
	input  logic [9:0]  SW;
	output logic [35:0] GPIO_1;
	input logic CLOCK_50;

	// Turn off HEX displays
	assign HEX0 = '1;
	assign HEX1 = '1;
	assign HEX2 = '1;
	assign HEX3 = '1;
	assign HEX4 = '1;
	assign HEX5 = '1;

	// Assign reset input
	logic RST, NOT_RST, qRST0, qNRST0, dRST, dNRST; // reset - toggle this on startup
	assign dRST = SW[9];
	assign dNRST = ~SW[9];
	
	// feed SW9 to RST, NOT_RST through 2 DFF to prevent metastable inputs
	RST_FF DRST0 (.q(qRST0), .d(dRST), .CLK(CLOCK_50)); // input SW9
	RST_FF DRST1 (.q(RST), .d(qRST0), .CLK(CLOCK_50)); // feed to next DFF
	RST_FF DNRST0 (.q(qNRST0), .d(dNRST), .CLK(CLOCK_50)); // input ~SW9
	RST_FF DNRST1 (.q(NOT_RST), .d(qNRST0), .CLK(CLOCK_50)); // feed to next DFF
	 
	/* Set up LED base clock
	============================================================
	*	CLOCK_50 = System clock for key and switch inputs (50 MHz)
	*	LED_CLOCK = top-level LED clock
		*	LED clock chosen for max brightness and min flicker
	*	Example divider calculation
		*	clk[14] --> (50 MHz / 2**(14+1)) = 1526 Hz 
	 ===========================================================*/

//	logic [31:0] clk;
//	logic LED_CLOCK;
//
//	clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
//
//	assign LED_CLOCK = clk[14]; // 1526 Hz clock signal	 

	/* If you notice flickering, set LED_CLOCK faster.
	However, this may reduce the brightness of the LED board. */


	/* Reset sequence
	===================================================================
	Sets display for reset condition
	Outputs START flag when sequence finished
	=================================================================== */
	logic STARTen;
	logic [15:0][15:0] PixRST;
	
	resetSequence RSTseq0 (.NOT_RST, .CLK(CLOCK_50), .PixRST, .STARTen);


	/* Start sequence
	===================================================================
	Starts on STARTen flag from reset sequence
	Sets display for start condition
	Outputs RUN enable flag when sequence finished
	=================================================================== */
	logic RUNen; // Run sequence enable
	logic [15:0][15:0] PixSTART;

	startSequence STARTSeq0 (.RST, .CLK(CLOCK_50), .PixSTART, .STARTen, .RUNen);
	 
	/* Run sequence
	===================================================================
	Starts on RUNen flag from start sequence
	Sets display for reset condition
	Outputs END enable flag when sequence finished
	=================================================================== */
	logic ENDen; // End sequence enables
	logic [15:0][15:0] RPixRUN, GPixRUN;
	
	// User inputs
	logic L, R;
	UserInput RKey(.out(R), .in(~KEY[0]), .CLK(CLOCK_50), .RST); // move right
	UserInput LKey(.out(L), .in(~KEY[3]), .CLK(CLOCK_50), .RST); // move left
	 
	// Set scroll speed with switch inputs, use D_FF for metastability
	logic q0SW0, q1SW0, q0SW1, q1SW1, q0SW2, q1SW2;
	D_FF Dq0SW0 (.q(q0SW0), .d(SW[0]), .RST, .CLK(CLOCK_50));
	D_FF Dq1SW0 (.q(q1SW0), .d(q0SW0), .RST, .CLK(CLOCK_50));
	D_FF Dq0SW1 (.q(q0SW1), .d(SW[1]), .RST, .CLK(CLOCK_50));
	D_FF Dq1SW1 (.q(q1SW1), .d(q0SW1), .RST, .CLK(CLOCK_50));
	D_FF Dq0SW2 (.q(q0SW2), .d(SW[2]), .RST, .CLK(CLOCK_50));
	D_FF Dq1SW2 (.q(q1SW2), .d(q0SW2), .RST, .CLK(CLOCK_50));
	
	logic [2:0] scrollSpeed;
	assign scrollSpeed = {q1SW2, q1SW1, q1SW0};
	
	runSequence RUNseq0 (.CLK(CLOCK_50), .RST, .L, .R, .scrollSpeed, .RPixRUN, .GPixRUN, .RUNen, .ENDen);
	 
	/* End sequence
	===================================================================
	Starts on ENDen flag from start sequence
	=================================================================== */
	logic [15:0][15:0] PixEND;
	
	endSequence ENDseq0 (.RST, .CLK(CLOCK_50), .ENDen, .PixEND);
	 
	 
	/* Pixel Selector
	===================================================================
	Choses which pixel configuration to input to LEDdriver
	Based on enable flags
	=================================================================== */
	pixelSel pixelSel0 (.RST, .CLK(CLOCK_50), .PixRST, .PixSTART, .RPixRUN, .GPixRUN, .PixEND, .STARTen, .RUNen, .ENDen, .RedPixels, .GrnPixels);

	/* LED board driver
	================================================================== */
	logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
	logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 
	// Set counter to adust refresh rate
	
	logic [3:0] RowSelect, RSTRowSelect;
	rowcounter0 #(.FREQDIV(14)) LEDrow0 (.CLK(CLOCK_50), .RST, .MSB0(RowSelect), .EnableCount0(1));
	rowcounter0 #(.FREQDIV(14)) LEDrow1 (.CLK(CLOCK_50), .RST(NOT_RST), .MSB0(RSTRowSelect), .EnableCount0(1));

	// Modified LEDDriver to put counter in separate module
	LEDDriver Driver (.RST, .RedPixels, .GrnPixels, .GPIO_1, .RowSelect, .RSTRowSelect);
endmodule