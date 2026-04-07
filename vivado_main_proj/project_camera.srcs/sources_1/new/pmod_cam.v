`timescale 1ns / 1ps

//src: https://github.com/AG2048/ece532-project/tree/main/vivado_proj
//with modifications to our specific needs.
module pmod_cam (
    input                   pclk,
    input                   vsync,
    input                   href,
    input       [7:0]       din,
    output reg  [31:0]      dout,       //packing 2 pixels per databeat
    output                  valid,
    output                  last,
    output                  pclk_out

);
    reg[1:0] cnt;
    reg r_href;
    reg we, r_we;
    
    // Create a 'last' pulse on the falling edge of href
    assign last = ({href, r_href} == 2'b01) ? 1'b1 : 1'b0;
    // Create a 'valid' pulse on the rising edge of write enable
    assign valid = ({we, r_we} == 2'b10) ? 1'b1 : 1'b0;
    assign pclk_out = pclk;
    
    always @(posedge pclk)
    begin 
      r_href <= href;
      r_we <= we;
    
      // Reset values on the end of a frame
      if (vsync == 1)
          begin
            cnt <= 'd0;
            we <= 1'b0;
          end
      else
          begin
            // While reading a line, output the RGB value once we have received all
            // colour channels
            if (href == 1'b1)
                begin
                  if (cnt == 'd3)
                      begin
                        cnt <= 'd0;
                        we <= 1'b1;
                      end
                  else
                      begin
                        cnt <= cnt + 'd1;
                        we <= 1'b0;
                      end
                end
             else
                begin
                  we<=0;
                  cnt <= 2'd0;
                end 
        
            // Update the pixel data according to our internal counter
            // assume RGB 565. first byte R second byte G and B
            case (cnt)
              3 : begin
                dout[20:16] <= din[4:0]; // b2
                dout[23:21] <= din[7:5]; // g2
                end
              2 : begin
                dout[31:27] <= din[7:3]; //r2
                dout[26:24] <= din[2:0]; //g2
                end
              1 : begin
                dout[4:0] <= din[4:0]; // b1
                dout[7:5] <= din[7:5]; // g1
                end
              0 : begin
                dout[15:11] <= din[7:3]; //r1
                dout[10:8] <= din[2:0]; //g1
                end
            endcase
            end
    end

endmodule

