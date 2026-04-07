//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2026 05:43:25 PM
// Design Name: 
// Module Name: top
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


/* 
* This module will do the following:
*   1. Load in the data it needs from both cameras into local memory
*   2. Run the SAD algorithm computation inner for for one pixel
*   3. Store the result back into memory
*/

`timescale 1ns / 1ps
module stereo_accel # (
    parameter IMG_WIDTH = 160,
    parameter IMG_HEIGHT = 120,

    parameter BLOCK_SIZE = 8,
    parameter MAX_DISPARITY = 16,
    parameter MEDIAN_SIZE = 5,
    parameter R_BUF_WIDTH = (MAX_DISPARITY+BLOCK_SIZE),
    parameter L_BUF_WIDTH = BLOCK_SIZE,

    parameter MEM_DATA_WIDTH = 32,
    parameter MEM_ADDR_WIDTH = 32,

    parameter BRAM_MEM_LATENCY = 2'b11
) (
    input i_clk,
    input i_resetn,

    input i_start,
    output o_done,

    input [MEM_DATA_WIDTH-1:0] i_lmem_data,
    output reg [MEM_ADDR_WIDTH-1:0] o_lmem_addr,
    output [3:0] o_lmem_wea,
    output o_lmem_ena,

    input [MEM_DATA_WIDTH-1:0] i_rmem_data,
    output reg [MEM_ADDR_WIDTH-1:0] o_rmem_addr,
    output [3:0] o_rmem_wea,
    output o_rmem_ena,

    output reg [MEM_DATA_WIDTH-1:0] o_vmem_data,
    output reg [MEM_ADDR_WIDTH-1:0] o_vmem_addr,
    output [3:0] o_vmem_wea,
    output o_vmem_ena
);

    // Used for for loops
    integer i, j, k;

    assign o_lmem_wea = 4'b0000;
    assign o_lmem_ena = 1'b1;

    assign o_rmem_wea = 4'b0000;
    assign o_rmem_ena = 1'b1;

    assign o_vmem_wea = 4'b1111;
    assign o_vmem_ena = 1'b1;

    reg [MEM_ADDR_WIDTH-1:0] col_load, row_load, row_load_offset;
    reg [7:0] left_buf [(BLOCK_SIZE*L_BUF_WIDTH)-1:0];
    reg [7:0] right_buf [(BLOCK_SIZE*R_BUF_WIDTH)-1:0];
    reg [15:0] pix_ad_out [MAX_DISPARITY-1:0];
    wire done, load_done, shift_done, sad_pix_done, sad_row_done;

    localparam S_IDLE = 3'd0;
    localparam S_LOAD = 3'd1;
    localparam S_SAD = 3'd2;
    localparam S_DISPARITY = 3'd3;
    localparam S_FINAL = 3'd4;
    localparam S_SHIFT = 3'd5;

    reg [2:0] current_state, next_state;

    reg [7:0] sad_cur_disparity;
    assign sad_pix_done = sad_cur_disparity == MAX_DISPARITY - 1;
    reg [MEM_ADDR_WIDTH-1: 0] sad_col_offset;

    // Current state logic
    always @(posedge i_clk) begin
        if (!i_resetn) begin
            current_state <= S_IDLE;
        end else begin
            current_state <= next_state;
        end
    end
    
    // Next state logic
    always @(*) begin
        next_state = current_state;
        case (current_state)
            S_IDLE: begin
                next_state = i_start ? S_LOAD : S_IDLE;
            end
            S_LOAD: begin
                next_state = load_done ? S_SAD : S_LOAD;
            end
            S_SHIFT: begin
                next_state = shift_done ? S_SAD : S_SHIFT;
            end
            S_SAD: begin
                next_state = sad_pix_done ? S_DISPARITY : S_SAD;
            end
            S_DISPARITY: begin
                next_state = S_FINAL;
            end
            S_FINAL: begin
                next_state = done ? S_IDLE : (sad_row_done ? S_LOAD : S_SHIFT);
            end
            default: begin
                next_state = current_state;
            end
        endcase
    end

    reg [7:0] load_done_cnt, shift_done_cnt;
    assign load_done = load_done_cnt == BRAM_MEM_LATENCY;
    assign shift_done = shift_done_cnt == BRAM_MEM_LATENCY;
    assign o_done = current_state == S_IDLE;
    reg [MEM_ADDR_WIDTH-1:0] col_load_del, row_load_del;
    wire offset_gen_done = row_load == (BLOCK_SIZE - 1) && col_load == (R_BUF_WIDTH - 3'd4) ? 1'b1 : 1'b0;
    wire shift_offset_gen_done = row_load == (BLOCK_SIZE - 1) ? 1'b1 : 1'b0;

    // Mem address generation logic
    always @(posedge i_clk) begin
        if (!i_resetn || o_done) begin
            row_load_offset <= 'b0;
            col_load <= 'b0;
            row_load <= 'b0;
            load_done_cnt <= 'b0;
            shift_done_cnt <= 'b0;
        end else begin
            if (current_state == S_LOAD) begin
                if (offset_gen_done) begin
                    load_done_cnt <= load_done_cnt + 1'b1;
                    col_load <= load_done ? 'b0 : col_load;
                    row_load <= load_done ? 'b0 : row_load;
                    row_load_offset <= load_done ? (row_load_offset == (IMG_HEIGHT - BLOCK_SIZE) ? 'b0 : row_load_offset + 1'b1) : row_load_offset;
                end else begin
                    col_load <= col_load == (R_BUF_WIDTH - 3'd4) ? 'b0 : col_load + 3'd4;
                    row_load <= row_load == (BLOCK_SIZE - 1) && col_load == (R_BUF_WIDTH - 3'd4) ? 'b0 : (col_load == (R_BUF_WIDTH - 3'd4) ? row_load + 1'b1 : row_load);
                end
            end else if (current_state == S_SHIFT) begin
                if (shift_offset_gen_done) begin
                    shift_done_cnt <= shift_done_cnt + 1'b1;
                    row_load <= shift_done ? 'b0 : row_load;
                end else begin
                    row_load <= row_load == (BLOCK_SIZE - 1) ? 'b0 : row_load + 1'b1;
                end
            end else begin
                load_done_cnt <= 'b0;
                shift_done_cnt <= 'b0;
            end
        end
    end

    reg [MEM_ADDR_WIDTH-1:0] mem_addr;
    wire [1:0] sad_col_remain = (sad_col_offset[1:0]);
    always @(*) begin
        mem_addr = 'b0;
        if (current_state == S_LOAD) begin
            mem_addr = (row_load_offset + row_load)*IMG_WIDTH + col_load;
        end else if (current_state == S_SHIFT) begin
            // columns need to be 4byte aligned 
            mem_addr = (row_load_offset + row_load)*IMG_WIDTH + {sad_col_offset[MEM_ADDR_WIDTH-1:2], 2'b00};
        end
    end

    reg [MEM_DATA_WIDTH-1:0] lmem_data;
    reg [MEM_DATA_WIDTH-1:0] rmem_data;
    reg [7:0] load_offset_cnt;
    // Mem load logic
    always @(posedge i_clk) begin
        if (!i_resetn || o_done) begin
            o_lmem_addr <= 32'h00000000;
            o_rmem_addr <= 32'h00000000;
            lmem_data <= 32'h00000000;
            rmem_data <= 32'h00000000;
            load_offset_cnt <= 'b0;
            col_load_del <= 'b0;
            row_load_del <= 'b0;
            for (i = 0; i < (BLOCK_SIZE*L_BUF_WIDTH); i = i + 1) begin
                left_buf[i] <= 8'h00;
            end
            for (i = 0; i < (BLOCK_SIZE*R_BUF_WIDTH); i = i + 1) begin
                right_buf[i] <= 8'h00;
            end
        end else begin
            if (current_state == S_LOAD) begin
                o_lmem_addr <= mem_addr;
                o_rmem_addr <= mem_addr;
                load_offset_cnt <= load_offset_cnt == BRAM_MEM_LATENCY ? load_offset_cnt : load_offset_cnt + 1'b1;
                if (load_offset_cnt == BRAM_MEM_LATENCY) begin
                    col_load_del <= col_load_del == (R_BUF_WIDTH - 3'd4) ? 'b0 : col_load_del + 3'd4;
                    row_load_del <= row_load_del == (BLOCK_SIZE - 1) && col_load_del == (R_BUF_WIDTH - 3'd4) ? 'b0 : (col_load_del == (R_BUF_WIDTH - 3'd4) ? row_load_del + 1'b1 : row_load_del);
                    // Currently unused, but might need them for timing
                    lmem_data <= i_lmem_data;
                    rmem_data <= i_rmem_data;
                    // Need to take the 4 byte data and split into chunks of 1 byte
                    // Need to keep in mind the latency from bram
                    // Overflow is fine since we wont compute here until then
                    for (i = 0; i < 4; i=i+1) begin
                        if (col_load_del < L_BUF_WIDTH) begin
                            left_buf[row_load_del*L_BUF_WIDTH + col_load_del + i] <= i_lmem_data[(4-i)*8-1 -: 8];
                        end
                        right_buf[row_load_del*R_BUF_WIDTH + col_load_del + i] <= i_rmem_data[(4-i)*8-1 -: 8];
                    end
                end
            end else if (current_state == S_SHIFT) begin
                o_lmem_addr <= mem_addr;
                o_rmem_addr <= mem_addr;
                load_offset_cnt <= load_offset_cnt == BRAM_MEM_LATENCY ? load_offset_cnt : load_offset_cnt + 1'b1;
                if (load_offset_cnt == BRAM_MEM_LATENCY) begin
                    row_load_del <= row_load_del == (BLOCK_SIZE - 1) ? 'b0 : row_load_del + 1'b1;
                    // Currently unused, but might need them for timing
                    lmem_data <= i_lmem_data;
                    rmem_data <= i_rmem_data;
                    // Need to take the 4 byte data and split into chunks of 1 byte
                    // Need to keep in mind the latency from bram
                    // Overflow is fine since we wont compute here until then
                    left_buf[row_load_del*L_BUF_WIDTH + L_BUF_WIDTH - 1] <= i_lmem_data[(4-sad_col_remain)*8-1 -: 8];
                    right_buf[row_load_del*R_BUF_WIDTH + R_BUF_WIDTH - 1] <= i_rmem_data[(4-sad_col_remain)*8-1 -: 8];
                end
            end else begin
                load_offset_cnt <= 'b0;
                // Last idx should get new data during S_SHIFT
                if (sad_pix_done) begin
                    for (j = 0; j < L_BUF_WIDTH-1; j = j + 1) begin
                        for (k = 0; k < BLOCK_SIZE; k = k + 1) begin
                            left_buf[k*L_BUF_WIDTH+j] <= left_buf[k*L_BUF_WIDTH+j+1];
                        end
                    end
                    for (j = 0; j < R_BUF_WIDTH-1; j = j + 1) begin
                        for (k = 0; k < BLOCK_SIZE; k = k + 1) begin
                            right_buf[k*R_BUF_WIDTH+j] <= right_buf[k*R_BUF_WIDTH+j+1];
                        end
                    end
                end
            end
        end
    end

/*
    integer file_handle;
    initial begin

    end
    // Test logic
    always @(posedge i_clk) begin

        if (load_done && row_load_offset % BLOCK_SIZE == 0) begin
            if (row_load_offset == 0) begin
                file_handle = $fopen("left_buf.hex", "w");
            end else begin
                file_handle = $fopen("left_buf.hex", "a");
            end
            for (i = 0; i < IMG_WIDTH*BLOCK_SIZE; i = i + 1) begin
                $fdisplay(file_handle, "%h", left_buf[i]);
            end
            $fclose(file_handle);
            if (row_load_offset == 0) begin
                file_handle = $fopen("right_buf.hex", "w");
            end else begin
                file_handle = $fopen("right_buf.hex", "a");
            end
            for (i = 0; i < IMG_WIDTH*BLOCK_SIZE; i = i + 1) begin
                $fdisplay(file_handle, "%h", right_buf[i]);
            end
            $fclose(file_handle);
            $stop;
        end
    end
    */

    always @(posedge i_clk) begin
        if (!i_resetn || o_done) begin
            sad_cur_disparity <= 'b0;
        end else if (current_state == S_SAD) begin
            sad_cur_disparity <= sad_cur_disparity == MAX_DISPARITY - 1? 'b0 : sad_cur_disparity + 1'b1;
        end
    end

    // SAD computation logic
    // Possible for this to be timing bottleneck
    reg [15:0] acc_pix_ad;
    reg [31:0] left_idx, right_idx;
    always @(*) begin
        acc_pix_ad = 'b0;
        for (j = 0; j < BLOCK_SIZE; j = j + 1) begin
            for (k = 0; k < BLOCK_SIZE; k = k + 1) begin
                left_idx = j*L_BUF_WIDTH+k;
                right_idx = j*R_BUF_WIDTH+(k+MAX_DISPARITY-sad_cur_disparity); // Technically this ignores the very first col
                if (left_buf[left_idx] > right_buf[right_idx]) begin // Take abs value
                    acc_pix_ad = acc_pix_ad + (left_buf[left_idx] - right_buf[right_idx]);
                end else begin
                    acc_pix_ad = acc_pix_ad + (right_buf[right_idx] - left_buf[left_idx]);
                end
            end
        end
    end

    assign sad_row_done = sad_col_offset == MAX_DISPARITY;

    // SAD Comp flopped
    always @(posedge i_clk) begin
        if (!i_resetn || o_done) begin
            sad_col_offset <= MAX_DISPARITY;
            for (i = 0; i < MAX_DISPARITY; i = i + 1) begin
                pix_ad_out[i] <= 16'b0;
            end
        end else begin
            if (current_state == S_SAD) begin
                sad_col_offset <= sad_pix_done ? (sad_col_offset == (IMG_WIDTH - BLOCK_SIZE) ? MAX_DISPARITY : sad_col_offset + 1'b1) : sad_col_offset;
                pix_ad_out[sad_cur_disparity] <= acc_pix_ad;
            end
        end
    end

    // Min disparity computation logic
    reg [15:0] min_val_pix_ad;
    reg [7:0] min_idx_pix_ad; // log(MAX_DISPARITY)
    always @(*) begin
        min_idx_pix_ad = 8'h00;
        min_val_pix_ad = 16'hffff;
        for (i = 0; i < MAX_DISPARITY; i = i + 1) begin
            if (pix_ad_out[i] < min_val_pix_ad) begin
                min_val_pix_ad = pix_ad_out[i];
                min_idx_pix_ad = i;
            end
        end
    end

    // Min disparity flopped + buffered
    reg [MEM_DATA_WIDTH-1:0] depth_buf; // Need to wait for 4 computations so vmem output makes sense
    reg [1:0] final_cnt; // Need four counts
    always @(posedge i_clk) begin
        if (!i_resetn || o_done) begin
            depth_buf <= 32'h00000000;
        end else begin
            if (current_state == S_DISPARITY) begin
                depth_buf[(4-final_cnt)*8-1 -: 8] <= min_idx_pix_ad*255/MAX_DISPARITY;
            end
        end
    end

    assign done = (row_load_offset == 'b0) && (current_state == S_FINAL);

    // Output buffered depth pixels to mem
    reg [MEM_ADDR_WIDTH-1:0] next_vmem_addr; // Ensure vmem lags by one depth buf update
    always @(posedge i_clk) begin
        if (!i_resetn || o_done) begin
            o_vmem_addr <= 32'h00000000;
            next_vmem_addr <= 32'h00000000;
            o_vmem_data <= 32'h00000000;
            final_cnt <= 'b0;
        end else begin
            if (current_state == S_FINAL) begin
                final_cnt <= final_cnt == 2'b11 ? 2'b00: final_cnt + 1'b1;
                if (final_cnt == 2'b11) begin
                    o_vmem_data <= depth_buf;
                    o_vmem_addr <= next_vmem_addr;
                    next_vmem_addr <= next_vmem_addr + 3'd4;
                end
            end else if (current_state == S_LOAD) begin
                final_cnt <= 2'b00;
            end
        end
    end



endmodule
