module Background_generator(
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input valid,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue
    );
    
    always@(*) begin
        if(!valid) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end else if(((h_cnt - 417)*(h_cnt - 417)+(v_cnt - 455)*(v_cnt - 455)) < 289) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0ff;
        end else if((((h_cnt - 609)*(h_cnt - 609)+(v_cnt - 165)*(v_cnt - 165)) < 169) ||
                    (((h_cnt - 343)*(h_cnt - 343)+(v_cnt - 455)*(v_cnt - 455)) < 64) ||
                    (((h_cnt - 477)*(h_cnt - 477)+(v_cnt - 389)*(v_cnt - 389)) < 729)) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h6f0;
        end else if((((h_cnt - 81)*(h_cnt - 81)+(v_cnt - 334)*(v_cnt - 334)) < 2809) ||
                    (((h_cnt - 133)*(h_cnt - 133)+(v_cnt - 120)*(v_cnt - 120)) < 361)) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h70f;      
        end else if((((h_cnt - 274)*(h_cnt - 274)+(v_cnt + 34)*(v_cnt + 34)) < 3721)) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
        end else if((((h_cnt - 564)*(h_cnt - 564)+(v_cnt - 81)*(v_cnt - 81)) < 3600)) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'hf4f;
        end else if(((h_cnt - 60)*(h_cnt - 60)+(v_cnt - 60)*(v_cnt - 60)) < 2209) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end else if(((h_cnt - 60)*(h_cnt - 60)+(v_cnt - 60)*(v_cnt - 60)) < 2500) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0ff;
        end else if(((h_cnt - 407)*(h_cnt - 407)+(v_cnt - 391)*(v_cnt - 391)) < 2704) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end else if(((h_cnt - 407)*(h_cnt - 407)+(v_cnt - 391)*(v_cnt - 391)) < 3025) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
        end else if(((h_cnt - 412)*(h_cnt - 412)+(v_cnt - 22)*(v_cnt - 22)) < 625) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end else if(((h_cnt - 412)*(h_cnt - 412)+(v_cnt - 22)*(v_cnt - 22)) < 784) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h6f0;
        end else if(((h_cnt - 183)*(h_cnt - 183)+(v_cnt - 372)*(v_cnt - 372)) < 7744) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end else if(((h_cnt - 183)*(h_cnt - 183)+(v_cnt - 372)*(v_cnt - 372)) < 8281) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'hff0;
        end else if(((h_cnt - 625)*(h_cnt - 625)+(v_cnt - 326)*(v_cnt - 326)) < 10404) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end else if(((h_cnt - 625)*(h_cnt - 625)+(v_cnt - 326)*(v_cnt - 326)) < 11025) begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0ff;
        end else begin
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end
    end
    
endmodule
