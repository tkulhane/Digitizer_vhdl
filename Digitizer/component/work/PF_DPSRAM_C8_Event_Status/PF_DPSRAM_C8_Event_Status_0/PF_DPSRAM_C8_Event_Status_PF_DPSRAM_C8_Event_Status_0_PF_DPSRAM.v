`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.10


module PF_DPSRAM_C8_Event_Status_PF_DPSRAM_C8_Event_Status_0_PF_DPSRAM(
        
       A_DIN,
       A_DOUT,
       B_DIN,
       B_DOUT,
       A_ADDR,
       B_ADDR,
       CLK,
       A_WEN,
       B_WEN
    );
input  [7:0] A_DIN;
output [7:0] A_DOUT;
input  [7:0] B_DIN;
output [7:0] B_DOUT;
input  [9:0] A_ADDR;
input  [9:0] B_ADDR;
input  CLK;
input  A_WEN;
input  B_WEN;

    wire \ACCESS_BUSY[0][0] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .MEMORYFILE("PF_DPSRAM_C8_Event_Status_PF_DPSRAM_C8_Event_Status_0_PF_DPSRAM_R0C0.mem")
        , .RAMINDEX("PF_DPSRAM_C8_Event_Status_0%1024-1024%8-8%SPEED%0%0%DUAL-PORT%ECC_EN-0")
         )  
        PF_DPSRAM_C8_Event_Status_PF_DPSRAM_C8_Event_Status_0_PF_DPSRAM_R0C0 
        (.A_DOUT({nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, 
        nc10, nc11, A_DOUT[7], A_DOUT[6], A_DOUT[5], A_DOUT[4], 
        A_DOUT[3], A_DOUT[2], A_DOUT[1], A_DOUT[0]}), .B_DOUT({nc12, 
        nc13, nc14, nc15, nc16, nc17, nc18, nc19, nc20, nc21, nc22, 
        nc23, B_DOUT[7], B_DOUT[6], B_DOUT[5], B_DOUT[4], B_DOUT[3], 
        B_DOUT[2], B_DOUT[1], B_DOUT[0]}), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0], GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, A_DIN[7], 
        A_DIN[6], A_DIN[5], A_DIN[4], A_DIN[3], A_DIN[2], A_DIN[1], 
        A_DIN[0]}), .A_REN(VCC), .A_WEN({GND, A_WEN}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, 
        GND, GND}), .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        B_DIN[7], B_DIN[6], B_DIN[5], B_DIN[4], B_DIN[3], B_DIN[2], 
        B_DIN[1], B_DIN[0]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, VCC, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, VCC, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
