`timescale 1ns / 1ps

module tb;

integer i = 0;

top dut();

initial begin 
for(i = 0; i < 32; i = i+1)
begin
    dut.GPR[i] = 2;
end
end

initial begin 
$display("-------------------------------------------------------------------------");
dut.IR = 0;
dut.`imm_mode   = 1;
dut.`oper_type  = 2;
dut.`rsrc1      = 2;
dut.`rdst       = 0;
dut.`isrc       = 4;
#10;
$display("OP: ADD Rsrc1: %0d  Rsrc2: %0d  Rdst: %0d", dut.GPR[2],dut.`isrc, dut.GPR[0]);
$display("-------------------------------------------------------------------------");

dut.IR = 0;
dut.`imm_mode   = 0;
dut.`oper_type  = 3;
dut.`rsrc1      = 4;
dut.`rsrc2      = 5;
dut.`rdst       = 0;
#10;
$display("OP: SUB Rsrc1: %0d  Rsrc2: %0d  Rdst: %0d", dut.GPR[4],dut.GPR[5], dut.GPR[0]);
$display("-------------------------------------------------------------------------");

dut.IR = 0;
dut.`imm_mode = 1;
dut.`oper_type = 1;
dut.`rdst = 4;
dut.`isrc = 55;
#10;
$display("OP: MOV Rdst: %0d imm_data= %0d", dut.GPR[4],dut.`isrc);
$display("-------------------------------------------------------------------------");

dut.IR = 0;
dut.`imm_mode = 0;
dut.`oper_type = 1;
dut.`rdst = 4;
dut.`rsrc1 = 7;
#10;
$display("OP: MOV Rdst: %0d Rsrc1= %0d", dut.GPR[4],dut.GPR[7]);
$display("-------------------------------------------------------------------------");

dut.IR = 0;
dut.`imm_mode   = 0;
dut.`oper_type  = 4;
dut.`rsrc1      = 0;
dut.`rsrc2      = 1;
dut.`rdst       = 2;
#1;
dut.IR = 0;
dut.`imm_mode = 1;
dut.`oper_type = 1;
dut.`rdst = 3;
dut.`isrc = dut.SGPR;
#10

$display("OP: MUL Rsrc1: %0d  Rsrc2: %0d  Rdst[LSB]: %0d Rdst[MSB]: %0d ", dut.GPR[0],dut.GPR[1], dut.GPR[2], dut.GPR[3]);
$display("-------------------------------------------------------------------------");
end
endmodule
