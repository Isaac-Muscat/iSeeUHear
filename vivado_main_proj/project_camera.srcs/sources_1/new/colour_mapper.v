`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2026 10:04:30 AM
// Design Name: 
// Module Name: colour_mapper
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


module colour_mapper(
    input [31:0] bank_1, // CAMERA 1 IMAGE
    input [31:0] bank_2, // CAMERA 2 IMAGE
    input [31:0] bank_3, // DEPTH IMAGE
    output [31:0] bank_1_addr, // CAMERA 1 IMAGE
    output [31:0] bank_2_addr, // CAMERA 2 IMAGE
    output [31:0] bank_3_addr, // DEPTH IMAGE
    input clk25,
    input resetn,
    input vga_dbg,
    input video_on,
    input [9:0] x,
    input [9:0] y,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue
    );
    
    // wire [31:0] vga_rgb,
    reg [2:0] stage; // tracks the pixel within each BRAM read
    reg [3:0] reg_r;
    reg [3:0] reg_g;
    reg [3:0] reg_b;
    
    
    
    wire out_of_range; // bool for if we are outside of XRES or YRES
    assign out_of_range = (x < 160 && y >= 240) || (x >= 432 && y >= 240) || (y >= 466);  
    
    always @ (posedge clk25 or negedge resetn) begin
        if (!resetn) begin
            stage <= 0;
            // magenta output on reset for debug
            reg_r <= 4'b1111;
            reg_g <= 4'b0000;
            reg_b <= 4'b1111;
        end
        else begin
            if (!video_on || out_of_range) begin // to avoid DC offset calibration
                reg_r <= 4'b0000;
                reg_g <= 4'b0000;
                reg_b <= 4'b0000;
            end
            else begin
                if (vga_dbg) begin
                    reg_r <= 0;
                    reg_g <= 4'b1111;
                    reg_b <= 0;
                end
                else begin
                    case (stage) // using 565 RGB
                        3'b000,3'b001,3'b100,3'b101: begin // byte 1 & 2 = pixel 1
                                if (y < 240) begin
                                    if (x >= 0 && x < 320) begin
                                        reg_r <= bank_1[15:12];
                                        reg_g <= bank_1[10:7];
                                        reg_b <= bank_1[4:1];
                                    end else if (x >= 320 && x < 640) begin
                                        reg_r <= bank_2[15:12];
                                        reg_g <= bank_2[10:7];
                                        reg_b <= bank_2[4:1];
                                    end
                                end else begin // bottom half
                                    if (x >= 160 && x < 432) begin // bottom middle
                                        if (stage == 3'b000 || stage == 3'b001) begin // depth px 1
                                            reg_r <= bank_3[31:28];
                                            reg_g <= bank_3[31:28];
                                            reg_b <= bank_3[31:28];
                                        end else begin // depth px 3
                                            reg_r <= bank_3[15:12];
                                            reg_g <= bank_3[15:12];
                                            reg_b <= bank_3[15:12];
                                        end
                                    end else begin
                                        reg_r <= 4'b1111;
                                        reg_g <= 4'b0000;
                                        reg_b <= 4'b1111;
                                    end
                                end
                            end
                        3'b010,3'b011,3'b110,3'b111: begin // byte 3 & 4 = pixel 2
                                if (y < 240) begin
                                    if (x >= 0 && x < 320) begin
                                        reg_r <= bank_1[31:28];
                                        reg_g <= bank_1[26:23];
                                        reg_b <= bank_1[20:17];
                                    end else if (x >= 320 && x < 640) begin
                                        reg_r <= bank_2[31:28];
                                        reg_g <= bank_2[26:23];
                                        reg_b <= bank_2[20:17];
                                    end
                                end else begin // bottom half
                                    if (x >= 160 && x < 432) begin // bottom middle
                                        if (stage == 3'b010 || stage == 3'b011) begin // depth px 2
                                            reg_r <= bank_3[23:20];
                                            reg_g <= bank_3[23:20];
                                            reg_b <= bank_3[23:20];
                                        end else begin // depth px 4
                                            reg_r <= bank_3[7:4];
                                            reg_g <= bank_3[7:4];
                                            reg_b <= bank_3[7:4];
                                        end
                                    end else begin
                                        reg_r <= 4'b1111;
                                        reg_g <= 4'b0000;
                                        reg_b <= 4'b1111;
                                    end
                                end
                            end
                    endcase
                end
                stage <= stage + 1; // always increment stage counter
            end
        end
    end
    
    // regs to output
    assign red = reg_r;
    assign green = reg_g;
    assign blue = reg_b;
    
    
    // convert x and y into addr for BRAM
    // shift x by 1 (base) since 2px per read, hold same addr across 2 px
    
    // want (0,0) (1,0) (0,1) (1,1) to map to addr 0 because we are upscaling by 2x
    // shift y by 1 for 2x, need same addr for 2 rows at a time
    // shift x by +1 now since scaling by 2x, need same addr for 4 px now
    assign bank_1_addr = ((x >> 2) + ((y >> 1) * 80)) * 4;
    
    // sub 160 from x so that [160,319] maps to [0,159] on x for addressing
    // now sub 320 since scaling 2x and img now starts at halfway mark
    assign bank_2_addr = (((x - 320) >> 2) + ((y >> 1) * 80)) * 4;

    // 1B/px greyscale packed into 32 wide word
    // 136 x 113
    // shift x by 2 (base) since 4px per read, hold same addr across 4 px
    // shift x by +1 again since 2x scaling
    // also need to sub 160 from x since want img in center
    // also sub 240 from y since want img in bottom half
    assign bank_3_addr = (((x - 160) >> 3) + (((y - 240) >> 1) * 34)) * 4;

endmodule