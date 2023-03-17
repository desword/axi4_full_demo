
`timescale 1 ns / 1 ps

	module saxi_full_garin #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of ID for for write address, write data, read address and read data
		parameter integer C_S_AXI_ID_WIDTH	= 1,
		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 6,
		// Width of optional user defined signal in write address channel
		parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
		// Width of optional user defined signal in read address channel
		parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
		// Width of optional user defined signal in write data channel
		parameter integer C_S_AXI_WUSER_WIDTH	= 0,
		// Width of optional user defined signal in read data channel
		parameter integer C_S_AXI_RUSER_WIDTH	= 0,
		// Width of optional user defined signal in write response channel
		parameter integer C_S_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write Address ID
		input wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_AWID,
		// Write address
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		input wire [7 : 0] S_AXI_AWLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		input wire [2 : 0] S_AXI_AWSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		input wire [1 : 0] S_AXI_AWBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		input wire  S_AXI_AWLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		input wire [3 : 0] S_AXI_AWCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Quality of Service, QoS identifier sent for each
    // write transaction.
		input wire [3 : 0] S_AXI_AWQOS,
		// Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
		input wire [3 : 0] S_AXI_AWREGION,
		// Optional User-defined signal in the write address channel.
		input wire [C_S_AXI_AWUSER_WIDTH-1 : 0] S_AXI_AWUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid write address and
    // control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
		output wire  S_AXI_AWREADY,
		// Write Data
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write last. This signal indicates the last transfer
    // in a write burst.
		input wire  S_AXI_WLAST,
		// Optional User-defined signal in the write data channel.
		input wire [C_S_AXI_WUSER_WIDTH-1 : 0] S_AXI_WUSER,
		// Write valid. This signal indicates that valid write
    // data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    // can accept the write data.
		output wire  S_AXI_WREADY,
		// Response ID tag. This signal is the ID tag of the
    // write response.
		output wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_BID,
		// Write response. This signal indicates the status
    // of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Optional User-defined signal in the write response channel.
		output wire [C_S_AXI_BUSER_WIDTH-1 : 0] S_AXI_BUSER,
		// Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    // can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address ID. This signal is the identification
    // tag for the read address group of signals.
		input wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_ARID,
		// Read address. This signal indicates the initial
    // address of a read burst transaction.
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		input wire [7 : 0] S_AXI_ARLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		input wire [2 : 0] S_AXI_ARSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		input wire [1 : 0] S_AXI_ARBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		input wire  S_AXI_ARLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		input wire [3 : 0] S_AXI_ARCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Quality of Service, QoS identifier sent for each
    // read transaction.
		input wire [3 : 0] S_AXI_ARQOS,
		// Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
		input wire [3 : 0] S_AXI_ARREGION,
		// Optional User-defined signal in the read address channel.
		input wire [C_S_AXI_ARUSER_WIDTH-1 : 0] S_AXI_ARUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid read address and
    // control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
		output wire  S_AXI_ARREADY,
		// Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
		output wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_RID,
		// Read Data
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of
    // the read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read last. This signal indicates the last transfer
    // in a read burst.
		output wire  S_AXI_RLAST,
		// Optional User-defined signal in the read address channel.
		output wire [C_S_AXI_RUSER_WIDTH-1 : 0] S_AXI_RUSER,
		// Read valid. This signal indicates that the channel
    // is signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    // accept the read data and response information.
		input wire  S_AXI_RREADY
	);


// 1. 还需要细化同时接受信号的逻辑。比如，对于写请求，slave只有在看到write_data和write_valid同时高电平，才会发�?�ready信号�?
// 2. to support Burst.
// 3. to supplement the signal dependencies.
// 4. to support outstanding.
// 5. to support out-of-order transactions. [ID]
// 6. to support unaligned data transmission. [STRB]

	reg ar_ready;
	reg r_valid;
	reg aw_ready;
	reg w_ready;
	reg bresp;
	reg bvalid;

	assign S_AXI_ARREADY = ar_ready;
	assign S_AXI_RVALID = r_valid;

	assign S_AXI_AWREADY = aw_ready;
	assign S_AXI_WREADY = w_ready;
	assign S_AXI_BRESP = bresp;
	assign S_AXI_BVALID = bvalid;



	reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_read_address;
	// reg [C_S_AXI_DATA_WIDTH-1 : 0] axi_read_data;

	// assign S_AXI_RDATA = axi_read_data;

	reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_write_address;
	wire [C_S_AXI_DATA_WIDTH-1 : 0] axi_write_data;

	assign axi_write_data = S_AXI_WDATA;


	reg read_en;
	reg write_en;

	reg [7 : 0] ar_len;
	reg [2 : 0] ar_size;
	reg [1 : 0] ar_burst_type;
	reg [7 : 0] read_num_bytes;
	wire [14 : 0] ar_wrap_size;
	wire ar_wrap_en;
	reg [7 : 0] read_burst_count;// record the number of burst packets.


	reg [7 : 0] aw_len;
	reg [2 : 0] aw_size;
	reg [1 : 0] aw_burst_type;
	reg [7 : 0] write_num_bytes;
	wire [14 : 0] aw_wrap_size;
	wire aw_wrap_en;
	reg [7 : 0] write_burst_count;// record the number of burst packets.

	assign ar_wrap_size = {2'h00, ar_len << ar_size};
	assign ar_wrap_en = ((axi_read_address & ar_wrap_size) == ar_wrap_size)? 1'b1: 1'b0;
	assign aw_wrap_size = {2'h00, aw_len << aw_size};
	assign aw_wrap_en = ((axi_write_address & aw_wrap_size) == aw_wrap_size)? 1'b1: 1'b0;


//obtain the transmission size.
always @(*) begin
	case(ar_size)
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
	case(aw_size)
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


// ------------------------------------------------------- write related. ------------------------------------------------------- 
// 1.address hand shake
// with outstanding = 1
// TBD. response related 
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		write_en <= 0;
	end
	else if (~write_en && ~aw_ready && S_AXI_AWVALID) begin
		write_en <= 1;
	end
	else if (write_en && aw_ready && S_AXI_AWVALID && (write_burst_count==aw_len)) begin
		write_en <= 0;
	end
end
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		aw_ready <= 1'b0;
	end
	else 
		begin
			if( ~aw_ready && S_AXI_AWVALID   ) begin
				aw_ready <= 1'b1;
				aw_len = S_AXI_AWLEN;
				aw_size = S_AXI_AWSIZE;
				aw_burst_type = S_AXI_AWBURST;

			end
			else begin
				aw_ready <= 1'b0;
			end
		end
end
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		aw_ready <= 1'b0;
	end
	else 
		begin
			if( aw_ready && S_AXI_AWVALID   ) begin
				axi_write_address <= S_AXI_AWADDR;
			end
			else begin
				// aw_ready <= 1'b0;
				axi_write_address <= 1'b0;
			end
		end
end

// 2. write burst data.
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		w_ready <= 1'b0;
	end
	else 
		begin
			if( ~w_ready && S_AXI_WVALID   ) begin
				w_ready <= 1'b1;
			end
			else begin
				w_ready <= 1'b0;
			end
		end
end

always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		w_ready <= 1'b0;
		axi_write_address <= 0;
		write_burst_count <=0;
	end
	else 
		begin
			if( w_ready && S_AXI_WREADY && ~S_AXI_WLAST && write_burst_count<aw_len  ) begin
				write_burst_count <= write_burst_count +1;
				case(ar_burst_type)
					2'b00:
						axi_write_address <= axi_write_address; 
					2'b01:
						axi_write_address <= axi_write_address + write_num_bytes; 
					2'b11:
						if(aw_wrap_en) begin
							axi_write_address <= axi_write_address - write_num_bytes*aw_len;
						end
						else begin
							axi_write_address <= axi_write_address + write_num_bytes;
						end
					default:
						axi_write_address <= axi_write_address + write_num_bytes; 
				endcase
			end
			// else begin
			// 	w_ready <= 1'b0;
			// 	axi_write_address <= 0;
			// 	write_burst_count <=0;
			// end
		end
end

// ------------------------------------------------------- read related. ------------------------------------------------------- 
// 1.address hand shake
// with outstanding = 1
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		read_en <= 0;
	end
	else if (~read_en && ~ar_ready && S_AXI_ARVALID) begin
		read_en <= 1;
	end
	else if (read_en && ar_ready && S_AXI_ARVALID && (read_burst_count==ar_len)) begin
		read_en <= 0;
	end
end
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		ar_ready <= 1'b0;
	end
	else 
		begin
			if( ~ar_ready && S_AXI_ARVALID   ) begin
				ar_ready <= 1'b1;
			end
			else begin
				ar_ready <= 1'b0;
			end
		end
end
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		axi_read_address <=  1'b0;

	end
	else 
		begin
			if( ar_ready && S_AXI_ARVALID   ) begin
				axi_read_address <= S_AXI_ARADDR;
			end
			else begin
				axi_read_address <=  1'b0;
			end
		end
end

// 2. data handshake.
always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		r_valid <= 1'b0;		
	end
	else 
		begin
			if( ~r_valid && S_AXI_RREADY   ) begin
				r_valid <= 1'b1;
				ar_len <= S_AXI_ARLEN;
				ar_size <= S_AXI_ARSIZE;
				ar_burst_type <= S_AXI_ARBURST;
			end
			else begin
				r_valid <= 1'b0;
			end
		end
end


always @(posedge S_AXI_ACLK or posedge S_AXI_ARESETN) begin
	if (S_AXI_ARESETN) begin
		// reset
		r_valid <= 1'b0;
		axi_read_address <= 0;
		read_burst_count <=0;
	end
	else 
		begin
			if( r_valid && S_AXI_RREADY && ~S_AXI_RLAST && read_burst_count<ar_len  ) begin
				read_burst_count <= read_burst_count +1;
				case(ar_burst_type)
					2'b00:
						axi_read_address <= axi_read_address; 
					2'b01:
						axi_read_address <= axi_read_address + read_num_bytes; 
					2'b11:
						if(ar_wrap_en) begin
							axi_read_address <= axi_read_address - read_num_bytes*ar_len;
						end
						else begin
							axi_read_address <= axi_read_address + read_num_bytes;
						end
					default:
						axi_read_address <= axi_read_address + read_num_bytes; 
				endcase
				

			end
			// else begin
			// 	r_valid <= 1'b0;
			// 	axi_read_address <= 0;
			// 	read_burst_count <=0;
			// end
		end
end




// ------------------------------------------------------- RAM module ------------------------------------------------------- 


RAM #(
    .DATAWIDTH(32),
    .ADDRWIDTH(6)
)
RAM_inst(
    .clk(S_AXI_ACLK),
    .wr_en(1),
    .wr_addr(axi_write_address),
    .wr_data(axi_write_data   ),
    .w_strb(S_AXI_WSTRB),
    .rd_en(1 ),
    .rd_addr(axi_read_address),
    .rd_data( S_AXI_RDATA )
);





endmodule
