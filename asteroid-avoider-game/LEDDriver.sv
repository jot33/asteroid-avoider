// James Lee
// University of Washington
// EE 271 Lab 8
// Fall 2021

// NOTE: This project has modified versions of the EE 271 Winter 2021 peripheral tutorial source files

// References (Last accessed 12/7/2021)
// 	1. Course Page: https://class.ece.uw.edu/271/hauck2/de1/index.html
//		2. Starter Files: https://class.ece.uw.edu/271/hauck2/de1/LEDboard/led_driver.zip

// A driver for the 16x16x2 LED display expansion board.
// Read below for an overview of the ports.
// IMPORTANT: You do not need to necessarily modify this file. But if you do, be sure you know what you are doing.

// FREQDIV: (Parameter) Sets the scanning speed (how often the display cycles through rows)
//          The CLK input divided by 2^(FREQDIV) is the interval at which the driver switches rows.
// GPIO_1: (Output) The 36-pin GPIO1 header, as on the DE1-SoC board.
// RedPixels: (Input) A 16x16 array of logic items corresponding to the red pixels you'd like to have lit on the display.
// GrnPixels: (Input) A 16x16 array of logic items corresponding to the green pixels you'd like to have lit on the display.
// EnableCount: (Input) Whether to continue moving through the rows.
// CLK: (Input) The system clock.
// RST: (Input) Resets the display driver. Required during startup before use.
module LEDDriver (RST, GPIO_1, RedPixels, GrnPixels, RowSelect, RSTRowSelect);
    output logic [35:0] GPIO_1;
    input logic [15:0][15:0] RedPixels ;
    input logic [15:0][15:0] GrnPixels ;
	 input logic [3:0] RowSelect, RSTRowSelect;
	 input logic RST;
	 
	 logic [3:0] whichRowSelect;
	 
	 always_comb begin
		case (RST)
			0: whichRowSelect = RowSelect;
			default: whichRowSelect = RSTRowSelect;
		endcase
	 end
    
    assign GPIO_1[35:32] = whichRowSelect;
    assign GPIO_1[31:16] = { GrnPixels[whichRowSelect][0], GrnPixels[whichRowSelect][1], GrnPixels[whichRowSelect][2], GrnPixels[whichRowSelect][3], GrnPixels[whichRowSelect][4], GrnPixels[whichRowSelect][5], GrnPixels[whichRowSelect][6], GrnPixels[whichRowSelect][7], GrnPixels[whichRowSelect][8], GrnPixels[whichRowSelect][9], GrnPixels[whichRowSelect][10], GrnPixels[whichRowSelect][11], GrnPixels[whichRowSelect][12], GrnPixels[whichRowSelect][13], GrnPixels[whichRowSelect][14], GrnPixels[whichRowSelect][15] };
    assign GPIO_1[15:0] = { RedPixels[whichRowSelect][0], RedPixels[whichRowSelect][1], RedPixels[whichRowSelect][2], RedPixels[whichRowSelect][3], RedPixels[whichRowSelect][4], RedPixels[whichRowSelect][5], RedPixels[whichRowSelect][6], RedPixels[whichRowSelect][7], RedPixels[whichRowSelect][8], RedPixels[whichRowSelect][9], RedPixels[whichRowSelect][10], RedPixels[whichRowSelect][11], RedPixels[whichRowSelect][12], RedPixels[whichRowSelect][13], RedPixels[whichRowSelect][14], RedPixels[whichRowSelect][15] };
endmodule

