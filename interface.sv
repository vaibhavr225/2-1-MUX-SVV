interface mux_intf(
	input logic clk,
	input logic reset
	);

	logic sel , a ,b;
	logic y;

	clocking drv_cb @(posedge clk);
		output a,b,sel;
	endclocking

	clocking mon_cb @(negedge clk);
		input a,b,sel,y;
	endclocking

	modport DRV(clocking drv_cb, input reset);
	modport MON(clocking mon_cb);
	modport MUX(input a , b, sel , output y);

endinterface

