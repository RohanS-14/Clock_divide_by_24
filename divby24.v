`timescale 1ns/1ns

module divby24(input clk,rst , output reg [4:0]count,output reg g_clk);

always@(posedge clk)
begin
	if(rst) begin
		count<= 5'b0;
		g_clk<= 0; end
	else if(count == 5'd24) begin
		count <= 5'd0; end
	else begin
		count <= count+5'b00001;
end
end

always@(posedge clk)
begin
	if(count==5'd12) begin
		g_clk <= ~g_clk;
end
end

endmodule

module tb24();

reg clk,rst;
wire [4:0]count;
wire g_clk;

divby24 dut(clk,rst,count,g_clk);

initial 
begin
clk =1'b0;
forever 
#60 clk = ~clk;
end

initial
begin
rst =1'b1; #200;
rst=1'b0;
#6000 $finish;
end

endmodule