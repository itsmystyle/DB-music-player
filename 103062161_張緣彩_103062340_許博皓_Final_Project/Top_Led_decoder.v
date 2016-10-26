module Top_Led_decoder(
    input [31:0] Rled,
    input [31:0] Lled,
    output wire[6:0] o_Rled,
    output wire[6:0] o_Lled
    );
    
    assign o_Rled = (Rled == 32'd524 || Rled == 32'd262 || Rled == 32'd131 || Rled == 32'd277 || Rled == 32'd554 || Rled == 32'd1108)? 7'b000_0001:           //c
                        (Rled == 32'd588 || Rled == 32'd294 || Rled == 32'd147 || Rled == 32'd311 || Rled == 32'd622 || Rled == 32'd1244)? 7'b000_0011:       //d
                        (Rled == 32'd660 || Rled == 32'd330 || Rled == 32'd165)? 7'b000_0111:                          //e
                        (Rled == 32'd698 || Rled == 32'd349 || Rled == 32'd174 || Rled == 32'd370 || Rled == 32'd740 || Rled == 32'd1480)? 7'b000_1111:       //f
                        (Rled == 32'd784 || Rled == 32'd392 || Rled == 32'd196 || Rled == 32'd415 || Rled == 32'd830 || Rled == 32'd1660)? 7'b001_1111:       //g
                        (Rled == 32'd880 || Rled == 32'd440 || Rled == 32'd220 || Rled == 32'd466 || Rled == 32'd932 || Rled == 32'd1864)? 7'b011_1111:       //a
                        (Rled == 32'd988 || Rled == 32'd494 || Rled == 32'd247 || Rled == 32'd1976)? 7'b111_1111: 7'b000_0000;             //b                                                                //b
                        
    assign o_Lled = (Lled == 32'd524 || Lled == 32'd262 || Lled == 32'd131 || Lled == 32'd277 || Lled == 32'd554 || Lled == 32'd1108)? 7'b000_0001:           //c
                        (Lled == 32'd588 || Lled == 32'd294 || Lled == 32'd147 || Lled == 32'd311 || Lled == 32'd622 || Lled == 32'd1244)? 7'b000_0011:       //d
                        (Lled == 32'd660 || Lled == 32'd330 || Lled == 32'd165)? 7'b000_0111:                          //e
                        (Lled == 32'd698 || Lled == 32'd349 || Lled == 32'd174 || Lled == 32'd370 || Lled == 32'd740 || Lled == 32'd1480)? 7'b000_1111:       //f
                        (Lled == 32'd784 || Lled == 32'd392 || Lled == 32'd196 || Lled == 32'd415 || Lled == 32'd830 || Lled == 32'd1660)? 7'b001_1111:       //g
                        (Lled == 32'd880 || Lled == 32'd440 || Lled == 32'd220 || Lled == 32'd466 || Lled == 32'd932 || Lled == 32'd1864)? 7'b011_1111:       //a
                        (Lled == 32'd988 || Lled == 32'd494 || Lled == 32'd247 || Lled == 32'd1976)? 7'b111_1111: 7'b000_0000;             //b
                            
endmodule
