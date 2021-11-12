module Binary_case_TB();
reg clk,reset;
wire [1:0] y;
logic a;
logic [3:0] S;
  
Binary_case uut (clk,reset,y);
  
initial
forever
#2 clk=~clk;
  
initial
begin
clk=0;reset=0;

#1 reset=1;
#1;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4;
#4 $finish;

end
endmodule

