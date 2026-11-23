class driver;
	transaction trans;
	virtual mux_intf.DRV vif;
	mailbox #(transaction) gen2drv;

	function new(mailbox #(transaction) mbox, virtual mux_intf.DRV intf);
		this.vif = intf;
		this.gen2drv = mbox;
	endfunction;

	task reset;
		wait (!vif.reset);
		$display ("TIME = %0t : reset started", $time);
		vif.drv_cb.a <= 0;
		vif.drv_cb.b <= 0;
		vif.drv_cb.sel <= 0;
		wait(vif.reset);
		$display("TIME = %0t : reset ended", $time);
	endtask


	task run;
		$display("Driver started");
		repeat(8) begin
			gen2drv.get(trans);
			@(vif.drv_cb);
			vif.drv_cb.a <= trans.a;
			vif.drv_cb.b <= trans.b;
			vif.drv_cb.sel <= trans.sel;
		end
		$display("Driver DOne");
	endtask
endclass
