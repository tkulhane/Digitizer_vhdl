`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.10


module COREFIFO_C8_COREFIFO_C8_0_LSRAM_top(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       R_EN,
       W_CLK,
       R_CLK
    );
input  [39:0] W_DATA;
output [39:0] R_DATA;
input  [12:0] W_ADDR;
input  [12:0] R_ADDR;
input  W_EN;
input  R_EN;
input  W_CLK;
input  R_CLK;

    wire \ACCESS_BUSY[0][0] , \ACCESS_BUSY[0][1] , \ACCESS_BUSY[0][2] , 
        \ACCESS_BUSY[0][3] , \ACCESS_BUSY[0][4] , \ACCESS_BUSY[0][5] , 
        \ACCESS_BUSY[0][6] , \ACCESS_BUSY[0][7] , \ACCESS_BUSY[0][8] , 
        \ACCESS_BUSY[0][9] , \ACCESS_BUSY[0][10] , 
        \ACCESS_BUSY[0][11] , \ACCESS_BUSY[0][12] , 
        \ACCESS_BUSY[0][13] , \ACCESS_BUSY[0][14] , 
        \ACCESS_BUSY[0][15] , \ACCESS_BUSY[0][16] , 
        \ACCESS_BUSY[0][17] , \ACCESS_BUSY[0][18] , 
        \ACCESS_BUSY[0][19] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%19%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C19 (.A_DOUT({nc0, 
        nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, 
        nc13, nc14, nc15, nc16, nc17, R_DATA[39], R_DATA[38]}), 
        .B_DOUT({nc18, nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26, 
        nc27, nc28, nc29, nc30, nc31, nc32, nc33, nc34, nc35, nc36, 
        nc37}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][19] ), .A_ADDR({R_ADDR[12], R_ADDR[11], 
        R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(R_CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), 
        .A_WEN({GND, GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], W_ADDR[11], 
        W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(W_CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[39], W_DATA[38]}), 
        .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%16%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C16 (.A_DOUT({nc38, 
        nc39, nc40, nc41, nc42, nc43, nc44, nc45, nc46, nc47, nc48, 
        nc49, nc50, nc51, nc52, nc53, nc54, nc55, R_DATA[33], 
        R_DATA[32]}), .B_DOUT({nc56, nc57, nc58, nc59, nc60, nc61, 
        nc62, nc63, nc64, nc65, nc66, nc67, nc68, nc69, nc70, nc71, 
        nc72, nc73, nc74, nc75}), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][16] ), .A_ADDR({R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}), 
        .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[33], 
        W_DATA[32]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%18%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C18 (.A_DOUT({nc76, 
        nc77, nc78, nc79, nc80, nc81, nc82, nc83, nc84, nc85, nc86, 
        nc87, nc88, nc89, nc90, nc91, nc92, nc93, R_DATA[37], 
        R_DATA[36]}), .B_DOUT({nc94, nc95, nc96, nc97, nc98, nc99, 
        nc100, nc101, nc102, nc103, nc104, nc105, nc106, nc107, nc108, 
        nc109, nc110, nc111, nc112, nc113}), .DB_DETECT(), .SB_CORRECT(
        ), .ACCESS_BUSY(\ACCESS_BUSY[0][18] ), .A_ADDR({R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}), 
        .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[37], 
        W_DATA[36]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%9%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C9 (.A_DOUT({nc114, 
        nc115, nc116, nc117, nc118, nc119, nc120, nc121, nc122, nc123, 
        nc124, nc125, nc126, nc127, nc128, nc129, nc130, nc131, 
        R_DATA[19], R_DATA[18]}), .B_DOUT({nc132, nc133, nc134, nc135, 
        nc136, nc137, nc138, nc139, nc140, nc141, nc142, nc143, nc144, 
        nc145, nc146, nc147, nc148, nc149, nc150, nc151}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][9] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[19], 
        W_DATA[18]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%13%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C13 (.A_DOUT({nc152, 
        nc153, nc154, nc155, nc156, nc157, nc158, nc159, nc160, nc161, 
        nc162, nc163, nc164, nc165, nc166, nc167, nc168, nc169, 
        R_DATA[27], R_DATA[26]}), .B_DOUT({nc170, nc171, nc172, nc173, 
        nc174, nc175, nc176, nc177, nc178, nc179, nc180, nc181, nc182, 
        nc183, nc184, nc185, nc186, nc187, nc188, nc189}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][13] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[27], 
        W_DATA[26]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%1%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C1 (.A_DOUT({nc190, 
        nc191, nc192, nc193, nc194, nc195, nc196, nc197, nc198, nc199, 
        nc200, nc201, nc202, nc203, nc204, nc205, nc206, nc207, 
        R_DATA[3], R_DATA[2]}), .B_DOUT({nc208, nc209, nc210, nc211, 
        nc212, nc213, nc214, nc215, nc216, nc217, nc218, nc219, nc220, 
        nc221, nc222, nc223, nc224, nc225, nc226, nc227}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[3], 
        W_DATA[2]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%10%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C10 (.A_DOUT({nc228, 
        nc229, nc230, nc231, nc232, nc233, nc234, nc235, nc236, nc237, 
        nc238, nc239, nc240, nc241, nc242, nc243, nc244, nc245, 
        R_DATA[21], R_DATA[20]}), .B_DOUT({nc246, nc247, nc248, nc249, 
        nc250, nc251, nc252, nc253, nc254, nc255, nc256, nc257, nc258, 
        nc259, nc260, nc261, nc262, nc263, nc264, nc265}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[21], 
        W_DATA[20]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%6%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C6 (.A_DOUT({nc266, 
        nc267, nc268, nc269, nc270, nc271, nc272, nc273, nc274, nc275, 
        nc276, nc277, nc278, nc279, nc280, nc281, nc282, nc283, 
        R_DATA[13], R_DATA[12]}), .B_DOUT({nc284, nc285, nc286, nc287, 
        nc288, nc289, nc290, nc291, nc292, nc293, nc294, nc295, nc296, 
        nc297, nc298, nc299, nc300, nc301, nc302, nc303}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[13], 
        W_DATA[12]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%7%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C7 (.A_DOUT({nc304, 
        nc305, nc306, nc307, nc308, nc309, nc310, nc311, nc312, nc313, 
        nc314, nc315, nc316, nc317, nc318, nc319, nc320, nc321, 
        R_DATA[15], R_DATA[14]}), .B_DOUT({nc322, nc323, nc324, nc325, 
        nc326, nc327, nc328, nc329, nc330, nc331, nc332, nc333, nc334, 
        nc335, nc336, nc337, nc338, nc339, nc340, nc341}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[15], 
        W_DATA[14]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%2%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C2 (.A_DOUT({nc342, 
        nc343, nc344, nc345, nc346, nc347, nc348, nc349, nc350, nc351, 
        nc352, nc353, nc354, nc355, nc356, nc357, nc358, nc359, 
        R_DATA[5], R_DATA[4]}), .B_DOUT({nc360, nc361, nc362, nc363, 
        nc364, nc365, nc366, nc367, nc368, nc369, nc370, nc371, nc372, 
        nc373, nc374, nc375, nc376, nc377, nc378, nc379}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[5], 
        W_DATA[4]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%15%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C15 (.A_DOUT({nc380, 
        nc381, nc382, nc383, nc384, nc385, nc386, nc387, nc388, nc389, 
        nc390, nc391, nc392, nc393, nc394, nc395, nc396, nc397, 
        R_DATA[31], R_DATA[30]}), .B_DOUT({nc398, nc399, nc400, nc401, 
        nc402, nc403, nc404, nc405, nc406, nc407, nc408, nc409, nc410, 
        nc411, nc412, nc413, nc414, nc415, nc416, nc417}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][15] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[31], 
        W_DATA[30]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%4%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C4 (.A_DOUT({nc418, 
        nc419, nc420, nc421, nc422, nc423, nc424, nc425, nc426, nc427, 
        nc428, nc429, nc430, nc431, nc432, nc433, nc434, nc435, 
        R_DATA[9], R_DATA[8]}), .B_DOUT({nc436, nc437, nc438, nc439, 
        nc440, nc441, nc442, nc443, nc444, nc445, nc446, nc447, nc448, 
        nc449, nc450, nc451, nc452, nc453, nc454, nc455}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[9], 
        W_DATA[8]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%8%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C8 (.A_DOUT({nc456, 
        nc457, nc458, nc459, nc460, nc461, nc462, nc463, nc464, nc465, 
        nc466, nc467, nc468, nc469, nc470, nc471, nc472, nc473, 
        R_DATA[17], R_DATA[16]}), .B_DOUT({nc474, nc475, nc476, nc477, 
        nc478, nc479, nc480, nc481, nc482, nc483, nc484, nc485, nc486, 
        nc487, nc488, nc489, nc490, nc491, nc492, nc493}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[17], 
        W_DATA[16]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%14%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C14 (.A_DOUT({nc494, 
        nc495, nc496, nc497, nc498, nc499, nc500, nc501, nc502, nc503, 
        nc504, nc505, nc506, nc507, nc508, nc509, nc510, nc511, 
        R_DATA[29], R_DATA[28]}), .B_DOUT({nc512, nc513, nc514, nc515, 
        nc516, nc517, nc518, nc519, nc520, nc521, nc522, nc523, nc524, 
        nc525, nc526, nc527, nc528, nc529, nc530, nc531}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][14] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[29], 
        W_DATA[28]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%3%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C3 (.A_DOUT({nc532, 
        nc533, nc534, nc535, nc536, nc537, nc538, nc539, nc540, nc541, 
        nc542, nc543, nc544, nc545, nc546, nc547, nc548, nc549, 
        R_DATA[7], R_DATA[6]}), .B_DOUT({nc550, nc551, nc552, nc553, 
        nc554, nc555, nc556, nc557, nc558, nc559, nc560, nc561, nc562, 
        nc563, nc564, nc565, nc566, nc567, nc568, nc569}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[7], 
        W_DATA[6]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%0%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C0 (.A_DOUT({nc570, 
        nc571, nc572, nc573, nc574, nc575, nc576, nc577, nc578, nc579, 
        nc580, nc581, nc582, nc583, nc584, nc585, nc586, nc587, 
        R_DATA[1], R_DATA[0]}), .B_DOUT({nc588, nc589, nc590, nc591, 
        nc592, nc593, nc594, nc595, nc596, nc597, nc598, nc599, nc600, 
        nc601, nc602, nc603, nc604, nc605, nc606, nc607}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[1], 
        W_DATA[0]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%5%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C5 (.A_DOUT({nc608, 
        nc609, nc610, nc611, nc612, nc613, nc614, nc615, nc616, nc617, 
        nc618, nc619, nc620, nc621, nc622, nc623, nc624, nc625, 
        R_DATA[11], R_DATA[10]}), .B_DOUT({nc626, nc627, nc628, nc629, 
        nc630, nc631, nc632, nc633, nc634, nc635, nc636, nc637, nc638, 
        nc639, nc640, nc641, nc642, nc643, nc644, nc645}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[11], 
        W_DATA[10]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%12%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C12 (.A_DOUT({nc646, 
        nc647, nc648, nc649, nc650, nc651, nc652, nc653, nc654, nc655, 
        nc656, nc657, nc658, nc659, nc660, nc661, nc662, nc663, 
        R_DATA[25], R_DATA[24]}), .B_DOUT({nc664, nc665, nc666, nc667, 
        nc668, nc669, nc670, nc671, nc672, nc673, nc674, nc675, nc676, 
        nc677, nc678, nc679, nc680, nc681, nc682, nc683}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][12] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[25], 
        W_DATA[24]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%11%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C11 (.A_DOUT({nc684, 
        nc685, nc686, nc687, nc688, nc689, nc690, nc691, nc692, nc693, 
        nc694, nc695, nc696, nc697, nc698, nc699, nc700, nc701, 
        R_DATA[23], R_DATA[22]}), .B_DOUT({nc702, nc703, nc704, nc705, 
        nc706, nc707, nc708, nc709, nc710, nc711, nc712, nc713, nc714, 
        nc715, nc716, nc717, nc718, nc719, nc720, nc721}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][11] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[23], 
        W_DATA[22]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%8192-8192%40-40%SPEED%0%17%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C8_COREFIFO_C8_0_LSRAM_top_R0C17 (.A_DOUT({nc722, 
        nc723, nc724, nc725, nc726, nc727, nc728, nc729, nc730, nc731, 
        nc732, nc733, nc734, nc735, nc736, nc737, nc738, nc739, 
        R_DATA[35], R_DATA[34]}), .B_DOUT({nc740, nc741, nc742, nc743, 
        nc744, nc745, nc746, nc747, nc748, nc749, nc750, nc751, nc752, 
        nc753, nc754, nc755, nc756, nc757, nc758, nc759}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][17] ), .A_ADDR({
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(R_CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[12], 
        W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND}), .B_BLK_EN({W_EN, VCC, VCC}), 
        .B_CLK(W_CLK), .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[35], 
        W_DATA[34]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({GND, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
