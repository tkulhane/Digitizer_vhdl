`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.10


module COREFIFO_C2_COREFIFO_C2_0_LSRAM_top(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       R_EN,
       W_CLK,
       R_CLK
    );
input  [19:0] W_DATA;
output [19:0] R_DATA;
input  [9:0] W_ADDR;
input  [9:0] R_ADDR;
input  W_EN;
input  R_EN;
input  W_CLK;
input  R_CLK;

    wire \ACCESS_BUSY[0][0] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%1024-1024%20-20%SPEED%0%0%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C2_COREFIFO_C2_0_LSRAM_top_R0C0 (.A_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .B_DOUT({nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, 
        nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, nc19}), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(R_CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), 
        .A_WEN({GND, GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(W_CLK), .B_DIN({W_DATA[19], W_DATA[18], 
        W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], 
        W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
