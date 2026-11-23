class generator;

	transaction trans;
	mailbox #(transaction) gen2drv;
	mailbox #(transaction) gen2scb;

	function new(mailbox #(transaction) gen2scb,mailbox #(transaction) gen2drv);
	this.gen2drv = gen2drv;
	this.gen2scb = gen2scb;
	endfunction
	
	task run;
		$display("Generator Started");
	trans = new();
	repeat(8) begin
		if(trans.randomize() == 0) $fatal(1, "Randomization failed");
		gen2drv.put(trans.copy());
		gen2scb.put(trans.copy());
	end
	$display("Generator Ended");
endtask
endclass

