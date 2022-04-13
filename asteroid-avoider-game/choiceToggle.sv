// Choice Toggle updates column choice and beginning of count sequence
module choiceToggle (choice, choice_in, ROW, RST, CLK);
	input logic RST, CLK;
	input logic [3:0] choice_in, ROW;
	output logic [3:0] choice;
	
	logic d;
	
	always_comb begin
		case (ROW)
			0: d = 1; // set toggle only at beggining of clock cycle
			default d = 0;
		endcase
	end
	
	// use offset of flip flops to output one toggle pulse
	// CLK cycle is much faster than ROW count sequence
	logic toggle, q0, q1, q2;
	D_FF Dtoggle0 (.q(q0), .d, .RST, .CLK);
	D_FF Dtoggle1 (.q(q1), .d(q0), .RST, .CLK);
	D_FF Dtoggle2 (.q(q2), .d(q1), .RST, .CLK);
	
	assign toggle = q1 & ~q2; // output only one cycle when q1 and q2 are offset
	
	always_ff @(posedge CLK) begin
		if (RST) begin // reset choice to 0
			choice <= '0;
		end else if (toggle) begin // set choice on toggle
			choice <= choice_in;
		end else begin // keep choice the same
			choice <= choice;
		end
	end
	
endmodule