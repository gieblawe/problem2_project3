module HotCoding_regular(input logic clk, input logic reset, output logic [1:0] y);

typedef enum logic [7:0] {S0=8'b00000001, S1=8'b00000010, S2=8'b00000100, S3=8'b00001000, S4=8'b00010000, S5=8'b00100000, S6=8'b01000000} statetype;
statetype state, nextstate;

always_ff @(posedge clk, negedge reset)
	if(!reset) state <= S0;
	else state <= nextstate;


always_comb begin: set_next_state

case(1'b1)

	state[0]: nextstate = S4;
	state[1]: nextstate = S0;
	state[2]: nextstate = S1;
	state[3]: nextstate = S5;
	state[4]: nextstate = S6;
	state[5]: nextstate = S2;
	state[6]: nextstate = S3;
	default: nextstate = S0;

endcase

end:set_next_state

always_comb begin: set_outputs

case(1'b1)
	state[0]:y=1'b1;
	state[1]:y=1'b0;
	state[2]:y=1'b0;
	state[3]:y=1'b1;
	state[4]:y=1'b1;
	state[5]:y=1'b0;
	state[6]:y=1'b0;
	default:y=1'bx;
endcase

end:set_outputs

endmodule 
 
