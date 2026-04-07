`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2026 09:06:49 PM
// Design Name: 
// Module Name: tid_preamble_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tid_preamble_gen (
    input aclk,
    input aresetn,
    
    // AXIS SLAVE LEFT_BIAS
    input [31:0] S_AXIS_LEFT_BIAS_TDATA,
    input S_AXIS_LEFT_BIAS_TVALID,
    
    // AXIS SLAVE RIGHT_BIAS
    input [31:0] S_AXIS_RIGHT_BIAS_TDATA,
    input S_AXIS_RIGHT_BIAS_TVALID,
    
    // AXIS SLAVE VOLUME
    input [31:0] S_AXIS_VOL_TDATA,
    input S_AXIS_VOL_TVALID,
    
    // AXIS SLAVE SIGNAL
    input signed [15:0] S_AXIS_AUD_TDATA,
    output S_AXIS_AUD_TREADY,
    input S_AXIS_AUD_TVALID,
    
    // AXIS MASTER
    output [31:0] M_AXIS_AUD_TDATA,
    output [2:0] M_AXIS_AUD_TID,
    input M_AXIS_AUD_TREADY,
    output M_AXIS_AUD_TVALID
    );
    
    reg [3:0] preamble;
    reg [2:0] tid;
    wire signed [31:0] vol_adj_tdata;
    wire signed [31:0] left_tdata;
    wire signed [31:0] right_tdata;
    
    assign M_AXIS_AUD_TDATA [31:28] = 4'b0;
    
    assign vol_adj_tdata = ($signed(S_AXIS_AUD_TDATA) * $signed(S_AXIS_VOL_TDATA)) >>> 15;
    assign left_tdata = ($signed(vol_adj_tdata) * $signed(S_AXIS_LEFT_BIAS_TDATA)) >>> 15;
    assign right_tdata = ($signed(vol_adj_tdata) * $signed(S_AXIS_RIGHT_BIAS_TDATA)) >>> 15;
    
    assign M_AXIS_AUD_TDATA [27:12] = (tid == 3'b000) ? left_tdata[15:0] : right_tdata[15:0];
    
//    assign M_AXIS_AUD_TDATA [27:12] = vol_adj_tdata [15:0];
//    assign M_AXIS_AUD_TDATA [27:12] = S_AXIS_AUD_TDATA [15:0];
    assign M_AXIS_AUD_TDATA [11:4] = 8'b00000000;
    assign M_AXIS_AUD_TDATA [3:0] = preamble;
    assign M_AXIS_AUD_TID = tid;
    
    assign M_AXIS_AUD_TVALID = S_AXIS_AUD_TVALID;
    assign S_AXIS_AUD_TREADY = M_AXIS_AUD_TREADY;
    
    always@(posedge aclk) begin
        if (aresetn == 0) begin
            preamble <= 4'b0001; // 0001 = Start of audio block/Channel 0 audio
            tid <= 3'b000;
        end else if (M_AXIS_AUD_TREADY) begin
            if (preamble == 4'b0001) begin
                preamble <= 4'b0011;
                tid <= 3'b001;
            end else if (preamble == 4'b0010) begin
                preamble <= 4'b0011;
                tid <= 3'b001;
            end else if (preamble == 4'b0011) begin
                preamble <= 4'b0010;
                tid <= 3'b000;
            end
        end
    end
    
endmodule
