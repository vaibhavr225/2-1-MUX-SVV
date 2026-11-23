class monitor;
	transaction trans_mon;
	coverage cov;
	virtual mux_intf.MON vif;
	mailbox #(transaction) mon2scb;
	bit a,b,sel,y;

	function new(mailbox #(transaction) mbox, virtual mux_intf.MON intf, coverage cov);
		this.mon2scb = mbox;
		this.vif = intf;
		this.cov = cov;
	endfunction

	task run;
		$display("Monitor Strarted");
		repeat(8) begin
			trans_mon = new();
			@(vif.mon_cb);
			trans_mon.a = vif.mon_cb.a;
			trans_mon.b = vif.mon_cb.b;
			trans_mon.sel = vif.mon_cb.sel;
			trans_mon.y = vif.mon_cb.y;
			cov.sample(trans_mon);
			mon2scb.put(trans_mon);

		end
		$display("Monitor ended");
	endtask
endclass

