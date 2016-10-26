`define NM1_5 32'd139 //C#_freq
`define NM2_5 32'd147 //D_freq
`define NM3_5 32'd165 //E_freq
`define NM4_5 32'd185 //F#_freq
`define NM5_5 32'd196 //G_freq
`define NM6_5 32'd220 //A_freq
`define NM7_5 32'd247 //B_freq
`define NM0_5 32'd20000 //slience (over freq.)

module Music4_L(
	input [7:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		8'd0 : tone = `NM0_5;	
		8'd1 : tone = `NM2_5 << 1;
		8'd2 : tone = `NM4_5 << 1;
		8'd3 : tone = `NM4_5 << 1;
		8'd4 : tone = `NM6_5 << 1;	
		8'd5 : tone = `NM6_5 << 1;
		8'd6 : tone = `NM6_5 << 1;
		8'd7 : tone = `NM6_5 << 1;
		8'd8 : tone = `NM6_5 << 1;	
		8'd9 : tone = `NM6_5 << 1;
		8'd10 : tone = `NM6_5 << 1;
		8'd11 : tone = `NM6_5 << 1;
		8'd12 : tone = `NM6_5 << 1;
		8'd13 : tone = `NM6_5 << 1;
		8'd14 : tone = `NM2_5 << 1;
		8'd15 : tone = `NM2_5 << 1;
		
		8'd16 : tone = `NM1_5 << 1;
		8'd17 : tone = `NM1_5 << 1;
		8'd18 : tone = `NM2_5 << 1;
		8'd19 : tone = `NM2_5 << 1;
		8'd20 : tone = `NM4_5 << 1;
		8'd21 : tone = `NM4_5 << 1;
		8'd22 : tone = `NM4_5 << 1;
		8'd23 : tone = `NM4_5 << 1;
		8'd24 : tone = `NM4_5 << 1;
		8'd25 : tone = `NM4_5 << 1;
		8'd26 : tone = `NM4_5 << 1;
		8'd27 : tone = `NM4_5 << 1;
		8'd28 : tone = `NM4_5 << 1;
		8'd29 : tone = `NM4_5 << 1;
		8'd30 : tone = `NM1_5 << 1;
		8'd31 : tone = `NM1_5 << 1;
		
		8'd32 : tone = `NM7_5 << 1;
		8'd33 : tone = `NM7_5 << 1;
		8'd34 : tone = `NM2_5 << 1;
		8'd35 : tone = `NM2_5 << 1;
		8'd36 : tone = `NM4_5 << 1;
		8'd37 : tone = `NM4_5 << 1;
		8'd38 : tone = `NM4_5 << 1;
		8'd39 : tone = `NM4_5 << 1;
		8'd40 : tone = `NM4_5 << 1;
		8'd41 : tone = `NM4_5 << 1;
		8'd42 : tone = `NM4_5 << 1;
		8'd43 : tone = `NM4_5 << 1;
		8'd44 : tone = `NM4_5 << 1;
		8'd45 : tone = `NM4_5 << 1;
		8'd46 : tone = `NM2_5;
		8'd47 : tone = `NM2_5;
		
		8'd48 : tone = `NM5_5 >> 1;
		8'd49 : tone = `NM5_5 >> 1;
		8'd50 : tone = `NM2_5;
		8'd51 : tone = `NM2_5;
		8'd52 : tone = `NM5_5;
		8'd53 : tone = `NM5_5;
		8'd54 : tone = `NM7_5;
		8'd55 : tone = `NM7_5;
		8'd56 : tone = `NM2_5 << 1;
		8'd57 : tone = `NM2_5 << 1;
		8'd58 : tone = `NM5_5;
		8'd59 : tone = `NM5_5;
		8'd60 : tone = `NM7_5;
		8'd61 : tone = `NM7_5;
		8'd62 : tone = `NM7_5;
		8'd63 : tone = `NM7_5;
		
		8'd64 : tone = `NM6_5 >> 1;
		8'd65 : tone = `NM6_5 >> 1;
		8'd66 : tone = `NM2_5;
		8'd67 : tone = `NM2_5;
		8'd68 : tone = `NM4_5;
		8'd69 : tone = `NM4_5;
		8'd70 : tone = `NM6_5;
		8'd71 : tone = `NM6_5;
		8'd72 : tone = `NM6_5;
		8'd73 : tone = `NM6_5;
		8'd74 : tone = `NM6_5;
		8'd75 : tone = `NM6_5;
		8'd76 : tone = `NM6_5;
		8'd77 : tone = `NM6_5;
		8'd78 : tone = `NM6_5;
		8'd79 : tone = `NM6_5;
		
		8'd80 : tone = `NM6_5 >> 1;
		8'd81 : tone = `NM6_5 >> 1;
		8'd82 : tone = `NM3_5;
		8'd83 : tone = `NM3_5;
		8'd84 : tone = `NM5_5;
		8'd85 : tone = `NM5_5;
		8'd86 : tone = `NM6_5;
		8'd87 : tone = `NM6_5;
		8'd88 : tone = `NM1_5 << 1;
		8'd89 : tone = `NM1_5 << 1;
		8'd90 : tone = `NM3_5 << 1;
		8'd91 : tone = `NM3_5 << 1;
		8'd92 : tone = `NM3_5 << 1;
		8'd93 : tone = `NM3_5 << 1;
		8'd94 : tone = `NM3_5 << 1;
		8'd95 : tone = `NM3_5 << 1;
		
		8'd96 : tone = `NM2_5;
		8'd97 : tone = `NM2_5;
		8'd98 : tone = `NM4_5;
		8'd99 : tone = `NM4_5;
		8'd100 : tone = `NM6_5;
		8'd101 : tone = `NM6_5;
		8'd102 : tone = `NM6_5;
		8'd103 : tone = `NM6_5;
		8'd104 : tone = `NM6_5;
		8'd105 : tone = `NM6_5;
		8'd106 : tone = `NM6_5;
		8'd107 : tone = `NM6_5;	
		8'd108 : tone = `NM6_5;	
		8'd109 : tone = `NM6_5;
		8'd110 : tone = `NM6_5;
		8'd111 : tone = `NM6_5;
		
		8'd112 : tone = `NM5_5 >> 1;	
		8'd113 : tone = `NM5_5 >> 1;
		8'd114 : tone = `NM2_5;
		8'd115 : tone = `NM2_5;
		8'd116 : tone = `NM5_5;	
		8'd117 : tone = `NM5_5;
		8'd118 : tone = `NM1_5 << 1;
		8'd119 : tone = `NM1_5 << 1;
		8'd120 : tone = `NM3_5 << 1;
		8'd121 : tone = `NM3_5 << 1;
		8'd122 : tone = `NM6_5;
		8'd123 : tone = `NM6_5;
		8'd124 : tone = `NM1_5 << 1;
		8'd125 : tone = `NM1_5 << 1;
		8'd126 : tone = `NM1_5 << 1;
		8'd127 : tone = `NM1_5 << 1;
		
		8'd128 : tone = `NM2_5;
		8'd129 : tone = `NM2_5;
		8'd130 : tone = `NM4_5;
		8'd131 : tone = `NM4_5;
		8'd132 : tone = `NM6_5;
		8'd133 : tone = `NM6_5;
		8'd134 : tone = `NM2_5 << 1;
		8'd135 : tone = `NM2_5 << 1;
		8'd136 : tone = `NM2_5 << 1;
		8'd137 : tone = `NM2_5 << 1;
		8'd138 : tone = `NM6_5;
		8'd139 : tone = `NM6_5;
		8'd140 : tone = `NM2_5 << 1;
		8'd141 : tone = `NM2_5 << 1;
		8'd142 : tone = `NM2_5;
		8'd143 : tone = `NM2_5;
		
		8'd144 : tone = `NM1_5;
		8'd145 : tone = `NM1_5;
		8'd146 : tone = `NM4_5;
		8'd147 : tone = `NM4_5;
		8'd148 : tone = `NM6_5;
		8'd149 : tone = `NM6_5;
		8'd150 : tone = `NM2_5 << 1;
		8'd151 : tone = `NM2_5 << 1;
		8'd152 : tone = `NM2_5 << 1;
		8'd153 : tone = `NM2_5 << 1;
		8'd154 : tone = `NM2_5;
		8'd155 : tone = `NM2_5;
		8'd156 : tone = `NM2_5 << 1;
		8'd157 : tone = `NM2_5 << 1;
		8'd158 : tone = `NM2_5;
		8'd159 : tone = `NM2_5;
		
		8'd160 : tone = `NM7_5 >> 1;
		8'd161 : tone = `NM7_5 >> 1;
		8'd162 : tone = `NM4_5;
		8'd163 : tone = `NM4_5;
		8'd164 : tone = `NM7_5;
		8'd165 : tone = `NM7_5;
		8'd166 : tone = `NM2_5 << 1;
		8'd167 : tone = `NM2_5 << 1;
		8'd168 : tone = `NM2_5 << 1;
		8'd169 : tone = `NM2_5 << 1;
		8'd170 : tone = `NM4_5;
		8'd171 : tone = `NM4_5;
		8'd172 : tone = `NM2_5 << 1;
		8'd173 : tone = `NM2_5 << 1;
		8'd174 : tone = `NM2_5 << 1;
		8'd175 : tone = `NM2_5 << 1;
		
		8'd176 : tone = `NM5_5 >> 1;
		8'd177 : tone = `NM5_5 >> 1;
		8'd178 : tone = `NM2_5;
		8'd179 : tone = `NM2_5;
		8'd180 : tone = `NM5_5;
		8'd181 : tone = `NM5_5;
		8'd182 : tone = `NM7_5;
		8'd183 : tone = `NM7_5;
		8'd184 : tone = `NM2_5 << 1;
		8'd185 : tone = `NM2_5 << 1;
		8'd186 : tone = `NM5_5;
		8'd187 : tone = `NM5_5;
		8'd188 : tone = `NM5_5;
		8'd189 : tone = `NM5_5;
		8'd190 : tone = `NM5_5;
		8'd191 : tone = `NM5_5;
		
		8'd192 : tone = `NM6_5 >> 1;
		8'd193 : tone = `NM6_5 >> 1;
		8'd194 : tone = `NM2_5;
		8'd195 : tone = `NM2_5;
		8'd196 : tone = `NM6_5;
		8'd197 : tone = `NM6_5;
		8'd198 : tone = `NM4_5;
		8'd199 : tone = `NM4_5;
		8'd200 : tone = `NM6_5;
		8'd201 : tone = `NM6_5;
		8'd202 : tone = `NM6_5;
		8'd203 : tone = `NM6_5;
		8'd204 : tone = `NM6_5;
		8'd205 : tone = `NM6_5;
		8'd206 : tone = `NM6_5;
		8'd207 : tone = `NM6_5;
		
		8'd208 : tone = `NM6_5 >> 1;
		8'd209 : tone = `NM6_5 >> 1;
		8'd210 : tone = `NM3_5;
		8'd211 : tone = `NM3_5;
		8'd212 : tone = `NM5_5;
		8'd213 : tone = `NM5_5;
		8'd214 : tone = `NM5_5;
		8'd215 : tone = `NM5_5;
		8'd216 : tone = `NM5_5;
		8'd217 : tone = `NM5_5;
		8'd218 : tone = `NM6_5;
		8'd219 : tone = `NM6_5;
		8'd220 : tone = `NM1_5 << 1;
		8'd221 : tone = `NM1_5 << 1;
		8'd222 : tone = `NM6_5;
		8'd223 : tone = `NM6_5;
		
		8'd224 : tone = `NM2_5;
		8'd225 : tone = `NM2_5;
		8'd226 : tone = `NM4_5;
		8'd227 : tone = `NM4_5;
		8'd228 : tone = `NM6_5;
		8'd229 : tone = `NM6_5;
		8'd230 : tone = `NM2_5 << 1;
		8'd231 : tone = `NM2_5 << 1;
		8'd232 : tone = `NM2_5 << 1;
		8'd233 : tone = `NM2_5 << 1;
		8'd234 : tone = `NM2_5;
		8'd235 : tone = `NM2_5;
		8'd236 : tone = `NM4_5;
		8'd237 : tone = `NM4_5;
		8'd238 : tone = `NM2_5 << 1;
		8'd239 : tone = `NM2_5 << 1;
		
		8'd240 : tone = `NM2_5;
		8'd241 : tone = `NM2_5;
		8'd242 : tone = `NM4_5;
		8'd243 : tone = `NM4_5;
		8'd244 : tone = `NM6_5;
		8'd245 : tone = `NM6_5;
		8'd246 : tone = `NM2_5 << 1;
		8'd247 : tone = `NM2_5 << 1;
		8'd248 : tone = `NM2_5 << 1;
		8'd249 : tone = `NM2_5 << 1;
		8'd250 : tone = `NM2_5 << 1;
		8'd251 : tone = `NM2_5 << 1;
		
		8'd252 : tone = `NM7_5 >> 1;
		8'd253 : tone = `NM7_5 >> 1;
		8'd254 : tone = `NM4_5;
		8'd255 : tone = `NM4_5;
		
		default : tone = `NM0_5;
	endcase
end

endmodule