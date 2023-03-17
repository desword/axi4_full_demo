module RAM #(
    parameter DATAWIDTH = 32,
    parameter ADDRWIDTH = 6
)
(
    input clk,
    input wr_en,
    input [ADDRWIDTH-1 : 0] wr_addr,
    input [DATAWIDTH-1 : 0] wr_data,
    input [(DATAWIDTH/8)-1 : 0] w_strb,
    input rd_en,
    input [ADDRWIDTH-1 : 0] rd_addr,
    output reg [DATAWIDTH-1 :0] rd_data
);
    reg [DATAWIDTH-1 : 0] mem [0 : (1<<ADDRWIDTH)-1];
    // write data to memory
    wire [DATAWIDTH-1 : 0] w_strb_data;
    genvar i;    
    generate for(i = 0; i < (DATAWIDTH/8); i = i + 1)
        begin:wstrb
            assign w_strb_data[8*i+:8] = (w_strb[i]) ? wr_data[8*i+:8] : mem[wr_addr][8*i+:8];
        end
    endgenerate
    
    always@(posedge clk)begin
        if(wr_en)
            mem[wr_addr] <= w_strb_data;
    end
    // read data from memory
    always@(posedge clk)begin
        if(rd_en)
             rd_data <= mem[rd_addr];
    end
endmodule