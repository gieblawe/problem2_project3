module HotCoding_regular(input logic clk, input logic reset, output logic [1:0] y);

typedef enum logic [7:0] {S0=8'b00000001, S1=8'b00000010, S2=8'b00000100, S3=8'b00001000, S4=8'b00010000, S5=8'b00100000, S6=8'b01000000} statetype;
statetype state, nextstate;

always_ff @(posedge clk, negedge reset)
	if(!reset) state <= S0;
	else state <= nextstate;


always_comb begin: set_next_state

case(state)

	S0: nextstate = S4;
	S1: nextstate = S0;
	S2: nextstate = S1;
	S3: nextstate = S5;
	S4: nextstate = S6;
	S5: nextstate = S2;
	S6: nextstate = S3;
	default: nextstate = S0;

endcase

end:set_next_state

always_comb begin: set_outputs

case(state)
	S0:y=1'b1;
	S1:y=1'b0;
	S2:y=1'b0;
	S3:y=1'b1;
	S4:y=1'b1;
	S5:y=1'b0;
	S6:y=1'b0;
	default:y=1'bx;
endcase

end:set_outputs

endmodule 
 
