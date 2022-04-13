module runSequence (CLK, RST, L, R, scrollSpeed, RPixRUN, GPixRUN, RUNen, ENDen);
	input logic CLK, RST, L, R, RUNen;
	input logic [2:0] scrollSpeed;
	output logic [15:0][15:0] RPixRUN, GPixRUN;
	output logic ENDen;
	
	logic reset;
	assign reset = RST | ~RUNen; // start when enabled and not reset
	
	logic [15:0][15:0] RedPixels, GrnPixels;
	
	/* Collision comparator
	=========================*/
	
	
	// collision when green and red on at same time in LED
	logic check;
	collisionCompare collisionComp0 (.RedPixels, .GrnPixels, .check);
	
	logic [1:0] SR;
	assign SR = {check,1'b0};
	SR_FF collision0 (.SR, .Q(ENDen), .CLK, .RST(reset));
	
	/* astroid pixels (green)
	=========================*/
	
	// scroll speed selector
	logic [3:0] ROW;
	countersel speedsel0 (.CLK, .RST(reset), .MSB(ROW), .whichCounter(scrollSpeed));
	// asteroid pixel location
	asteroidLocation astLoc0 (.CLK, .RST(reset), .ROW, .GrnPixels);
	
	/* Ship pixels (red)
	=========================*/
	
	// Ship location
	shipLocation ship0 (.RedPixels, .L, .R, .RST(reset), .CLK);
	
	assign RPixRUN = RedPixels;
	assign GPixRUN = GrnPixels;
endmodule

//module runSequence_testbench();
//	input logic CLK, LED_CLOCK, RST, L, R;
//	input logic [2:0] scrollSpeed;
//	output logic [15:0][15:0] RPixRUN, GPixRUN;
//	output logic ENDen;
//endmodule