module Top_Vga_control(
   input clk,
   input rst,
   input play,
   input next,
   input forward,
   input backward,
   input [1:0] music_sel,
   input [2:0] speed,
   input [1:0] mainstate,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync
   );
    
    wire [11:0] data;
    wire clk_25MHz;
    wire [15:0] pixel_addr_tiger, pixel_addr_payphone, pixel_addr_birthday,
                pixel_addr_maintitle, pixel_addr_mainplay,
                pixel_addr_maincredit, pixel_addr_credit,
                pixel_addr_arbor;
    wire [11:0] pixel_tiger, pixel_birthday, pixel_payphone, pixel_arbor, pixel_bg,
                pixel_maintitle, pixel_mainplay_cover, pixel_mainplay_uncover,
                pixel_maincredit_cover, pixel_maincredit_uncover, pixel_credit;
    wire valid;
    wire [9:0] h_cnt;
    wire [9:0] v_cnt;
    wire clk_sel, clk_22, clk_14, clk_23, clk_21;
    reg [1:0] pre_music_sel;
    wire music_sel_control_flow;
    wire [3:0] bg_vgaRed, bg_vgaGreen, bg_vgaBlue;
    
    assign music_sel_control_flow = (pre_music_sel != music_sel)? 1'd1: 1'd0;
    
    always@(posedge clk or posedge rst) begin
        if(rst) pre_music_sel <= 2'd0;
        else pre_music_sel <= music_sel;
    end

    assign {vgaRed, vgaGreen, vgaBlue} = (valid == 1'b1 && mainstate == 2'd2)? (
                                            (music_sel == 2'd0 && (h_cnt > 161) && (h_cnt < 480) && (v_cnt > 60) && (v_cnt < 180))? pixel_tiger:
                                            (music_sel == 2'd1 && (h_cnt > 161) && (h_cnt < 480) && (v_cnt > 60) && (v_cnt < 180))? pixel_birthday:
                                            (music_sel == 2'd2 && (h_cnt > 161) && (h_cnt < 480) && (v_cnt > 119) && (v_cnt < 360))? pixel_payphone:
                                            (music_sel == 2'd3 && (h_cnt > 161) && (h_cnt < 480) && (v_cnt > 119) && (v_cnt < 360))? pixel_arbor : pixel_bg):
                                          (valid == 1'b1 && mainstate == 2'd0)? (
                                            ((h_cnt > 160) && (h_cnt < 480) && (v_cnt > 60) && (v_cnt < 180))? pixel_maintitle:
                                            ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 188) && (v_cnt < 228))? pixel_mainplay_cover: 
                                            ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 236) && (v_cnt < 276))? pixel_maincredit_uncover: pixel_bg):
                                          (valid == 1'b1 && mainstate == 2'd1)? (
                                            ((h_cnt > 160) && (h_cnt < 480) && (v_cnt > 60) && (v_cnt < 180))? pixel_maintitle:
                                            ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 188) && (v_cnt < 228))? pixel_mainplay_uncover:
                                            ((h_cnt > 320) && (h_cnt < 480) && (v_cnt > 236) && (v_cnt < 276))? pixel_maincredit_cover: pixel_bg):
                                          (valid == 1'b1 && mainstate == 2'd3)? (
                                            ((h_cnt > 276) && (h_cnt < 494) && (v_cnt > 60) && (v_cnt < 325))? pixel_credit: pixel_bg): pixel_bg;
   
    clock_divisor_nopara clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz)
    );
    
    assign pixel_bg = {bg_vgaRed, bg_vgaGreen, bg_vgaBlue};
    assign clk_sel = (forward || backward)? clk_14: clk_22;
    
    clock_divisor #(14) clk14(.clk(clk), .clk_out(clk_14));
    clock_divisor #(21) clk21(.clk(clk), .clk_out(clk_21));
    clock_divisor #(22) clk22(.clk(clk), .clk_out(clk_22));
    clock_divisor #(23) clk23(.clk(clk), .clk_out(clk_23)); 
    
    mem_addr_gen_tiger mem_addr_gen_inst_tiger(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_tiger)
    );
    
    mem_addr_gen_birthday mem_addr_gen_inst_birthday(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_birthday)
    );
    
    mem_addr_gen_maintitle mem_addr_gen_inst_maintitle(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_maintitle)
    );
    
    mem_addr_gen_mainplay mem_addr_gen_inst_mainplay(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_mainplay)
    );
    
    mem_addr_gen_maincredit mem_addr_gen_inst_maincredit(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_maincredit)
    );                

    mem_addr_gen_payphone mem_addr_gen_inst_payphone(
        .clk(clk_sel),
        .rst(rst || next || music_sel_control_flow),
        .rst_pause(rst),
        .pause(play),
        .forward(forward),
        .backward(backward),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_payphone)
    );
    
    mem_addr_gen_credit mem_addr_gen_inst_credit(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_credit)
    );    
    
    mem_addr_gen_arbor mem_addr_gen_inst_arbor(
        .clk(clk_sel),
        .rst(rst || next || music_sel_control_flow),
        .rst_pause(rst),
        .pause(play),
        .forward(forward),
        .backward(backward),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_arbor)
    );    
 
    blk_mem_gen_Tiger blk_mem_gen_tiger_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_tiger),
        .dina(data[11:0]),
        .douta(pixel_tiger)
    );
    
    blk_mem_gen_Birtyday blk_mem_gen_birthday_inst(
       .clka(clk_25MHz),
       .wea(0),
       .addra(pixel_addr_birthday),
       .dina(data[11:0]),
       .douta(pixel_birthday)
    );
    
    blk_mem_gen_PayPhone blk_mem_gen_payphone_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_payphone),
        .dina(data[11:0]),
        .douta(pixel_payphone)
    ); 
        
    blk_mem_gen_Arbor blk_mem_gen_arbor_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_arbor),
        .dina(data[11:0]),
        .douta(pixel_arbor)
    );
    
    blk_mem_gen_MainTitle blk_mem_gen_maintitle_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_maintitle),
        .dina(data[11:0]),
        .douta(pixel_maintitle)
    );
    
    blk_mem_gen_Credit blk_mem_gen_credit_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_credit),
        .dina(data[11:0]),
        .douta(pixel_credit)
    );
    
    blk_mem_gen_MainCredit_uncover blk_mem_gen_mcuncover_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_maincredit),
        .dina(data[11:0]),
        .douta(pixel_maincredit_uncover)
    );
    
    blk_mem_gen_MainCredit_cover blk_mem_gen_mccover_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_maincredit),
        .dina(data[11:0]),
        .douta(pixel_maincredit_cover)
    );
        
    blk_mem_gen_MainPlay_uncover blk_mem_gen_mpuncover_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_mainplay),
        .dina(data[11:0]),
        .douta(pixel_mainplay_uncover)
    );
        
    blk_mem_gen_MainPlay_cover blk_mem_gen_mpcover_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr_mainplay),
        .dina(data[11:0]),
        .douta(pixel_mainplay_cover)
    );
    
    Background_generator bggen_inst(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .valid(valid),
        .vgaRed(bg_vgaRed),
        .vgaGreen(bg_vgaGreen),
        .vgaBlue(bg_vgaBlue)
    );                                                       

    vga_controller vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );
     
    
endmodule
