`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.10


module PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM(
       A_DIN,
       A_DOUT,
       B_DIN,
       B_DOUT,
       A_ADDR,
       B_ADDR,
       CLK,
       A_WEN,
       B_WEN,
       ACCESS_BUSY
    );
input  [159:0] A_DIN;
output [159:0] A_DOUT;
input  [159:0] B_DIN;
output [159:0] B_DOUT;
input  [7:0] A_ADDR;
input  [7:0] B_ADDR;
input  CLK;
input  A_WEN;
input  B_WEN;
output ACCESS_BUSY;

    wire \ACCESS_BUSY[0][0] , \ACCESS_BUSY[0][1] , \ACCESS_BUSY[0][2] , 
        \ACCESS_BUSY[0][3] , \ACCESS_BUSY[0][4] , \ACCESS_BUSY[0][5] , 
        \ACCESS_BUSY[0][6] , \ACCESS_BUSY[0][7] , OR4_0_Y, OR2_0_Y, 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%6%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C6 (.A_DOUT({
        A_DOUT[139], A_DOUT[138], A_DOUT[137], A_DOUT[136], 
        A_DOUT[135], A_DOUT[134], A_DOUT[133], A_DOUT[132], 
        A_DOUT[131], A_DOUT[130], A_DOUT[129], A_DOUT[128], 
        A_DOUT[127], A_DOUT[126], A_DOUT[125], A_DOUT[124], 
        A_DOUT[123], A_DOUT[122], A_DOUT[121], A_DOUT[120]}), .B_DOUT({
        B_DOUT[139], B_DOUT[138], B_DOUT[137], B_DOUT[136], 
        B_DOUT[135], B_DOUT[134], B_DOUT[133], B_DOUT[132], 
        B_DOUT[131], B_DOUT[130], B_DOUT[129], B_DOUT[128], 
        B_DOUT[127], B_DOUT[126], B_DOUT[125], B_DOUT[124], 
        B_DOUT[123], B_DOUT[122], B_DOUT[121], B_DOUT[120]}), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), 
        .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0], GND, GND, GND, GND})
        , .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({A_DIN[139], 
        A_DIN[138], A_DIN[137], A_DIN[136], A_DIN[135], A_DIN[134], 
        A_DIN[133], A_DIN[132], A_DIN[131], A_DIN[130], A_DIN[129], 
        A_DIN[128], A_DIN[127], A_DIN[126], A_DIN[125], A_DIN[124], 
        A_DIN[123], A_DIN[122], A_DIN[121], A_DIN[120]}), .A_REN(VCC), 
        .A_WEN({A_WEN, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], 
        B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], 
        B_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({VCC, VCC, VCC}), 
        .B_CLK(CLK), .B_DIN({B_DIN[139], B_DIN[138], B_DIN[137], 
        B_DIN[136], B_DIN[135], B_DIN[134], B_DIN[133], B_DIN[132], 
        B_DIN[131], B_DIN[130], B_DIN[129], B_DIN[128], B_DIN[127], 
        B_DIN[126], B_DIN[125], B_DIN[124], B_DIN[123], B_DIN[122], 
        B_DIN[121], B_DIN[120]}), .B_REN(VCC), .B_WEN({B_WEN, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%5%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C5 (.A_DOUT({
        A_DOUT[119], A_DOUT[118], A_DOUT[117], A_DOUT[116], 
        A_DOUT[115], A_DOUT[114], A_DOUT[113], A_DOUT[112], 
        A_DOUT[111], A_DOUT[110], A_DOUT[109], A_DOUT[108], 
        A_DOUT[107], A_DOUT[106], A_DOUT[105], A_DOUT[104], 
        A_DOUT[103], A_DOUT[102], A_DOUT[101], A_DOUT[100]}), .B_DOUT({
        B_DOUT[119], B_DOUT[118], B_DOUT[117], B_DOUT[116], 
        B_DOUT[115], B_DOUT[114], B_DOUT[113], B_DOUT[112], 
        B_DOUT[111], B_DOUT[110], B_DOUT[109], B_DOUT[108], 
        B_DOUT[107], B_DOUT[106], B_DOUT[105], B_DOUT[104], 
        B_DOUT[103], B_DOUT[102], B_DOUT[101], B_DOUT[100]}), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), 
        .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0], GND, GND, GND, GND})
        , .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({A_DIN[119], 
        A_DIN[118], A_DIN[117], A_DIN[116], A_DIN[115], A_DIN[114], 
        A_DIN[113], A_DIN[112], A_DIN[111], A_DIN[110], A_DIN[109], 
        A_DIN[108], A_DIN[107], A_DIN[106], A_DIN[105], A_DIN[104], 
        A_DIN[103], A_DIN[102], A_DIN[101], A_DIN[100]}), .A_REN(VCC), 
        .A_WEN({A_WEN, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], 
        B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], 
        B_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({VCC, VCC, VCC}), 
        .B_CLK(CLK), .B_DIN({B_DIN[119], B_DIN[118], B_DIN[117], 
        B_DIN[116], B_DIN[115], B_DIN[114], B_DIN[113], B_DIN[112], 
        B_DIN[111], B_DIN[110], B_DIN[109], B_DIN[108], B_DIN[107], 
        B_DIN[106], B_DIN[105], B_DIN[104], B_DIN[103], B_DIN[102], 
        B_DIN[101], B_DIN[100]}), .B_REN(VCC), .B_WEN({B_WEN, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 OR4_ACCESS_BUSY (.A(OR4_0_Y), .B(OR2_0_Y), .C(
        \ACCESS_BUSY[0][6] ), .D(\ACCESS_BUSY[0][7] ), .Y(ACCESS_BUSY));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%4%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C4 (.A_DOUT({
        A_DOUT[99], A_DOUT[98], A_DOUT[97], A_DOUT[96], A_DOUT[95], 
        A_DOUT[94], A_DOUT[93], A_DOUT[92], A_DOUT[91], A_DOUT[90], 
        A_DOUT[89], A_DOUT[88], A_DOUT[87], A_DOUT[86], A_DOUT[85], 
        A_DOUT[84], A_DOUT[83], A_DOUT[82], A_DOUT[81], A_DOUT[80]}), 
        .B_DOUT({B_DOUT[99], B_DOUT[98], B_DOUT[97], B_DOUT[96], 
        B_DOUT[95], B_DOUT[94], B_DOUT[93], B_DOUT[92], B_DOUT[91], 
        B_DOUT[90], B_DOUT[89], B_DOUT[88], B_DOUT[87], B_DOUT[86], 
        B_DOUT[85], B_DOUT[84], B_DOUT[83], B_DOUT[82], B_DOUT[81], 
        B_DOUT[80]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], 
        A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], 
        A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({A_DIN[99], A_DIN[98], A_DIN[97], 
        A_DIN[96], A_DIN[95], A_DIN[94], A_DIN[93], A_DIN[92], 
        A_DIN[91], A_DIN[90], A_DIN[89], A_DIN[88], A_DIN[87], 
        A_DIN[86], A_DIN[85], A_DIN[84], A_DIN[83], A_DIN[82], 
        A_DIN[81], A_DIN[80]}), .A_REN(VCC), .A_WEN({A_WEN, A_WEN}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], B_ADDR[5], B_ADDR[4], 
        B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND})
        , .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({B_DIN[99], 
        B_DIN[98], B_DIN[97], B_DIN[96], B_DIN[95], B_DIN[94], 
        B_DIN[93], B_DIN[92], B_DIN[91], B_DIN[90], B_DIN[89], 
        B_DIN[88], B_DIN[87], B_DIN[86], B_DIN[85], B_DIN[84], 
        B_DIN[83], B_DIN[82], B_DIN[81], B_DIN[80]}), .B_REN(VCC), 
        .B_WEN({B_WEN, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%3%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C3 (.A_DOUT({
        A_DOUT[79], A_DOUT[78], A_DOUT[77], A_DOUT[76], A_DOUT[75], 
        A_DOUT[74], A_DOUT[73], A_DOUT[72], A_DOUT[71], A_DOUT[70], 
        A_DOUT[69], A_DOUT[68], A_DOUT[67], A_DOUT[66], A_DOUT[65], 
        A_DOUT[64], A_DOUT[63], A_DOUT[62], A_DOUT[61], A_DOUT[60]}), 
        .B_DOUT({B_DOUT[79], B_DOUT[78], B_DOUT[77], B_DOUT[76], 
        B_DOUT[75], B_DOUT[74], B_DOUT[73], B_DOUT[72], B_DOUT[71], 
        B_DOUT[70], B_DOUT[69], B_DOUT[68], B_DOUT[67], B_DOUT[66], 
        B_DOUT[65], B_DOUT[64], B_DOUT[63], B_DOUT[62], B_DOUT[61], 
        B_DOUT[60]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], 
        A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], 
        A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({A_DIN[79], A_DIN[78], A_DIN[77], 
        A_DIN[76], A_DIN[75], A_DIN[74], A_DIN[73], A_DIN[72], 
        A_DIN[71], A_DIN[70], A_DIN[69], A_DIN[68], A_DIN[67], 
        A_DIN[66], A_DIN[65], A_DIN[64], A_DIN[63], A_DIN[62], 
        A_DIN[61], A_DIN[60]}), .A_REN(VCC), .A_WEN({A_WEN, A_WEN}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], B_ADDR[5], B_ADDR[4], 
        B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND})
        , .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({B_DIN[79], 
        B_DIN[78], B_DIN[77], B_DIN[76], B_DIN[75], B_DIN[74], 
        B_DIN[73], B_DIN[72], B_DIN[71], B_DIN[70], B_DIN[69], 
        B_DIN[68], B_DIN[67], B_DIN[66], B_DIN[65], B_DIN[64], 
        B_DIN[63], B_DIN[62], B_DIN[61], B_DIN[60]}), .B_REN(VCC), 
        .B_WEN({B_WEN, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%1%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C1 (.A_DOUT({
        A_DOUT[39], A_DOUT[38], A_DOUT[37], A_DOUT[36], A_DOUT[35], 
        A_DOUT[34], A_DOUT[33], A_DOUT[32], A_DOUT[31], A_DOUT[30], 
        A_DOUT[29], A_DOUT[28], A_DOUT[27], A_DOUT[26], A_DOUT[25], 
        A_DOUT[24], A_DOUT[23], A_DOUT[22], A_DOUT[21], A_DOUT[20]}), 
        .B_DOUT({B_DOUT[39], B_DOUT[38], B_DOUT[37], B_DOUT[36], 
        B_DOUT[35], B_DOUT[34], B_DOUT[33], B_DOUT[32], B_DOUT[31], 
        B_DOUT[30], B_DOUT[29], B_DOUT[28], B_DOUT[27], B_DOUT[26], 
        B_DOUT[25], B_DOUT[24], B_DOUT[23], B_DOUT[22], B_DOUT[21], 
        B_DOUT[20]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], 
        A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], 
        A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({A_DIN[39], A_DIN[38], A_DIN[37], 
        A_DIN[36], A_DIN[35], A_DIN[34], A_DIN[33], A_DIN[32], 
        A_DIN[31], A_DIN[30], A_DIN[29], A_DIN[28], A_DIN[27], 
        A_DIN[26], A_DIN[25], A_DIN[24], A_DIN[23], A_DIN[22], 
        A_DIN[21], A_DIN[20]}), .A_REN(VCC), .A_WEN({A_WEN, A_WEN}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], B_ADDR[5], B_ADDR[4], 
        B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND})
        , .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({B_DIN[39], 
        B_DIN[38], B_DIN[37], B_DIN[36], B_DIN[35], B_DIN[34], 
        B_DIN[33], B_DIN[32], B_DIN[31], B_DIN[30], B_DIN[29], 
        B_DIN[28], B_DIN[27], B_DIN[26], B_DIN[25], B_DIN[24], 
        B_DIN[23], B_DIN[22], B_DIN[21], B_DIN[20]}), .B_REN(VCC), 
        .B_WEN({B_WEN, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%0%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C0 (.A_DOUT({
        A_DOUT[19], A_DOUT[18], A_DOUT[17], A_DOUT[16], A_DOUT[15], 
        A_DOUT[14], A_DOUT[13], A_DOUT[12], A_DOUT[11], A_DOUT[10], 
        A_DOUT[9], A_DOUT[8], A_DOUT[7], A_DOUT[6], A_DOUT[5], 
        A_DOUT[4], A_DOUT[3], A_DOUT[2], A_DOUT[1], A_DOUT[0]}), 
        .B_DOUT({B_DOUT[19], B_DOUT[18], B_DOUT[17], B_DOUT[16], 
        B_DOUT[15], B_DOUT[14], B_DOUT[13], B_DOUT[12], B_DOUT[11], 
        B_DOUT[10], B_DOUT[9], B_DOUT[8], B_DOUT[7], B_DOUT[6], 
        B_DOUT[5], B_DOUT[4], B_DOUT[3], B_DOUT[2], B_DOUT[1], 
        B_DOUT[0]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], 
        A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], 
        A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({A_DIN[19], A_DIN[18], A_DIN[17], 
        A_DIN[16], A_DIN[15], A_DIN[14], A_DIN[13], A_DIN[12], 
        A_DIN[11], A_DIN[10], A_DIN[9], A_DIN[8], A_DIN[7], A_DIN[6], 
        A_DIN[5], A_DIN[4], A_DIN[3], A_DIN[2], A_DIN[1], A_DIN[0]}), 
        .A_REN(VCC), .A_WEN({A_WEN, A_WEN}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        B_ADDR[7], B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], 
        B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND}), 
        .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({B_DIN[19], 
        B_DIN[18], B_DIN[17], B_DIN[16], B_DIN[15], B_DIN[14], 
        B_DIN[13], B_DIN[12], B_DIN[11], B_DIN[10], B_DIN[9], B_DIN[8], 
        B_DIN[7], B_DIN[6], B_DIN[5], B_DIN[4], B_DIN[3], B_DIN[2], 
        B_DIN[1], B_DIN[0]}), .B_REN(VCC), .B_WEN({B_WEN, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%2%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C2 (.A_DOUT({
        A_DOUT[59], A_DOUT[58], A_DOUT[57], A_DOUT[56], A_DOUT[55], 
        A_DOUT[54], A_DOUT[53], A_DOUT[52], A_DOUT[51], A_DOUT[50], 
        A_DOUT[49], A_DOUT[48], A_DOUT[47], A_DOUT[46], A_DOUT[45], 
        A_DOUT[44], A_DOUT[43], A_DOUT[42], A_DOUT[41], A_DOUT[40]}), 
        .B_DOUT({B_DOUT[59], B_DOUT[58], B_DOUT[57], B_DOUT[56], 
        B_DOUT[55], B_DOUT[54], B_DOUT[53], B_DOUT[52], B_DOUT[51], 
        B_DOUT[50], B_DOUT[49], B_DOUT[48], B_DOUT[47], B_DOUT[46], 
        B_DOUT[45], B_DOUT[44], B_DOUT[43], B_DOUT[42], B_DOUT[41], 
        B_DOUT[40]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], 
        A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], 
        A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({A_DIN[59], A_DIN[58], A_DIN[57], 
        A_DIN[56], A_DIN[55], A_DIN[54], A_DIN[53], A_DIN[52], 
        A_DIN[51], A_DIN[50], A_DIN[49], A_DIN[48], A_DIN[47], 
        A_DIN[46], A_DIN[45], A_DIN[44], A_DIN[43], A_DIN[42], 
        A_DIN[41], A_DIN[40]}), .A_REN(VCC), .A_WEN({A_WEN, A_WEN}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], B_ADDR[5], B_ADDR[4], 
        B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND})
        , .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({B_DIN[59], 
        B_DIN[58], B_DIN[57], B_DIN[56], B_DIN[55], B_DIN[54], 
        B_DIN[53], B_DIN[52], B_DIN[51], B_DIN[50], B_DIN[49], 
        B_DIN[48], B_DIN[47], B_DIN[46], B_DIN[45], B_DIN[44], 
        B_DIN[43], B_DIN[42], B_DIN[41], B_DIN[40]}), .B_REN(VCC), 
        .B_WEN({B_WEN, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 OR4_0 (.A(\ACCESS_BUSY[0][0] ), .B(\ACCESS_BUSY[0][1] ), .C(
        \ACCESS_BUSY[0][2] ), .D(\ACCESS_BUSY[0][3] ), .Y(OR4_0_Y));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%256-256%160-160%SPEED%0%7%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C7 (.A_DOUT({
        A_DOUT[159], A_DOUT[158], A_DOUT[157], A_DOUT[156], 
        A_DOUT[155], A_DOUT[154], A_DOUT[153], A_DOUT[152], 
        A_DOUT[151], A_DOUT[150], A_DOUT[149], A_DOUT[148], 
        A_DOUT[147], A_DOUT[146], A_DOUT[145], A_DOUT[144], 
        A_DOUT[143], A_DOUT[142], A_DOUT[141], A_DOUT[140]}), .B_DOUT({
        B_DOUT[159], B_DOUT[158], B_DOUT[157], B_DOUT[156], 
        B_DOUT[155], B_DOUT[154], B_DOUT[153], B_DOUT[152], 
        B_DOUT[151], B_DOUT[150], B_DOUT[149], B_DOUT[148], 
        B_DOUT[147], B_DOUT[146], B_DOUT[145], B_DOUT[144], 
        B_DOUT[143], B_DOUT[142], B_DOUT[141], B_DOUT[140]}), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), 
        .A_ADDR({GND, GND, A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0], GND, GND, GND, GND})
        , .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({A_DIN[159], 
        A_DIN[158], A_DIN[157], A_DIN[156], A_DIN[155], A_DIN[154], 
        A_DIN[153], A_DIN[152], A_DIN[151], A_DIN[150], A_DIN[149], 
        A_DIN[148], A_DIN[147], A_DIN[146], A_DIN[145], A_DIN[144], 
        A_DIN[143], A_DIN[142], A_DIN[141], A_DIN[140]}), .A_REN(VCC), 
        .A_WEN({A_WEN, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, B_ADDR[7], B_ADDR[6], 
        B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], 
        B_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({VCC, VCC, VCC}), 
        .B_CLK(CLK), .B_DIN({B_DIN[159], B_DIN[158], B_DIN[157], 
        B_DIN[156], B_DIN[155], B_DIN[154], B_DIN[153], B_DIN[152], 
        B_DIN[151], B_DIN[150], B_DIN[149], B_DIN[148], B_DIN[147], 
        B_DIN[146], B_DIN[145], B_DIN[144], B_DIN[143], B_DIN[142], 
        B_DIN[141], B_DIN[140]}), .B_REN(VCC), .B_WEN({B_WEN, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR2 OR2_0 (.A(\ACCESS_BUSY[0][4] ), .B(\ACCESS_BUSY[0][5] ), .Y(
        OR2_0_Y));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
