`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Taken from David J. Marion's Basys3 adaptation of the following reference book:
//
// Reference Book: 
// Chu, Pong P.
// Wiley, 2008
// "FPGA Prototyping by Verilog Examples: Xilinx Spartan-3 Version" 
// 
// Most comments by David J. Marion
// Some changes were made to work with our implementation on Nexys4
//////////////////////////////////////////////////////////////////////////////////


module VGA_controller(
    input clk100,
    input clk25,
    input resetn,
    input vga_polarity,
    output video_on,
    output hsync,
    output vsync,
    output [9:0] x,
    output [9:0] y
    );
    
    // Based on VGA standards found at vesa.org for 640x480 resolution
    // Total horizontal width of screen = 800 pixels, partitioned  into sections
    parameter HD = 640;             // horizontal display area width in pixels
    parameter HF = 48;              // horizontal front porch width in pixels
    parameter HB = 16;              // horizontal back porch width in pixels
    parameter HR = 96;              // horizontal retrace width in pixels
    parameter HMAX = HD+HF+HB+HR-1; // max value of horizontal counter = 799
    // Total vertical length of screen = 525 pixels, partitioned into sections
    parameter VD = 480;             // vertical display area length in pixels 
    parameter VF = 10;              // vertical front porch length in pixels  
    parameter VB = 33;              // vertical back porch length in pixels   
    parameter VR = 2;               // vertical retrace length in pixels  
    parameter VMAX = VD+VF+VB+VR-1; // max value of vertical counter = 524
    
    // Counter Registers, two each for buffering to avoid glitches
    reg [9:0] h_count_reg, h_count_next;
    reg [9:0] v_count_reg, v_count_next;
    
    // Output Buffers
    reg v_sync_reg, h_sync_reg;
    wire v_sync_next, h_sync_next;
    
    // Register Control
    always @(posedge clk100 or negedge resetn)
        if(!resetn) begin // active low
            v_count_reg <= 0;
            h_count_reg <= 0;
            v_sync_reg  <= vga_polarity; // Change SYNC polarity based on monitor
            h_sync_reg  <= vga_polarity; // Change SYNC polarity based on monitor
        end
        else begin
            v_count_reg <= v_count_next;
            h_count_reg <= h_count_next;
            v_sync_reg  <= v_sync_next;
            h_sync_reg  <= h_sync_next;
        end
         
    //Logic for horizontal counter
    always @(posedge clk25 or negedge resetn)        // pixel tick
        if(!resetn) // active low
            h_count_next = 0;
        else
            if(h_count_reg == HMAX)                 // end of horizontal scan
                h_count_next = 0;
            else
                h_count_next = h_count_reg + 1;         
  
    // Logic for vertical counter
    always @(posedge clk25 or negedge resetn)
        if(!resetn) // active low
            v_count_next = 0;
        else
            if(h_count_reg == HMAX)                 // end of horizontal scan
                if((v_count_reg == VMAX))           // end of vertical scan
                    v_count_next = 0;
                else
                    v_count_next = v_count_reg + 1;
        
    // h_sync_next asserted within the horizontal retrace area
    // Change SYNC polarity based on monitor
    assign h_sync_next = (vga_polarity) ? ~(h_count_reg >= (HD+HB) && h_count_reg <= (HD+HB+HR-1)) : (h_count_reg >= (HD+HB) && h_count_reg <= (HD+HB+HR-1));
    
    // v_sync_next asserted within the vertical retrace area
    // Change SYNC polarity based on monitor
    assign v_sync_next = (vga_polarity) ? ~(v_count_reg >= (VD+VB) && v_count_reg <= (VD+VB+VR-1)) : (v_count_reg >= (VD+VB) && v_count_reg <= (VD+VB+VR-1));
    
    // Video ON/OFF - only ON while pixel counts are within the display area
    assign video_on = (h_count_reg < HD) && (v_count_reg < VD); // 0-639 and 0-479 respectively
            
    // Outputs
    assign hsync  = h_sync_reg;
    assign vsync  = v_sync_reg;
    assign x      = h_count_reg;
    assign y      = v_count_reg;

endmodule