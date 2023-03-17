
`timescale 1 ns / 1 ps


module saxi_full_garin_tb();


// Width of ID for for write address, write data, read address and read data
parameter integer C_S_AXI_ID_WIDTH	= 1;
// Width of S_AXI data bus
parameter integer C_S_AXI_DATA_WIDTH	= 32;
// Width of S_AXI address bus
parameter integer C_S_AXI_ADDR_WIDTH	= 6;
// Width of optional user defined signal in write address channel
parameter integer C_S_AXI_AWUSER_WIDTH	= 0;
// Width of optional user defined signal in read address channel
parameter integer C_S_AXI_ARUSER_WIDTH	= 0;
// Width of optional user defined signal in write data channel
parameter integer C_S_AXI_WUSER_WIDTH	= 0;
// Width of optional user defined signal in read data channel
parameter integer C_S_AXI_RUSER_WIDTH	= 0;
// Width of optional user defined signal in write response channel
parameter integer C_S_AXI_BUSER_WIDTH	= 0;

  reg aclk_net;
  reg aresetn_net;
  reg [C_S_AXI_ADDR_WIDTH - 1:0]master_0_M_AXI_ARADDR;
  reg [1:0]master_0_M_AXI_ARBURST;
  reg [3:0]master_0_M_AXI_ARCACHE;
  reg [0:0]master_0_M_AXI_ARID;
  reg [7:0]master_0_M_AXI_ARLEN;
  reg [0:0]master_0_M_AXI_ARLOCK;
  reg [2:0]master_0_M_AXI_ARPROT;
  reg [3:0]master_0_M_AXI_ARQOS;
  wire master_0_M_AXI_ARREADY;
  reg [3:0]master_0_M_AXI_ARREGION;
  reg [0:0]master_0_M_AXI_ARUSER;
  reg master_0_M_AXI_ARVALID;
  reg [C_S_AXI_ADDR_WIDTH - 1:0]master_0_M_AXI_AWADDR;
  reg [1:0]master_0_M_AXI_AWBURST;
  reg [3:0]master_0_M_AXI_AWCACHE;
  reg [0:0]master_0_M_AXI_AWID;
  reg [7:0]master_0_M_AXI_AWLEN;
  reg [0:0]master_0_M_AXI_AWLOCK;
  reg [2:0]master_0_M_AXI_AWPROT;
  reg [3:0]master_0_M_AXI_AWQOS;
  wire master_0_M_AXI_AWREADY;
  reg [3:0]master_0_M_AXI_AWREGION;
  reg [0:0]master_0_M_AXI_AWUSER;
  reg master_0_M_AXI_AWVALID;
  wire [0:0]master_0_M_AXI_BID;
  reg master_0_M_AXI_BREADY;
  wire [1:0]master_0_M_AXI_BRESP;
  wire [0:0]master_0_M_AXI_BUSER;
  wire master_0_M_AXI_BVALID;
  wire [31:0]master_0_M_AXI_RDATA;
  wire [0:0]master_0_M_AXI_RID;
  wire master_0_M_AXI_RLAST;
  reg master_0_M_AXI_RREADY;
  wire [1:0]master_0_M_AXI_RRESP;
  wire [0:0]master_0_M_AXI_RUSER;
  wire master_0_M_AXI_RVALID;
  reg [31:0]master_0_M_AXI_WDATA;
  reg master_0_M_AXI_WLAST;
  wire master_0_M_AXI_WREADY;
  reg [3:0]master_0_M_AXI_WSTRB;
  reg [0:0]master_0_M_AXI_WUSER;
  reg master_0_M_AXI_WVALID;
  reg[2:0] master_ar_size;
  reg[2:0] master_aw_size;

  reg [3:0] max_addr_c;
  reg [3:0] max_addr;
  reg [7:0] write_burst_count;



  reg [7:0] read_burst_count;
  reg [C_S_AXI_DATA_WIDTH-1:0] read_data;

	reg [7 : 0] read_num_bytes;
	reg [7 : 0] write_num_bytes;

	// for circlely invoke read and write.
	reg start_read;
	reg start_write;


saxi_full_garin saxi_full_garin_0
       (.S_AXI_ACLK(aclk_net),
        .S_AXI_ARADDR(master_0_M_AXI_ARADDR),
        .S_AXI_ARBURST(master_0_M_AXI_ARBURST),
        .S_AXI_ARCACHE(master_0_M_AXI_ARCACHE),
        .S_AXI_ARESETN(aresetn_net),
        .S_AXI_ARID(master_0_M_AXI_ARID),
        .S_AXI_ARLEN(master_0_M_AXI_ARLEN),
        .S_AXI_ARLOCK(master_0_M_AXI_ARLOCK),
        .S_AXI_ARPROT(master_0_M_AXI_ARPROT),
        .S_AXI_ARQOS(master_0_M_AXI_ARQOS),
        .S_AXI_ARREADY(master_0_M_AXI_ARREADY),
        .S_AXI_ARREGION(master_0_M_AXI_ARREGION),
        .S_AXI_ARSIZE(master_ar_size),
        .S_AXI_ARUSER(master_0_M_AXI_ARUSER),
        .S_AXI_ARVALID(master_0_M_AXI_ARVALID),
        .S_AXI_AWADDR(master_0_M_AXI_AWADDR),
        .S_AXI_AWBURST(master_0_M_AXI_AWBURST),
        .S_AXI_AWCACHE(master_0_M_AXI_AWCACHE),
        .S_AXI_AWID(master_0_M_AXI_AWID),
        .S_AXI_AWLEN(master_0_M_AXI_AWLEN),
        .S_AXI_AWLOCK(master_0_M_AXI_AWLOCK),
        .S_AXI_AWPROT(master_0_M_AXI_AWPROT),
        .S_AXI_AWQOS(master_0_M_AXI_AWQOS),
        .S_AXI_AWREADY(master_0_M_AXI_AWREADY),
        .S_AXI_AWREGION(master_0_M_AXI_AWREGION),
        .S_AXI_AWSIZE(master_aw_size),
        .S_AXI_AWUSER(master_0_M_AXI_AWUSER),
        .S_AXI_AWVALID(master_0_M_AXI_AWVALID),
        .S_AXI_BID(master_0_M_AXI_BID),
        .S_AXI_BREADY(master_0_M_AXI_BREADY),
        .S_AXI_BRESP(master_0_M_AXI_BRESP),
        .S_AXI_BUSER(master_0_M_AXI_BUSER),
        .S_AXI_BVALID(master_0_M_AXI_BVALID),
        .S_AXI_RDATA(master_0_M_AXI_RDATA),
        .S_AXI_RID(master_0_M_AXI_RID),
        .S_AXI_RLAST(master_0_M_AXI_RLAST),
        .S_AXI_RREADY(master_0_M_AXI_RREADY),
        .S_AXI_RRESP(master_0_M_AXI_RRESP),
        .S_AXI_RUSER(master_0_M_AXI_RUSER),
        .S_AXI_RVALID(master_0_M_AXI_RVALID),
        .S_AXI_WDATA(master_0_M_AXI_WDATA),
        .S_AXI_WLAST(master_0_M_AXI_WLAST),
        .S_AXI_WREADY(master_0_M_AXI_WREADY),
        .S_AXI_WSTRB(master_0_M_AXI_WSTRB),
        .S_AXI_WUSER(master_0_M_AXI_WUSER),
        .S_AXI_WVALID(master_0_M_AXI_WVALID));



	initial begin
	   aclk_net  <= 1'b0;   
	   aresetn_net    <= 1'b0;    

	   // write burst related papamreter
	   max_addr <= 10;  
	   max_addr_c <= 0;  

	   master_0_M_AXI_AWLEN <= 4;
	   write_burst_count <= 0;
	   master_0_M_AXI_AWBURST <= 0;
   		master_0_M_AXI_WSTRB <= 4'b1111;
		master_0_M_AXI_WVALID = 0;
		master_0_M_AXI_WDATA = 8'h55;
		master_aw_size <= 3'b101;
		master_0_M_AXI_WLAST <= 0;
		master_0_M_AXI_BREADY <= 0;

	   // read burst related papamreter

	   master_0_M_AXI_ARLEN <= 4;
	   read_burst_count <= 0;
	   master_0_M_AXI_ARBURST <= 0;
   	   master_0_M_AXI_RREADY <= 0;
		master_ar_size <= 3'b101;

		//enable write first, and then read.
		start_write = 1;
		start_read = 0;
	end

	always #20 aclk_net=~aclk_net; 

//obtain the transmission size.
always @(*) begin
	case(master_ar_size)
		3'b000: read_num_bytes = 8'd1;
		3'b001: read_num_bytes = 8'd2;
		3'b010: read_num_bytes = 8'd4;
		3'b011: read_num_bytes = 8'd8;
		3'b100: read_num_bytes = 8'd16;
		3'b101: read_num_bytes = 8'd32;
		3'b110: read_num_bytes = 8'd64;
		3'b111: read_num_bytes = 8'd128;
		default: read_num_bytes = 8'dx;
	endcase // ar_size
end
always @(*) begin
	case(master_aw_size)
		3'b000: write_num_bytes = 8'd1;
		3'b001: write_num_bytes = 8'd2;
		3'b010: write_num_bytes = 8'd4;
		3'b011: write_num_bytes = 8'd8;
		3'b100: write_num_bytes = 8'd16;
		3'b101: write_num_bytes = 8'd32;
		3'b110: write_num_bytes = 8'd64;
		3'b111: write_num_bytes = 8'd128;
		default: write_num_bytes = 8'dx;
	endcase // ar_size
end

// we have to try to implement the full procedure of the master to make the testbench work.
// ------------------------------------------------------- write related. ------------------------------------------------------- 
//1. write address shake.
	always @(posedge aclk_net or posedge aresetn_net) begin 
		if (aresetn_net) begin
		// reset
		master_0_M_AXI_AWVALID <= 1'b0;
		master_0_M_AXI_AWADDR <= 1'b0;
		max_addr_c <= 1'b0;
		end
		else 
			begin
				if( ~master_0_M_AXI_AWVALID && start_write   ) begin
					master_0_M_AXI_AWVALID <= 1'b1;

				end
				else if( master_0_M_AXI_AWVALID && master_0_M_AXI_AWREADY   ) begin
					master_0_M_AXI_AWADDR <= (max_addr_c < max_addr)  ? 10 : master_0_M_AXI_AWADDR + 2;
					max_addr_c <= (max_addr_c < max_addr)  ? 0 : max_addr_c + 1;
					master_0_M_AXI_AWVALID <= 0;
				end
			end
	end

//2. write data.
always @(posedge aclk_net or posedge aresetn_net) begin 
	if (aresetn_net) begin
		// reset
		master_0_M_AXI_WVALID <= 1'b0;
	end
	else 
		begin
			if( ~master_0_M_AXI_WVALID   ) begin
				master_0_M_AXI_WVALID <= 1'b1;
				master_0_M_AXI_BREADY <= 1;
				master_0_M_AXI_WLAST <= 0;
			end
			else if(master_0_M_AXI_WVALID && master_0_M_AXI_WREADY && write_burst_count<master_0_M_AXI_AWLEN-1) begin
				write_burst_count <= write_burst_count +1;
				master_0_M_AXI_WDATA <= master_0_M_AXI_WDATA + 1;
			end 
			else if(write_burst_count==master_0_M_AXI_AWLEN)begin
				master_0_M_AXI_WLAST <= 1;
			end
			else if (write_burst_count>master_0_M_AXI_AWLEN) begin
				master_0_M_AXI_WDATA <= 55;
				write_burst_count <= 0;
			end
		end
end

//3. get response.
always @(posedge aclk_net or posedge aresetn_net) begin 
	if (aresetn_net) begin
		// reset
		master_0_M_AXI_WVALID <= 1'b0;
	end
	else 
		begin
			if( master_0_M_AXI_BVALID && master_0_M_AXI_BRESP  ) begin
				master_0_M_AXI_BREADY <= 0;
				start_write = 0;
				start_read = 1;
			end
			
		end
end

// ------------------------------------------------------- read related.  ------------------------------------------------------- 
//1. address shake.

	always @(posedge aclk_net or posedge aresetn_net) begin 
		if (aresetn_net) begin
		// reset
		// master_0_M_AXI_AWVALID <= 1'b0;
		// master_0_M_AXI_AWADDR <= 1'b0;
		max_addr_c <= 1'b0;
		end
		else 
			begin
				if( ~master_0_M_AXI_ARVALID && start_read   ) begin
					master_0_M_AXI_ARVALID <= 1'b1;
					max_addr_c <= 0;
					master_0_M_AXI_ARADDR <= (max_addr_c < max_addr)  ? 10 : master_0_M_AXI_ARADDR + 2;

				end
				else if( master_0_M_AXI_ARVALID &&    master_0_M_AXI_ARREADY ) begin
					max_addr_c <= (max_addr_c < max_addr)  ? 0 : max_addr_c + 1;
					master_0_M_AXI_ARVALID <= 0;
				end
			end
	end
//2. data read.
always @(posedge aclk_net or posedge aresetn_net) begin 
	if (aresetn_net) begin
		// reset
		master_0_M_AXI_RREADY <= 1'b0;
	end
	else 
		begin
			if( ~master_0_M_AXI_RREADY   ) begin
				master_0_M_AXI_RREADY <= 1'b1;
			end
			else if(master_0_M_AXI_RVALID && master_0_M_AXI_RREADY && ~master_0_M_AXI_RLAST) begin
				write_burst_count <= write_burst_count +1;
				master_0_M_AXI_WDATA <= master_0_M_AXI_WDATA + 1;
				read_data <= master_0_M_AXI_RDATA;
			end 
			else if(master_0_M_AXI_RLAST)begin
				master_0_M_AXI_WLAST <= 1;
				master_0_M_AXI_RREADY <= 0;
			end

		end
end

endmodule