//module LEDDriver_Test();
//    logic CLK, RST, EnableCount;
//    logic [15:0][15:0]RedPixels;
//    logic [15:0][15:0]GrnPixels;
//    logic [35:0] GPIO_1;
//
//    LEDDriver #(.FREQDIV(2)) Driver(.GPIO_1, .RedPixels, .GrnPixels, .EnableCount, .CLK, .RST);
//    
//    initial
//    begin
//        CLK <= 1'b0;
//        forever #50 CLK <= ~CLK;
//    end
//
//    initial
//    begin
//        EnableCount <= 1'b0;
//        RedPixels <= '{default:0};
//        GrnPixels <= '{default:0};
//        @(posedge CLK);
//
//        RST <= 1; @(posedge CLK);
//        RST <= 0; @(posedge CLK);
//        @(posedge CLK); @(posedge CLK); @(posedge CLK);
//
//        GrnPixels[1][1] <= 1'b1; @(posedge CLK);
//        EnableCount <= 1'b1; @(posedge CLK); #1000;
//        RedPixels[2][2] <= 1'b1;
//        RedPixels[2][3] <= 1'b1;
//        GrnPixels[2][3] <= 1'b1; @(posedge CLK); #1000;
//        EnableCount <= 1'b0; @(posedge CLK); #1000;
//        GrnPixels[1][1] <= 1'b0; @(posedge CLK);
//        $stop;
//
//    end
//endmodule
//
//module LEDDriver_TestPhysical(CLOCK_50, RST, Speed, GPIO_1);
//    input logic CLOCK_50, RST;
//    input logic [9:0] Speed;
//    output logic [35:0] GPIO_1;
//    logic [15:0][15:0]RedPixels;
//    logic [15:0][15:0]GrnPixels;
//    logic [31:0] Counter;
//    logic EnableCount;
//
//    LEDDriver #(.FREQDIV(15)) Driver (.CLK(CLOCK_50), .RST, .EnableCount, .RedPixels, .GrnPixels, .GPIO_1);
//
//    //                       F E D C B A 9 8 7 6 5 4 3 2 1 0
//    assign RedPixels[00] = '{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
//    assign RedPixels[01] = '{1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1};
//    assign RedPixels[02] = '{1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1};
//    assign RedPixels[03] = '{1,0,1,1,0,0,0,0,0,0,0,0,1,1,0,1};
//    assign RedPixels[04] = '{1,0,1,0,1,1,1,1,1,1,1,1,0,1,0,1};
//    assign RedPixels[05] = '{1,0,1,0,1,1,0,0,0,0,1,1,0,1,0,1};
//    assign RedPixels[06] = '{1,0,1,0,1,0,1,1,1,1,0,1,0,1,0,1};
//    assign RedPixels[07] = '{1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1};
//    assign RedPixels[08] = '{1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1};
//    assign RedPixels[09] = '{1,0,1,0,1,0,1,1,1,1,0,1,0,1,0,1};
//    assign RedPixels[10] = '{1,0,1,0,1,1,0,0,0,0,1,1,0,1,0,1};
//    assign RedPixels[11] = '{1,0,1,0,1,1,1,1,1,1,1,1,0,1,0,1};
//    assign RedPixels[12] = '{1,0,1,1,0,0,0,0,0,0,0,0,1,1,0,1};
//    assign RedPixels[13] = '{1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1};
//    assign RedPixels[14] = '{1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1};
//    assign RedPixels[15] = '{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
//
//    assign GrnPixels[00] = '{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1};
//    assign GrnPixels[01] = '{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0};
//    assign GrnPixels[02] = '{0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0};
//    assign GrnPixels[03] = '{0,1,0,1,1,1,1,1,1,1,1,1,1,0,1,0};
//    assign GrnPixels[04] = '{0,1,0,1,1,0,0,0,0,0,0,1,1,0,1,0};
//    assign GrnPixels[05] = '{0,1,0,1,0,1,1,1,1,1,1,0,1,0,1,0};
//    assign GrnPixels[06] = '{0,1,0,1,0,1,1,0,0,1,1,0,1,0,1,0};
//    assign GrnPixels[07] = '{0,1,0,1,0,1,0,1,0,0,1,0,1,0,1,0};
//    assign GrnPixels[08] = '{0,1,0,1,0,1,0,0,1,0,1,0,1,0,1,0};
//    assign GrnPixels[09] = '{0,1,0,1,0,1,1,0,0,1,1,0,1,0,1,0};
//    assign GrnPixels[10] = '{0,1,0,1,0,1,1,1,1,1,1,0,1,0,1,0};
//    assign GrnPixels[11] = '{0,1,0,1,1,0,0,0,0,0,0,1,1,0,1,0};
//    assign GrnPixels[12] = '{0,1,0,1,1,1,1,1,1,1,1,1,1,0,1,0};
//    assign GrnPixels[13] = '{0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0};
//    assign GrnPixels[14] = '{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0};
//    assign GrnPixels[15] = '{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1};
//
//    always_ff @(posedge CLOCK_50)
//    begin
//        if(RST) Counter <= 'b0;
//        else
//        begin
//            Counter <= Counter + 1'b1;
//            if(Counter >= Speed)
//            begin
//                EnableCount <= 1'b1;
//                Counter <= 'b0;
//            end
//            else EnableCount <= 1'b0;
//        end
//    end
//endmodule