// Ship Location maps user inputs to ship pixel location
module shipLocation (RedPixels, L, R, RST, CLK);
	input logic               	RST, CLK, L, R; //clock, reset, left, right
	output logic [15:0][15:0] 	RedPixels; // 16x16 array of red LEDs

	logic [3:0]	ps, ns; // position present state, next state
	
	// 13 possible ship positions
	// 0 = far left position
	// 12 = far right position
	always_comb begin
		// Conditions
		// (R && L): 	simultaneous key press -> no change
		// (R):			R input -> move right 1
		// (L): 			L input -> move left 1
		//					No input -> no change
		case (ps)
			4'b0000: begin // Position 0
				if (R && L) ns = 4'b0000;
				else if (L) ns = 4'b0000; // no change at edge
				else if (R) ns = 4'b0001;
				else			ns = 4'b0000;
			end
			4'b0001: begin // Position 1
				if (R && L) ns = 4'b0001;
				else if (L) ns = 4'b0000;
				else if (R) ns = 4'b0010;
				else			ns = 4'b0001;
			end
			4'b0010: begin // Position 2
				if (R && L) ns = 4'b0010;
				else if (L) ns = 4'b0001;
				else if (R) ns = 4'b0011;
				else			ns = 4'b0010;
			end
			4'b0011: begin // Position 3
				if (R && L) ns = 4'b0011;
				else if (L) ns = 4'b0010;
				else if (R) ns = 4'b0100;
				else			ns = 4'b0011;
			end
			4'b0100: begin // Position 4
				if (R && L) ns = 4'b0100;
				else if (L) ns = 4'b0011;
				else if (R) ns = 4'b0101;
				else			ns = 4'b0100;
			end
			4'b0101: begin // Position 5
				if (R && L) ns = 4'b0101;
				else if (L) ns = 4'b0100;
				else if (R) ns = 4'b0110;
				else			ns = 4'b0101;
			end
			4'b0111: begin // Position 7
				if (R && L) ns = 4'b0111;
				else if (L) ns = 4'b0110;
				else if (R) ns = 4'b1000;
				else			ns = 4'b0111;
			end
			4'b1000: begin // Position 8
				if (R && L) ns = 4'b1000;
				else if (L) ns = 4'b0111;
				else if (R) ns = 4'b1001;
				else			ns = 4'b1000;
			end
			4'b1001: begin // Position 9
				if (R && L) ns = 4'b1001;
				else if (L) ns = 4'b1000;
				else if (R) ns = 4'b1010;
				else			ns = 4'b1001;
			end
			4'b1010: begin // Position 10
				if (R && L) ns = 4'b1010;
				else if (L) ns = 4'b1001;
				else if (R) ns = 4'b1011;
				else			ns = 4'b1010;
			end
			4'b1011: begin // Position 11
				if (R && L) ns = 4'b1011;
				else if (L) ns = 4'b1010;
				else if (R) ns = 4'b1100;
				else			ns = 4'b1011;
			end
			4'b1100: begin // Position 12
				if (R && L) ns = 4'b1100;
				else if (L) ns = 4'b1011;
				else if (R) ns = 4'b1100; // no change at edge
				else			ns = 4'b1100;
			end
			default: begin // Position 6 (center)
				if (R && L) ns = 4'b0110;
				else if (L) ns = 4'b0101;
				else if (R) ns = 4'b0111;
				else			ns = 4'b0110;
			end
		endcase
	end
	
	
	// DFFs
	always_ff @(posedge CLK) begin
		if 		(RST)	ps <= 4'b0110;
		else				ps <= ns;
	end
	
	
	// instantiate position to pixel map
	logic [3:0] position;
	assign position = ps;
	shipPositions shipPos0 (.position, .RedPixels);
endmodule