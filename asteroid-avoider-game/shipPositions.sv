// James Lee
// University of Washington
// EE 271 Lab 8
// Fall 2021

// NOTE: This project has modified versions of the EE 271 Winter 2021 peripheral tutorial source files

// References (Last accessed 12/7/2021)
// 	1. Course Page: https://class.ece.uw.edu/271/hauck2/de1/index.html
//		2. Starter Files: https://class.ece.uw.edu/271/hauck2/de1/LEDboard/led_driver.zip

module shipPositions (position, RedPixels);
	input	logic [3:0]	position;
	output logic [15:0][15:0] RedPixels;
	
	logic [15:0][15:0] ShipPixels;
	
	// 13 possible ship positions
	// 0 = far left position
	// 12 = far right position
	always_comb begin
		case (position)
			4'b0000: begin // Position 0
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0110000000000000;
				ShipPixels[13] = 16'b0110000000000000;
				ShipPixels[14] = 16'b1111000000000000;
				ShipPixels[15] = 16'b1001000000000000;
			end
			
			4'b0001: begin // Position 1
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0011000000000000;
				ShipPixels[13] = 16'b0011000000000000;
				ShipPixels[14] = 16'b0111100000000000;
				ShipPixels[15] = 16'b0100100000000000;
			end
			
			4'b0010: begin // Position 2
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0001100000000000;
				ShipPixels[13] = 16'b0001100000000000;
				ShipPixels[14] = 16'b0011110000000000;
				ShipPixels[15] = 16'b0010010000000000;
			end
			
			4'b0011: begin // Position 3
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000110000000000;
				ShipPixels[13] = 16'b0000110000000000;
				ShipPixels[14] = 16'b0001111000000000;
				ShipPixels[15] = 16'b0001001000000000;
			end
			
			4'b0100: begin // Position 4
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000011000000000;
				ShipPixels[13] = 16'b0000011000000000;
				ShipPixels[14] = 16'b0000111100000000;
				ShipPixels[15] = 16'b0000100100000000;
			end
			
			4'b0101: begin // Position 5
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000001100000000;
				ShipPixels[13] = 16'b0000001100000000;
				ShipPixels[14] = 16'b0000011110000000;
				ShipPixels[15] = 16'b0000010010000000;
			end
			
			4'b0111: begin // Position 7
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000011000000;
				ShipPixels[13] = 16'b0000000011000000;
				ShipPixels[14] = 16'b0000000111100000;
				ShipPixels[15] = 16'b0000000100100000;
			end
			
			4'b1000: begin // Position 8
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000001100000;
				ShipPixels[13] = 16'b0000000001100000;
				ShipPixels[14] = 16'b0000000011110000;
				ShipPixels[15] = 16'b0000000010010000;
			end
			
			4'b1001: begin // Position 9
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000000110000;
				ShipPixels[13] = 16'b0000000000110000;
				ShipPixels[14] = 16'b0000000001111000;
				ShipPixels[15] = 16'b0000000001001000;
			end
			
			4'b1010: begin // Position 10
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000000011000;
				ShipPixels[13] = 16'b0000000000011000;
				ShipPixels[14] = 16'b0000000000111100;
				ShipPixels[15] = 16'b0000000000100100;
			end
			
			4'b1011: begin // Position 11
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000000001100;
				ShipPixels[13] = 16'b0000000000001100;
				ShipPixels[14] = 16'b0000000000011110;
				ShipPixels[15] = 16'b0000000000010010;
			end
			
			4'b1100: begin // Position 12
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000000000110;
				ShipPixels[13] = 16'b0000000000000110;
				ShipPixels[14] = 16'b0000000000001111;
				ShipPixels[15] = 16'b0000000000001001;
			end
			
			default: begin // position 6 (middle) is default
				ShipPixels[00] = 16'b0000000000000000;
				ShipPixels[01] = 16'b0000000000000000;
				ShipPixels[02] = 16'b0000000000000000;
				ShipPixels[03] = 16'b0000000000000000;
				ShipPixels[04] = 16'b0000000000000000;
				ShipPixels[05] = 16'b0000000000000000;
				ShipPixels[06] = 16'b0000000000000000;
				ShipPixels[07] = 16'b0000000000000000;
				ShipPixels[08] = 16'b0000000000000000;
				ShipPixels[09] = 16'b0000000000000000;
				ShipPixels[10] = 16'b0000000000000000;
				ShipPixels[11] = 16'b0000000000000000;
				ShipPixels[12] = 16'b0000000110000000;
				ShipPixels[13] = 16'b0000000110000000;
				ShipPixels[14] = 16'b0000001111000000;
				ShipPixels[15] = 16'b0000001001000000;
			end
		endcase
	end
	
	assign RedPixels = ShipPixels;
endmodule

//module shipPositions_testbench();
//	logic [3:0]	position;
//	logic [15:0][15:0] RedPixels;
//	
//	shipPositions dut (.position, .RedPixels);
//	
//	integer i;
//	initial begin
//		for (i=0; i<16; i++) begin
//			position = i; #10;
//		end
//	end
//endmodule