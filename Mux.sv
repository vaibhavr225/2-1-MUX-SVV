module Mux(
	mux_intf.MUX m
	);
	
	always_comb begin
		m.y = (~m.sel & m. a) | (m.sel & m.b);
	end
endmodule
	
