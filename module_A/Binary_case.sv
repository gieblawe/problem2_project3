module Binary_case(input logic clk, input logic reset, output logic [1:0] y);

typedef enum logic [2:0] {S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110} statetype;
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
 
