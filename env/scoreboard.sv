class scoreboard;
	transaction expected, actual;
	mailbox #(transaction) mon2scb;
	mailbox #(transaction) gen2scb;

        int matched, mismatched, no_trans;

	function new(mailbox #(transaction) mon2scb, mailbox #(transaction) gen2scb);
		this.mon2scb = mon2scb;
		this.gen2scb = gen2scb;
	endfunction;

	task run;
		$display("Scoreboard Started ");
		repeat(8) begin

			mon2scb.get(actual);
			gen2scb.get(expected);

			assert({expected.y == actual.y}) begin
			matched++;
			$display("ASSERTION PASSED");
		end
		else begin
		       mismatched++;
	       		       $warning("""
				ASSERTION FAILED:
				INPUTS   : [a = %0d, b = %0d, sel = %0d]
				EXPECTED : [y = %0d]
			        ACTUAL   : [y = %0d]""",
				actual.a, actual.b, actual.sel,
			 	expected.y,actual.y);
			end
			no_trans++;	
		end
		$display("Scoreboard Ended");
	endtask
endclass


