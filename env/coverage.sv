
class coverage;
	transaction trns;
	covergroup mux_cg;

		cp_a: coverpoint trns.a{
			bins zero = {0};
			bins one = {1};
			}

		cp_b: coverpoint trns.b{
			bins zero = {0};
			bins one = {1};
			}

		cp_sel: coverpoint trns.sel{
			bins select_a = {0};
			bins select_b = {1};
			}
		cp_y: coverpoint trns.y{
			bins zero = {0};
			bins one = {1};
			}
			
		input_combination : cross cp_a, cp_b, cp_sel;
	endgroup

	function new();
		mux_cg = new();
	endfunction

	function void sample(transaction t);
		trns = t;
		mux_cg.sample();
	endfunction
endclass
