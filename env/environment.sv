`include "env/transaction.sv"
`include "env/generator.sv"
`include "env/coverage.sv"
`include "env/monitor.sv"
`include "env/scoreboard.sv"
`include "env/driver.sv"

class environment;
	transaction trans;
	generator gen;
	driver drv;
	monitor mon;
	scoreboard scb;
	coverage cov;

	mailbox #(transaction) gen2drv;
	mailbox #(transaction) gen2scb;
	mailbox #(transaction) mon2scb;

	virtual mux_intf vif;

	function new(virtual mux_intf vif);
		gen2drv = new();
		gen2scb = new();
		mon2scb = new();
		cov     = new();

		gen = new(gen2scb, gen2drv);
		drv = new(gen2drv, vif);
		mon = new(mon2scb, vif, cov);
		scb = new(mon2scb, gen2scb);
	endfunction

	task pre_test;
		drv.reset;
	endtask

	task test;
		fork 
			gen.run();
			drv.run();
			mon.run();
			scb.run();
		join
	endtask

	task post_test;
		$display("Test Finished successfully");
	endtask

	task display;
		$display("---------------METRICS-------------");
		$display(" TRANSACTIONS = %0d", scb.no_trans);
		$display(" COVERAGE = %0.2f%", cov.mux_cg.get_coverage());
		$display(" MATCHED = %0d", scb.matched);
		$display("MISMATCHED = %0d", scb.mismatched);
		$display("PASS PERCENTAGE = %0.2f%", (scb.matched*100 /scb.no_trans));
		$display("-----------------------------------");
	endtask


	task run;
		pre_test();
		test();
		post_test();
		display();

		#20; $finish;
	endtask
endclass


