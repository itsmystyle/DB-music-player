module mem_addr_gen_arbor(
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
   assign pixel_addr = (((ch_cnt + position)%260) + 260*cv_cnt);
    
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
                if(position == 0) position <= 259;
                else position <= position - 1;
            end else if(position < 259) position <= position + 1;
            else position <= 0;
        end else 
            position <= 0;
   end    
    
endmodule
