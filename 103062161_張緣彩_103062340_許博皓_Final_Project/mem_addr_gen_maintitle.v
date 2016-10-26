module mem_addr_gen_maintitle(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 160) && (h_cnt < 480) && (v_cnt > 60) && (v_cnt < 180))? ((h_cnt - 160) >> 1): 0;
    assign cv_cnt = ((h_cnt > 160) && (h_cnt < 480) && (v_cnt > 60) && (v_cnt < 180))? ((v_cnt - 60) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*160)% 9600;

endmodule

/*module mem_addr_gen_mainplay_cover(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 188) && (v_cnt < 228))? ((h_cnt - 320) >> 1): 0;
    assign cv_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 188) && (v_cnt < 228))? ((v_cnt - 188) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*80)% 1600;

endmodule*/

module mem_addr_gen_mainplay(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 188) && (v_cnt < 228))? ((h_cnt - 320) >> 1): 0;
    assign cv_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 188) && (v_cnt < 228))? ((v_cnt - 188) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*80)% 1600;

endmodule

module mem_addr_gen_maincredit(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 236) && (v_cnt < 276))? ((h_cnt - 320) >> 1): 0;
    assign cv_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 236) && (v_cnt < 276))? ((v_cnt - 236) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*80)% 1600;

endmodule

/*module mem_addr_gen_maincredit_uncover(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 236) && (v_cnt < 276))? ((h_cnt - 320) >> 1): 0;
    assign cv_cnt = ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 236) && (v_cnt < 276))? ((v_cnt - 236) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*80)% 1600;

endmodule*/

module mem_addr_gen_credit(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [15:0] pixel_addr
    );
    
    reg [9:0] position;
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 276) && (h_cnt < 494) && (v_cnt > 60) && (v_cnt < 325))? ((h_cnt - 276) >> 1): 0;
    assign cv_cnt = ((h_cnt > 276) && (h_cnt < 494) && (v_cnt > 60) && (v_cnt < 325))? ((v_cnt - 60) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*109 + position*109)% 19620;
    
    always@(posedge clk or posedge rst) begin
         if(rst) position <= 0;
         else if(position < 180) position <= position + 1;
         else position <= 0;
    end

endmodule

module mem_addr_gen_tiger(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 160) && (h_cnt < 479) && (v_cnt > 60) && (v_cnt < 179))? ((h_cnt - 160) >> 1): 0;
    assign cv_cnt = ((h_cnt > 160) && (h_cnt < 479) && (v_cnt > 60) && (v_cnt < 179))? ((v_cnt - 60) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*160)% 9600;

endmodule

module mem_addr_gen_birthday(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [15:0] pixel_addr
    );
    
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 160) && (h_cnt < 479) && (v_cnt > 60) && (v_cnt < 179))? ((h_cnt - 160) >> 1): 0;
    assign cv_cnt = ((h_cnt > 160) && (h_cnt < 479) && (v_cnt > 60) && (v_cnt < 179))? ((v_cnt - 60) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*160)% 9600;

endmodule

module mem_addr_gen_payphone(
    input clk,
    input rst,
    input rst_pause,
    input pause,
    input forward,
    input backward,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output [15:0] pixel_addr
    );
    
    reg [9:0] position;
    reg enable;
    wire [9:0] ch_cnt, cv_cnt;
    
    assign ch_cnt = ((h_cnt > 159) && (h_cnt < 480) && (v_cnt > 119) && (v_cnt < 360))? ((h_cnt - 160) >> 1): 0;
    assign cv_cnt = ((h_cnt > 159) && (h_cnt < 480) && (v_cnt > 119) && (v_cnt < 360))? ((v_cnt - 120) >> 1): 0;
    assign pixel_addr = (ch_cnt + cv_cnt*320 + position*320)% 38400;
     
    always @(posedge rst_pause or posedge pause) begin
         if(rst_pause) enable <= 0;
         else enable <= ~enable;
    end
    
    always@(posedge clk or posedge rst) begin
         if(rst) position <= 0;
         else if(enable == 0) 
             position <= position;
         else if(enable == 1) begin
             if(backward) begin
                 if(position == 0) position <= 239;
                 else position <= position - 1;
             end else if(position < 240) position <= position + 1;
             else position <= 0;
         end else 
             position <= 0;
    end

endmodule