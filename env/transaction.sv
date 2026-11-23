class transaction;
	randc bit [2:0] inputs;
	bit a,b,sel;
	bit y;

	function void post_randomize();
		{a, b, sel} = inputs;
		y = sel ? b : a;
	endfunction 

	function transaction copy();
		transaction temp = new();
		temp.inputs = this.inputs;
		temp.a = this.a;
		temp.b = this.b;
		temp.sel = this.sel;
		temp.y = this.y;

		return temp;
	endfunction
endclass

