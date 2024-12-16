`timescale 1ns / 1ps

///////IR fields
`define oper_type   IR[31:27]
`define rdst        IR[26:22]
`define rsrc1       IR[21:17]
`define imm_mode    IR[16]
`define rsrc2       IR[15:11]
`define isrc        IR[15:0]

///////Arithmetic operation
`define movsgpr 5'b00000
`define mov     5'b00001
`define add     5'b00010
`define sub     5'b00011
`define mul     5'b00100

module top();

reg [31:0] IR;

reg [15:0] GPR [31:0];

reg [15:0] SGPR;
reg [31:0] mul_res;

always@(*)
begin

case(`oper_type)


`movsgpr: begin
    
    GPR[`rdst] = SGPR;

end

`mov : begin

    if(`imm_mode)
        GPR[`rdst] = `isrc;
    else
        GPR[`rdst] = GPR[`rsrc1];
 end
 
 `add : begin
 
    if(`imm_mode)
        GPR[`rdst] = GPR[`rsrc1] + `isrc;
    else 
        GPR[`rdst] = GPR[`rsrc1] + GPR[`rsrc2];
 end
 
 `sub : begin
    
    if(`imm_mode)
        GPR[`rdst] = GPR[`rsrc1] - `isrc;
    else
        GPR[`rdst] = GPR[`rsrc1] - GPR[`rsrc2];
 
 end       

`mul : begin
    if(`imm_mode)
        mul_res = GPR[`rsrc1] * `isrc;
    else
        mul_res = GPR[`rsrc1] * GPR[`rsrc2];
        
    GPR[`rdst]  = mul_res[15:0];
    SGPR        = mul_res[31:16];
    
end


endcase
end
endmodule
