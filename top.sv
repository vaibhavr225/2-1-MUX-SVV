`include "interface.sv"
`include "program.sv"
`include "Mux.sv"

module top;
	bit clk, reset;
	initial begin 
		clk = 0;
		forever #5 clk =~clk;
	end

	initial begin
		reset = 0 ;
		#15; reset = 1;
	end

	mux_intf intf(.clk(clk), .reset(reset));
	test prog(intf);
	Mux dut(intf);
endmodule 


