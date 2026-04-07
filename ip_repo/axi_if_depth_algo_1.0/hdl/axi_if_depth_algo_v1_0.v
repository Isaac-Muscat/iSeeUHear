
`timescale 1 ns / 1 ps

	module axi_if_depth_algo_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        input wire i_clk,
        input wire i_resetn,
        input wire [31 : 0] i_lmem_data,
        output wire [31 : 0] o_lmem_addr,
        output wire [3 : 0] o_lmem_wea,
        output wire o_lmem_ena,
        input wire [31 : 0] i_rmem_data,
        output wire [31 : 0] o_rmem_addr,
        output wire [3 : 0] o_rmem_wea,
        output wire o_rmem_ena,
        output wire [31 : 0] o_vmem_data,
        output wire [31 : 0] o_vmem_addr,
        output wire [3 : 0] o_vmem_wea,
        output wire o_vmem_ena,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
	
	wire start, done;
// Instantiation of Axi Bus Interface S00_AXI
	axi_if_depth_algo_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axi_if_depth_algo_v1_0_S00_AXI_inst (
	    .o_start({{(C_S00_AXI_DATA_WIDTH-1){1'b0}}, start}),
        .i_done({{(C_S00_AXI_DATA_WIDTH-1){1'b0}}, done}),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
  stereo_accel #(
    .IMG_WIDTH(160),
    .IMG_HEIGHT(120),
    .BLOCK_SIZE(8),
    .MAX_DISPARITY(16),
    .MEDIAN_SIZE(5),
    .R_BUF_WIDTH(24),
    .L_BUF_WIDTH(8),
    .MEM_DATA_WIDTH(32),
    .MEM_ADDR_WIDTH(32),
    .BRAM_MEM_LATENCY(2'B11)
  ) inst (
    .i_clk(i_clk),
    .i_resetn(i_resetn),
    .i_start(start),
    .o_done(done),
    .i_lmem_data(i_lmem_data),
    .o_lmem_addr(o_lmem_addr),
    .o_lmem_wea(o_lmem_wea),
    .o_lmem_ena(o_lmem_ena),
    .i_rmem_data(i_rmem_data),
    .o_rmem_addr(o_rmem_addr),
    .o_rmem_wea(o_rmem_wea),
    .o_rmem_ena(o_rmem_ena),
    .o_vmem_data(o_vmem_data),
    .o_vmem_addr(o_vmem_addr),
    .o_vmem_wea(o_vmem_wea),
    .o_vmem_ena(o_vmem_ena)
  );

	// User logic ends

	endmodule
