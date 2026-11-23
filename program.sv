`include "env/environment.sv"

program test(mux_intf intf);
	environment env;

	initial begin 
		env = new(intf);
		env.run();
	end
endprogram 
