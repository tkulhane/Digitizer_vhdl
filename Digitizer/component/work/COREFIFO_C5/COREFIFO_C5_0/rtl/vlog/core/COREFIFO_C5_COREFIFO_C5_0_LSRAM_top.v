`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.10


module COREFIFO_C5_COREFIFO_C5_0_LSRAM_top(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       R_EN,
       CLK
    );
input  [17:0] W_DATA;
output [17:0] R_DATA;
input  [15:0] W_ADDR;
input  [15:0] R_ADDR;
input  W_EN;
input  R_EN;
input  CLK;

    wire \R_DATA_TEMPR0[0] , \R_DATA_TEMPR1[0] , \R_DATA_TEMPR2[0] , 
        \R_DATA_TEMPR3[0] , \R_DATA_TEMPR0[1] , \R_DATA_TEMPR1[1] , 
        \R_DATA_TEMPR2[1] , \R_DATA_TEMPR3[1] , \R_DATA_TEMPR0[2] , 
        \R_DATA_TEMPR1[2] , \R_DATA_TEMPR2[2] , \R_DATA_TEMPR3[2] , 
        \R_DATA_TEMPR0[3] , \R_DATA_TEMPR1[3] , \R_DATA_TEMPR2[3] , 
        \R_DATA_TEMPR3[3] , \R_DATA_TEMPR0[4] , \R_DATA_TEMPR1[4] , 
        \R_DATA_TEMPR2[4] , \R_DATA_TEMPR3[4] , \R_DATA_TEMPR0[5] , 
        \R_DATA_TEMPR1[5] , \R_DATA_TEMPR2[5] , \R_DATA_TEMPR3[5] , 
        \R_DATA_TEMPR0[6] , \R_DATA_TEMPR1[6] , \R_DATA_TEMPR2[6] , 
        \R_DATA_TEMPR3[6] , \R_DATA_TEMPR0[7] , \R_DATA_TEMPR1[7] , 
        \R_DATA_TEMPR2[7] , \R_DATA_TEMPR3[7] , \R_DATA_TEMPR0[8] , 
        \R_DATA_TEMPR1[8] , \R_DATA_TEMPR2[8] , \R_DATA_TEMPR3[8] , 
        \R_DATA_TEMPR0[9] , \R_DATA_TEMPR1[9] , \R_DATA_TEMPR2[9] , 
        \R_DATA_TEMPR3[9] , \R_DATA_TEMPR0[10] , \R_DATA_TEMPR1[10] , 
        \R_DATA_TEMPR2[10] , \R_DATA_TEMPR3[10] , \R_DATA_TEMPR0[11] , 
        \R_DATA_TEMPR1[11] , \R_DATA_TEMPR2[11] , \R_DATA_TEMPR3[11] , 
        \R_DATA_TEMPR0[12] , \R_DATA_TEMPR1[12] , \R_DATA_TEMPR2[12] , 
        \R_DATA_TEMPR3[12] , \R_DATA_TEMPR0[13] , \R_DATA_TEMPR1[13] , 
        \R_DATA_TEMPR2[13] , \R_DATA_TEMPR3[13] , \R_DATA_TEMPR0[14] , 
        \R_DATA_TEMPR1[14] , \R_DATA_TEMPR2[14] , \R_DATA_TEMPR3[14] , 
        \R_DATA_TEMPR0[15] , \R_DATA_TEMPR1[15] , \R_DATA_TEMPR2[15] , 
        \R_DATA_TEMPR3[15] , \R_DATA_TEMPR0[16] , \R_DATA_TEMPR1[16] , 
        \R_DATA_TEMPR2[16] , \R_DATA_TEMPR3[16] , \R_DATA_TEMPR0[17] , 
        \R_DATA_TEMPR1[17] , \R_DATA_TEMPR2[17] , \R_DATA_TEMPR3[17] , 
        \BLKX0[0] , \BLKY0[0] , \BLKX1[0] , \BLKY1[0] , 
        \ACCESS_BUSY[0][0] , \ACCESS_BUSY[0][1] , \ACCESS_BUSY[0][2] , 
        \ACCESS_BUSY[0][3] , \ACCESS_BUSY[0][4] , \ACCESS_BUSY[0][5] , 
        \ACCESS_BUSY[0][6] , \ACCESS_BUSY[0][7] , \ACCESS_BUSY[0][8] , 
        \ACCESS_BUSY[0][9] , \ACCESS_BUSY[0][10] , 
        \ACCESS_BUSY[0][11] , \ACCESS_BUSY[0][12] , 
        \ACCESS_BUSY[0][13] , \ACCESS_BUSY[0][14] , 
        \ACCESS_BUSY[0][15] , \ACCESS_BUSY[0][16] , 
        \ACCESS_BUSY[0][17] , \ACCESS_BUSY[1][0] , \ACCESS_BUSY[1][1] , 
        \ACCESS_BUSY[1][2] , \ACCESS_BUSY[1][3] , \ACCESS_BUSY[1][4] , 
        \ACCESS_BUSY[1][5] , \ACCESS_BUSY[1][6] , \ACCESS_BUSY[1][7] , 
        \ACCESS_BUSY[1][8] , \ACCESS_BUSY[1][9] , \ACCESS_BUSY[1][10] , 
        \ACCESS_BUSY[1][11] , \ACCESS_BUSY[1][12] , 
        \ACCESS_BUSY[1][13] , \ACCESS_BUSY[1][14] , 
        \ACCESS_BUSY[1][15] , \ACCESS_BUSY[1][16] , 
        \ACCESS_BUSY[1][17] , \ACCESS_BUSY[2][0] , \ACCESS_BUSY[2][1] , 
        \ACCESS_BUSY[2][2] , \ACCESS_BUSY[2][3] , \ACCESS_BUSY[2][4] , 
        \ACCESS_BUSY[2][5] , \ACCESS_BUSY[2][6] , \ACCESS_BUSY[2][7] , 
        \ACCESS_BUSY[2][8] , \ACCESS_BUSY[2][9] , \ACCESS_BUSY[2][10] , 
        \ACCESS_BUSY[2][11] , \ACCESS_BUSY[2][12] , 
        \ACCESS_BUSY[2][13] , \ACCESS_BUSY[2][14] , 
        \ACCESS_BUSY[2][15] , \ACCESS_BUSY[2][16] , 
        \ACCESS_BUSY[2][17] , \ACCESS_BUSY[3][0] , \ACCESS_BUSY[3][1] , 
        \ACCESS_BUSY[3][2] , \ACCESS_BUSY[3][3] , \ACCESS_BUSY[3][4] , 
        \ACCESS_BUSY[3][5] , \ACCESS_BUSY[3][6] , \ACCESS_BUSY[3][7] , 
        \ACCESS_BUSY[3][8] , \ACCESS_BUSY[3][9] , \ACCESS_BUSY[3][10] , 
        \ACCESS_BUSY[3][11] , \ACCESS_BUSY[3][12] , 
        \ACCESS_BUSY[3][13] , \ACCESS_BUSY[3][14] , 
        \ACCESS_BUSY[3][15] , \ACCESS_BUSY[3][16] , 
        \ACCESS_BUSY[3][17] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    OR4 \OR4_R_DATA[11]  (.A(\R_DATA_TEMPR0[11] ), .B(
        \R_DATA_TEMPR1[11] ), .C(\R_DATA_TEMPR2[11] ), .D(
        \R_DATA_TEMPR3[11] ), .Y(R_DATA[11]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%6%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C6 (.A_DOUT({nc0, 
        nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, 
        nc13, nc14, nc15, nc16, nc17, nc18, \R_DATA_TEMPR3[6] }), 
        .B_DOUT({nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26, nc27, 
        nc28, nc29, nc30, nc31, nc32, nc33, nc34, nc35, nc36, nc37, 
        nc38}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][6] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[6]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%0%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C0 (.A_DOUT({nc39, 
        nc40, nc41, nc42, nc43, nc44, nc45, nc46, nc47, nc48, nc49, 
        nc50, nc51, nc52, nc53, nc54, nc55, nc56, nc57, 
        \R_DATA_TEMPR2[0] }), .B_DOUT({nc58, nc59, nc60, nc61, nc62, 
        nc63, nc64, nc65, nc66, nc67, nc68, nc69, nc70, nc71, nc72, 
        nc73, nc74, nc75, nc76, nc77}), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][0] ), .A_ADDR({R_ADDR[13], 
        R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[0]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    INV \INVBLKX0[0]  (.A(W_ADDR[14]), .Y(\BLKX0[0] ));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%14%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C14 (.A_DOUT({nc78, 
        nc79, nc80, nc81, nc82, nc83, nc84, nc85, nc86, nc87, nc88, 
        nc89, nc90, nc91, nc92, nc93, nc94, nc95, nc96, 
        \R_DATA_TEMPR3[14] }), .B_DOUT({nc97, nc98, nc99, nc100, nc101, 
        nc102, nc103, nc104, nc105, nc106, nc107, nc108, nc109, nc110, 
        nc111, nc112, nc113, nc114, nc115, nc116}), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][14] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[14]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%8%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C8 (.A_DOUT({nc117, 
        nc118, nc119, nc120, nc121, nc122, nc123, nc124, nc125, nc126, 
        nc127, nc128, nc129, nc130, nc131, nc132, nc133, nc134, nc135, 
        \R_DATA_TEMPR0[8] }), .B_DOUT({nc136, nc137, nc138, nc139, 
        nc140, nc141, nc142, nc143, nc144, nc145, nc146, nc147, nc148, 
        nc149, nc150, nc151, nc152, nc153, nc154, nc155}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[8]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[9]  (.A(\R_DATA_TEMPR0[9] ), .B(\R_DATA_TEMPR1[9] )
        , .C(\R_DATA_TEMPR2[9] ), .D(\R_DATA_TEMPR3[9] ), .Y(R_DATA[9])
        );
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%2%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C2 (.A_DOUT({nc156, 
        nc157, nc158, nc159, nc160, nc161, nc162, nc163, nc164, nc165, 
        nc166, nc167, nc168, nc169, nc170, nc171, nc172, nc173, nc174, 
        \R_DATA_TEMPR1[2] }), .B_DOUT({nc175, nc176, nc177, nc178, 
        nc179, nc180, nc181, nc182, nc183, nc184, nc185, nc186, nc187, 
        nc188, nc189, nc190, nc191, nc192, nc193, nc194}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][2] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[2]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[10]  (.A(\R_DATA_TEMPR0[10] ), .B(
        \R_DATA_TEMPR1[10] ), .C(\R_DATA_TEMPR2[10] ), .D(
        \R_DATA_TEMPR3[10] ), .Y(R_DATA[10]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%11%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C11 (.A_DOUT({nc195, 
        nc196, nc197, nc198, nc199, nc200, nc201, nc202, nc203, nc204, 
        nc205, nc206, nc207, nc208, nc209, nc210, nc211, nc212, nc213, 
        \R_DATA_TEMPR2[11] }), .B_DOUT({nc214, nc215, nc216, nc217, 
        nc218, nc219, nc220, nc221, nc222, nc223, nc224, nc225, nc226, 
        nc227, nc228, nc229, nc230, nc231, nc232, nc233}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][11] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[11]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[17]  (.A(\R_DATA_TEMPR0[17] ), .B(
        \R_DATA_TEMPR1[17] ), .C(\R_DATA_TEMPR2[17] ), .D(
        \R_DATA_TEMPR3[17] ), .Y(R_DATA[17]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%7%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C7 (.A_DOUT({nc234, 
        nc235, nc236, nc237, nc238, nc239, nc240, nc241, nc242, nc243, 
        nc244, nc245, nc246, nc247, nc248, nc249, nc250, nc251, nc252, 
        \R_DATA_TEMPR3[7] }), .B_DOUT({nc253, nc254, nc255, nc256, 
        nc257, nc258, nc259, nc260, nc261, nc262, nc263, nc264, nc265, 
        nc266, nc267, nc268, nc269, nc270, nc271, nc272}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][7] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[7]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%10%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C10 (.A_DOUT({nc273, 
        nc274, nc275, nc276, nc277, nc278, nc279, nc280, nc281, nc282, 
        nc283, nc284, nc285, nc286, nc287, nc288, nc289, nc290, nc291, 
        \R_DATA_TEMPR2[10] }), .B_DOUT({nc292, nc293, nc294, nc295, 
        nc296, nc297, nc298, nc299, nc300, nc301, nc302, nc303, nc304, 
        nc305, nc306, nc307, nc308, nc309, nc310, nc311}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][10] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[10]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    INV \INVBLKX1[0]  (.A(W_ADDR[15]), .Y(\BLKX1[0] ));
    OR4 \OR4_R_DATA[3]  (.A(\R_DATA_TEMPR0[3] ), .B(\R_DATA_TEMPR1[3] )
        , .C(\R_DATA_TEMPR2[3] ), .D(\R_DATA_TEMPR3[3] ), .Y(R_DATA[3])
        );
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%14%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C14 (.A_DOUT({nc312, 
        nc313, nc314, nc315, nc316, nc317, nc318, nc319, nc320, nc321, 
        nc322, nc323, nc324, nc325, nc326, nc327, nc328, nc329, nc330, 
        \R_DATA_TEMPR1[14] }), .B_DOUT({nc331, nc332, nc333, nc334, 
        nc335, nc336, nc337, nc338, nc339, nc340, nc341, nc342, nc343, 
        nc344, nc345, nc346, nc347, nc348, nc349, nc350}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][14] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[14]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%4%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C4 (.A_DOUT({nc351, 
        nc352, nc353, nc354, nc355, nc356, nc357, nc358, nc359, nc360, 
        nc361, nc362, nc363, nc364, nc365, nc366, nc367, nc368, nc369, 
        \R_DATA_TEMPR0[4] }), .B_DOUT({nc370, nc371, nc372, nc373, 
        nc374, nc375, nc376, nc377, nc378, nc379, nc380, nc381, nc382, 
        nc383, nc384, nc385, nc386, nc387, nc388, nc389}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[4]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[1]  (.A(\R_DATA_TEMPR0[1] ), .B(\R_DATA_TEMPR1[1] )
        , .C(\R_DATA_TEMPR2[1] ), .D(\R_DATA_TEMPR3[1] ), .Y(R_DATA[1])
        );
    OR4 \OR4_R_DATA[8]  (.A(\R_DATA_TEMPR0[8] ), .B(\R_DATA_TEMPR1[8] )
        , .C(\R_DATA_TEMPR2[8] ), .D(\R_DATA_TEMPR3[8] ), .Y(R_DATA[8])
        );
    OR4 \OR4_R_DATA[12]  (.A(\R_DATA_TEMPR0[12] ), .B(
        \R_DATA_TEMPR1[12] ), .C(\R_DATA_TEMPR2[12] ), .D(
        \R_DATA_TEMPR3[12] ), .Y(R_DATA[12]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%13%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C13 (.A_DOUT({nc390, 
        nc391, nc392, nc393, nc394, nc395, nc396, nc397, nc398, nc399, 
        nc400, nc401, nc402, nc403, nc404, nc405, nc406, nc407, nc408, 
        \R_DATA_TEMPR0[13] }), .B_DOUT({nc409, nc410, nc411, nc412, 
        nc413, nc414, nc415, nc416, nc417, nc418, nc419, nc420, nc421, 
        nc422, nc423, nc424, nc425, nc426, nc427, nc428}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][13] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[13]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%5%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C5 (.A_DOUT({nc429, 
        nc430, nc431, nc432, nc433, nc434, nc435, nc436, nc437, nc438, 
        nc439, nc440, nc441, nc442, nc443, nc444, nc445, nc446, nc447, 
        \R_DATA_TEMPR1[5] }), .B_DOUT({nc448, nc449, nc450, nc451, 
        nc452, nc453, nc454, nc455, nc456, nc457, nc458, nc459, nc460, 
        nc461, nc462, nc463, nc464, nc465, nc466, nc467}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][5] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[5]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%5%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C5 (.A_DOUT({nc468, 
        nc469, nc470, nc471, nc472, nc473, nc474, nc475, nc476, nc477, 
        nc478, nc479, nc480, nc481, nc482, nc483, nc484, nc485, nc486, 
        \R_DATA_TEMPR2[5] }), .B_DOUT({nc487, nc488, nc489, nc490, 
        nc491, nc492, nc493, nc494, nc495, nc496, nc497, nc498, nc499, 
        nc500, nc501, nc502, nc503, nc504, nc505, nc506}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][5] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[5]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%17%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C17 (.A_DOUT({nc507, 
        nc508, nc509, nc510, nc511, nc512, nc513, nc514, nc515, nc516, 
        nc517, nc518, nc519, nc520, nc521, nc522, nc523, nc524, nc525, 
        \R_DATA_TEMPR2[17] }), .B_DOUT({nc526, nc527, nc528, nc529, 
        nc530, nc531, nc532, nc533, nc534, nc535, nc536, nc537, nc538, 
        nc539, nc540, nc541, nc542, nc543, nc544, nc545}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][17] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[17]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%9%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C9 (.A_DOUT({nc546, 
        nc547, nc548, nc549, nc550, nc551, nc552, nc553, nc554, nc555, 
        nc556, nc557, nc558, nc559, nc560, nc561, nc562, nc563, nc564, 
        \R_DATA_TEMPR3[9] }), .B_DOUT({nc565, nc566, nc567, nc568, 
        nc569, nc570, nc571, nc572, nc573, nc574, nc575, nc576, nc577, 
        nc578, nc579, nc580, nc581, nc582, nc583, nc584}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][9] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[9]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%13%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C13 (.A_DOUT({nc585, 
        nc586, nc587, nc588, nc589, nc590, nc591, nc592, nc593, nc594, 
        nc595, nc596, nc597, nc598, nc599, nc600, nc601, nc602, nc603, 
        \R_DATA_TEMPR3[13] }), .B_DOUT({nc604, nc605, nc606, nc607, 
        nc608, nc609, nc610, nc611, nc612, nc613, nc614, nc615, nc616, 
        nc617, nc618, nc619, nc620, nc621, nc622, nc623}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][13] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[13]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%8%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C8 (.A_DOUT({nc624, 
        nc625, nc626, nc627, nc628, nc629, nc630, nc631, nc632, nc633, 
        nc634, nc635, nc636, nc637, nc638, nc639, nc640, nc641, nc642, 
        \R_DATA_TEMPR1[8] }), .B_DOUT({nc643, nc644, nc645, nc646, 
        nc647, nc648, nc649, nc650, nc651, nc652, nc653, nc654, nc655, 
        nc656, nc657, nc658, nc659, nc660, nc661, nc662}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][8] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[8]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%12%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C12 (.A_DOUT({nc663, 
        nc664, nc665, nc666, nc667, nc668, nc669, nc670, nc671, nc672, 
        nc673, nc674, nc675, nc676, nc677, nc678, nc679, nc680, nc681, 
        \R_DATA_TEMPR2[12] }), .B_DOUT({nc682, nc683, nc684, nc685, 
        nc686, nc687, nc688, nc689, nc690, nc691, nc692, nc693, nc694, 
        nc695, nc696, nc697, nc698, nc699, nc700, nc701}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][12] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[12]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%3%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C3 (.A_DOUT({nc702, 
        nc703, nc704, nc705, nc706, nc707, nc708, nc709, nc710, nc711, 
        nc712, nc713, nc714, nc715, nc716, nc717, nc718, nc719, nc720, 
        \R_DATA_TEMPR2[3] }), .B_DOUT({nc721, nc722, nc723, nc724, 
        nc725, nc726, nc727, nc728, nc729, nc730, nc731, nc732, nc733, 
        nc734, nc735, nc736, nc737, nc738, nc739, nc740}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][3] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[3]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%0%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C0 (.A_DOUT({nc741, 
        nc742, nc743, nc744, nc745, nc746, nc747, nc748, nc749, nc750, 
        nc751, nc752, nc753, nc754, nc755, nc756, nc757, nc758, nc759, 
        \R_DATA_TEMPR1[0] }), .B_DOUT({nc760, nc761, nc762, nc763, 
        nc764, nc765, nc766, nc767, nc768, nc769, nc770, nc771, nc772, 
        nc773, nc774, nc775, nc776, nc777, nc778, nc779}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][0] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[0]  (.A(\R_DATA_TEMPR0[0] ), .B(\R_DATA_TEMPR1[0] )
        , .C(\R_DATA_TEMPR2[0] ), .D(\R_DATA_TEMPR3[0] ), .Y(R_DATA[0])
        );
    OR4 \OR4_R_DATA[2]  (.A(\R_DATA_TEMPR0[2] ), .B(\R_DATA_TEMPR1[2] )
        , .C(\R_DATA_TEMPR2[2] ), .D(\R_DATA_TEMPR3[2] ), .Y(R_DATA[2])
        );
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%1%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C1 (.A_DOUT({nc780, 
        nc781, nc782, nc783, nc784, nc785, nc786, nc787, nc788, nc789, 
        nc790, nc791, nc792, nc793, nc794, nc795, nc796, nc797, nc798, 
        \R_DATA_TEMPR2[1] }), .B_DOUT({nc799, nc800, nc801, nc802, 
        nc803, nc804, nc805, nc806, nc807, nc808, nc809, nc810, nc811, 
        nc812, nc813, nc814, nc815, nc816, nc817, nc818}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][1] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[1]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%13%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C13 (.A_DOUT({nc819, 
        nc820, nc821, nc822, nc823, nc824, nc825, nc826, nc827, nc828, 
        nc829, nc830, nc831, nc832, nc833, nc834, nc835, nc836, nc837, 
        \R_DATA_TEMPR1[13] }), .B_DOUT({nc838, nc839, nc840, nc841, 
        nc842, nc843, nc844, nc845, nc846, nc847, nc848, nc849, nc850, 
        nc851, nc852, nc853, nc854, nc855, nc856, nc857}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][13] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[13]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[16]  (.A(\R_DATA_TEMPR0[16] ), .B(
        \R_DATA_TEMPR1[16] ), .C(\R_DATA_TEMPR2[16] ), .D(
        \R_DATA_TEMPR3[16] ), .Y(R_DATA[16]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%16%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C16 (.A_DOUT({nc858, 
        nc859, nc860, nc861, nc862, nc863, nc864, nc865, nc866, nc867, 
        nc868, nc869, nc870, nc871, nc872, nc873, nc874, nc875, nc876, 
        \R_DATA_TEMPR0[16] }), .B_DOUT({nc877, nc878, nc879, nc880, 
        nc881, nc882, nc883, nc884, nc885, nc886, nc887, nc888, nc889, 
        nc890, nc891, nc892, nc893, nc894, nc895, nc896}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][16] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[16]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%4%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C4 (.A_DOUT({nc897, 
        nc898, nc899, nc900, nc901, nc902, nc903, nc904, nc905, nc906, 
        nc907, nc908, nc909, nc910, nc911, nc912, nc913, nc914, nc915, 
        \R_DATA_TEMPR1[4] }), .B_DOUT({nc916, nc917, nc918, nc919, 
        nc920, nc921, nc922, nc923, nc924, nc925, nc926, nc927, nc928, 
        nc929, nc930, nc931, nc932, nc933, nc934, nc935}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][4] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        \BLKY1[0] , R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[4]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%7%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C7 (.A_DOUT({nc936, 
        nc937, nc938, nc939, nc940, nc941, nc942, nc943, nc944, nc945, 
        nc946, nc947, nc948, nc949, nc950, nc951, nc952, nc953, nc954, 
        \R_DATA_TEMPR2[7] }), .B_DOUT({nc955, nc956, nc957, nc958, 
        nc959, nc960, nc961, nc962, nc963, nc964, nc965, nc966, nc967, 
        nc968, nc969, nc970, nc971, nc972, nc973, nc974}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][7] ), .A_ADDR({
        R_ADDR[13], R_ADDR[12], R_ADDR[11], R_ADDR[10], R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, 
        R_ADDR[15], \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), 
        .B_BLK_EN({W_EN, W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, W_DATA[7]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%16%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C16 (.A_DOUT({nc975, 
        nc976, nc977, nc978, nc979, nc980, nc981, nc982, nc983, nc984, 
        nc985, nc986, nc987, nc988, nc989, nc990, nc991, nc992, nc993, 
        \R_DATA_TEMPR3[16] }), .B_DOUT({nc994, nc995, nc996, nc997, 
        nc998, nc999, nc1000, nc1001, nc1002, nc1003, nc1004, nc1005, 
        nc1006, nc1007, nc1008, nc1009, nc1010, nc1011, nc1012, nc1013})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][16] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[16]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%15%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C15 (.A_DOUT({nc1014, 
        nc1015, nc1016, nc1017, nc1018, nc1019, nc1020, nc1021, nc1022, 
        nc1023, nc1024, nc1025, nc1026, nc1027, nc1028, nc1029, nc1030, 
        nc1031, nc1032, \R_DATA_TEMPR0[15] }), .B_DOUT({nc1033, nc1034, 
        nc1035, nc1036, nc1037, nc1038, nc1039, nc1040, nc1041, nc1042, 
        nc1043, nc1044, nc1045, nc1046, nc1047, nc1048, nc1049, nc1050, 
        nc1051, nc1052}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][15] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[15]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[14]  (.A(\R_DATA_TEMPR0[14] ), .B(
        \R_DATA_TEMPR1[14] ), .C(\R_DATA_TEMPR2[14] ), .D(
        \R_DATA_TEMPR3[14] ), .Y(R_DATA[14]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%14%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C14 (.A_DOUT({nc1053, 
        nc1054, nc1055, nc1056, nc1057, nc1058, nc1059, nc1060, nc1061, 
        nc1062, nc1063, nc1064, nc1065, nc1066, nc1067, nc1068, nc1069, 
        nc1070, nc1071, \R_DATA_TEMPR2[14] }), .B_DOUT({nc1072, nc1073, 
        nc1074, nc1075, nc1076, nc1077, nc1078, nc1079, nc1080, nc1081, 
        nc1082, nc1083, nc1084, nc1085, nc1086, nc1087, nc1088, nc1089, 
        nc1090, nc1091}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][14] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[14]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%0%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C0 (.A_DOUT({nc1092, 
        nc1093, nc1094, nc1095, nc1096, nc1097, nc1098, nc1099, nc1100, 
        nc1101, nc1102, nc1103, nc1104, nc1105, nc1106, nc1107, nc1108, 
        nc1109, nc1110, \R_DATA_TEMPR0[0] }), .B_DOUT({nc1111, nc1112, 
        nc1113, nc1114, nc1115, nc1116, nc1117, nc1118, nc1119, nc1120, 
        nc1121, nc1122, nc1123, nc1124, nc1125, nc1126, nc1127, nc1128, 
        nc1129, nc1130}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[0]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%16%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C16 (.A_DOUT({nc1131, 
        nc1132, nc1133, nc1134, nc1135, nc1136, nc1137, nc1138, nc1139, 
        nc1140, nc1141, nc1142, nc1143, nc1144, nc1145, nc1146, nc1147, 
        nc1148, nc1149, \R_DATA_TEMPR1[16] }), .B_DOUT({nc1150, nc1151, 
        nc1152, nc1153, nc1154, nc1155, nc1156, nc1157, nc1158, nc1159, 
        nc1160, nc1161, nc1162, nc1163, nc1164, nc1165, nc1166, nc1167, 
        nc1168, nc1169}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][16] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[16]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%15%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C15 (.A_DOUT({nc1170, 
        nc1171, nc1172, nc1173, nc1174, nc1175, nc1176, nc1177, nc1178, 
        nc1179, nc1180, nc1181, nc1182, nc1183, nc1184, nc1185, nc1186, 
        nc1187, nc1188, \R_DATA_TEMPR3[15] }), .B_DOUT({nc1189, nc1190, 
        nc1191, nc1192, nc1193, nc1194, nc1195, nc1196, nc1197, nc1198, 
        nc1199, nc1200, nc1201, nc1202, nc1203, nc1204, nc1205, nc1206, 
        nc1207, nc1208}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][15] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[15]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%2%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C2 (.A_DOUT({nc1209, 
        nc1210, nc1211, nc1212, nc1213, nc1214, nc1215, nc1216, nc1217, 
        nc1218, nc1219, nc1220, nc1221, nc1222, nc1223, nc1224, nc1225, 
        nc1226, nc1227, \R_DATA_TEMPR3[2] }), .B_DOUT({nc1228, nc1229, 
        nc1230, nc1231, nc1232, nc1233, nc1234, nc1235, nc1236, nc1237, 
        nc1238, nc1239, nc1240, nc1241, nc1242, nc1243, nc1244, nc1245, 
        nc1246, nc1247}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][2] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[2]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%11%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C11 (.A_DOUT({nc1248, 
        nc1249, nc1250, nc1251, nc1252, nc1253, nc1254, nc1255, nc1256, 
        nc1257, nc1258, nc1259, nc1260, nc1261, nc1262, nc1263, nc1264, 
        nc1265, nc1266, \R_DATA_TEMPR0[11] }), .B_DOUT({nc1267, nc1268, 
        nc1269, nc1270, nc1271, nc1272, nc1273, nc1274, nc1275, nc1276, 
        nc1277, nc1278, nc1279, nc1280, nc1281, nc1282, nc1283, nc1284, 
        nc1285, nc1286}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][11] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[11]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%8%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C8 (.A_DOUT({nc1287, 
        nc1288, nc1289, nc1290, nc1291, nc1292, nc1293, nc1294, nc1295, 
        nc1296, nc1297, nc1298, nc1299, nc1300, nc1301, nc1302, nc1303, 
        nc1304, nc1305, \R_DATA_TEMPR2[8] }), .B_DOUT({nc1306, nc1307, 
        nc1308, nc1309, nc1310, nc1311, nc1312, nc1313, nc1314, nc1315, 
        nc1316, nc1317, nc1318, nc1319, nc1320, nc1321, nc1322, nc1323, 
        nc1324, nc1325}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][8] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[8]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%11%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C11 (.A_DOUT({nc1326, 
        nc1327, nc1328, nc1329, nc1330, nc1331, nc1332, nc1333, nc1334, 
        nc1335, nc1336, nc1337, nc1338, nc1339, nc1340, nc1341, nc1342, 
        nc1343, nc1344, \R_DATA_TEMPR3[11] }), .B_DOUT({nc1345, nc1346, 
        nc1347, nc1348, nc1349, nc1350, nc1351, nc1352, nc1353, nc1354, 
        nc1355, nc1356, nc1357, nc1358, nc1359, nc1360, nc1361, nc1362, 
        nc1363, nc1364}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][11] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[11]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%10%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C10 (.A_DOUT({nc1365, 
        nc1366, nc1367, nc1368, nc1369, nc1370, nc1371, nc1372, nc1373, 
        nc1374, nc1375, nc1376, nc1377, nc1378, nc1379, nc1380, nc1381, 
        nc1382, nc1383, \R_DATA_TEMPR0[10] }), .B_DOUT({nc1384, nc1385, 
        nc1386, nc1387, nc1388, nc1389, nc1390, nc1391, nc1392, nc1393, 
        nc1394, nc1395, nc1396, nc1397, nc1398, nc1399, nc1400, nc1401, 
        nc1402, nc1403}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][10] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[10]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%15%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C15 (.A_DOUT({nc1404, 
        nc1405, nc1406, nc1407, nc1408, nc1409, nc1410, nc1411, nc1412, 
        nc1413, nc1414, nc1415, nc1416, nc1417, nc1418, nc1419, nc1420, 
        nc1421, nc1422, \R_DATA_TEMPR1[15] }), .B_DOUT({nc1423, nc1424, 
        nc1425, nc1426, nc1427, nc1428, nc1429, nc1430, nc1431, nc1432, 
        nc1433, nc1434, nc1435, nc1436, nc1437, nc1438, nc1439, nc1440, 
        nc1441, nc1442}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][15] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[15]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%7%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C7 (.A_DOUT({nc1443, 
        nc1444, nc1445, nc1446, nc1447, nc1448, nc1449, nc1450, nc1451, 
        nc1452, nc1453, nc1454, nc1455, nc1456, nc1457, nc1458, nc1459, 
        nc1460, nc1461, \R_DATA_TEMPR0[7] }), .B_DOUT({nc1462, nc1463, 
        nc1464, nc1465, nc1466, nc1467, nc1468, nc1469, nc1470, nc1471, 
        nc1472, nc1473, nc1474, nc1475, nc1476, nc1477, nc1478, nc1479, 
        nc1480, nc1481}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][7] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[7]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%9%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C9 (.A_DOUT({nc1482, 
        nc1483, nc1484, nc1485, nc1486, nc1487, nc1488, nc1489, nc1490, 
        nc1491, nc1492, nc1493, nc1494, nc1495, nc1496, nc1497, nc1498, 
        nc1499, nc1500, \R_DATA_TEMPR0[9] }), .B_DOUT({nc1501, nc1502, 
        nc1503, nc1504, nc1505, nc1506, nc1507, nc1508, nc1509, nc1510, 
        nc1511, nc1512, nc1513, nc1514, nc1515, nc1516, nc1517, nc1518, 
        nc1519, nc1520}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][9] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[9]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[13]  (.A(\R_DATA_TEMPR0[13] ), .B(
        \R_DATA_TEMPR1[13] ), .C(\R_DATA_TEMPR2[13] ), .D(
        \R_DATA_TEMPR3[13] ), .Y(R_DATA[13]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%10%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C10 (.A_DOUT({nc1521, 
        nc1522, nc1523, nc1524, nc1525, nc1526, nc1527, nc1528, nc1529, 
        nc1530, nc1531, nc1532, nc1533, nc1534, nc1535, nc1536, nc1537, 
        nc1538, nc1539, \R_DATA_TEMPR3[10] }), .B_DOUT({nc1540, nc1541, 
        nc1542, nc1543, nc1544, nc1545, nc1546, nc1547, nc1548, nc1549, 
        nc1550, nc1551, nc1552, nc1553, nc1554, nc1555, nc1556, nc1557, 
        nc1558, nc1559}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][10] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[10]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%9%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C9 (.A_DOUT({nc1560, 
        nc1561, nc1562, nc1563, nc1564, nc1565, nc1566, nc1567, nc1568, 
        nc1569, nc1570, nc1571, nc1572, nc1573, nc1574, nc1575, nc1576, 
        nc1577, nc1578, \R_DATA_TEMPR2[9] }), .B_DOUT({nc1579, nc1580, 
        nc1581, nc1582, nc1583, nc1584, nc1585, nc1586, nc1587, nc1588, 
        nc1589, nc1590, nc1591, nc1592, nc1593, nc1594, nc1595, nc1596, 
        nc1597, nc1598}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][9] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[9]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%13%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C13 (.A_DOUT({nc1599, 
        nc1600, nc1601, nc1602, nc1603, nc1604, nc1605, nc1606, nc1607, 
        nc1608, nc1609, nc1610, nc1611, nc1612, nc1613, nc1614, nc1615, 
        nc1616, nc1617, \R_DATA_TEMPR2[13] }), .B_DOUT({nc1618, nc1619, 
        nc1620, nc1621, nc1622, nc1623, nc1624, nc1625, nc1626, nc1627, 
        nc1628, nc1629, nc1630, nc1631, nc1632, nc1633, nc1634, nc1635, 
        nc1636, nc1637}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][13] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[13]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%3%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C3 (.A_DOUT({nc1638, 
        nc1639, nc1640, nc1641, nc1642, nc1643, nc1644, nc1645, nc1646, 
        nc1647, nc1648, nc1649, nc1650, nc1651, nc1652, nc1653, nc1654, 
        nc1655, nc1656, \R_DATA_TEMPR3[3] }), .B_DOUT({nc1657, nc1658, 
        nc1659, nc1660, nc1661, nc1662, nc1663, nc1664, nc1665, nc1666, 
        nc1667, nc1668, nc1669, nc1670, nc1671, nc1672, nc1673, nc1674, 
        nc1675, nc1676}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][3] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[3]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%4%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C4 (.A_DOUT({nc1677, 
        nc1678, nc1679, nc1680, nc1681, nc1682, nc1683, nc1684, nc1685, 
        nc1686, nc1687, nc1688, nc1689, nc1690, nc1691, nc1692, nc1693, 
        nc1694, nc1695, \R_DATA_TEMPR3[4] }), .B_DOUT({nc1696, nc1697, 
        nc1698, nc1699, nc1700, nc1701, nc1702, nc1703, nc1704, nc1705, 
        nc1706, nc1707, nc1708, nc1709, nc1710, nc1711, nc1712, nc1713, 
        nc1714, nc1715}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][4] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[4]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%11%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C11 (.A_DOUT({nc1716, 
        nc1717, nc1718, nc1719, nc1720, nc1721, nc1722, nc1723, nc1724, 
        nc1725, nc1726, nc1727, nc1728, nc1729, nc1730, nc1731, nc1732, 
        nc1733, nc1734, \R_DATA_TEMPR1[11] }), .B_DOUT({nc1735, nc1736, 
        nc1737, nc1738, nc1739, nc1740, nc1741, nc1742, nc1743, nc1744, 
        nc1745, nc1746, nc1747, nc1748, nc1749, nc1750, nc1751, nc1752, 
        nc1753, nc1754}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][11] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[11]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%9%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C9 (.A_DOUT({nc1755, 
        nc1756, nc1757, nc1758, nc1759, nc1760, nc1761, nc1762, nc1763, 
        nc1764, nc1765, nc1766, nc1767, nc1768, nc1769, nc1770, nc1771, 
        nc1772, nc1773, \R_DATA_TEMPR1[9] }), .B_DOUT({nc1774, nc1775, 
        nc1776, nc1777, nc1778, nc1779, nc1780, nc1781, nc1782, nc1783, 
        nc1784, nc1785, nc1786, nc1787, nc1788, nc1789, nc1790, nc1791, 
        nc1792, nc1793}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][9] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[9]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%17%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C17 (.A_DOUT({nc1794, 
        nc1795, nc1796, nc1797, nc1798, nc1799, nc1800, nc1801, nc1802, 
        nc1803, nc1804, nc1805, nc1806, nc1807, nc1808, nc1809, nc1810, 
        nc1811, nc1812, \R_DATA_TEMPR0[17] }), .B_DOUT({nc1813, nc1814, 
        nc1815, nc1816, nc1817, nc1818, nc1819, nc1820, nc1821, nc1822, 
        nc1823, nc1824, nc1825, nc1826, nc1827, nc1828, nc1829, nc1830, 
        nc1831, nc1832}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][17] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[17]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%5%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C5 (.A_DOUT({nc1833, 
        nc1834, nc1835, nc1836, nc1837, nc1838, nc1839, nc1840, nc1841, 
        nc1842, nc1843, nc1844, nc1845, nc1846, nc1847, nc1848, nc1849, 
        nc1850, nc1851, \R_DATA_TEMPR3[5] }), .B_DOUT({nc1852, nc1853, 
        nc1854, nc1855, nc1856, nc1857, nc1858, nc1859, nc1860, nc1861, 
        nc1862, nc1863, nc1864, nc1865, nc1866, nc1867, nc1868, nc1869, 
        nc1870, nc1871}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][5] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[5]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%12%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C12 (.A_DOUT({nc1872, 
        nc1873, nc1874, nc1875, nc1876, nc1877, nc1878, nc1879, nc1880, 
        nc1881, nc1882, nc1883, nc1884, nc1885, nc1886, nc1887, nc1888, 
        nc1889, nc1890, \R_DATA_TEMPR0[12] }), .B_DOUT({nc1891, nc1892, 
        nc1893, nc1894, nc1895, nc1896, nc1897, nc1898, nc1899, nc1900, 
        nc1901, nc1902, nc1903, nc1904, nc1905, nc1906, nc1907, nc1908, 
        nc1909, nc1910}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][12] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[12]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%10%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C10 (.A_DOUT({nc1911, 
        nc1912, nc1913, nc1914, nc1915, nc1916, nc1917, nc1918, nc1919, 
        nc1920, nc1921, nc1922, nc1923, nc1924, nc1925, nc1926, nc1927, 
        nc1928, nc1929, \R_DATA_TEMPR1[10] }), .B_DOUT({nc1930, nc1931, 
        nc1932, nc1933, nc1934, nc1935, nc1936, nc1937, nc1938, nc1939, 
        nc1940, nc1941, nc1942, nc1943, nc1944, nc1945, nc1946, nc1947, 
        nc1948, nc1949}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][10] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[10]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[4]  (.A(\R_DATA_TEMPR0[4] ), .B(\R_DATA_TEMPR1[4] )
        , .C(\R_DATA_TEMPR2[4] ), .D(\R_DATA_TEMPR3[4] ), .Y(R_DATA[4])
        );
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%0%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C0 (.A_DOUT({nc1950, 
        nc1951, nc1952, nc1953, nc1954, nc1955, nc1956, nc1957, nc1958, 
        nc1959, nc1960, nc1961, nc1962, nc1963, nc1964, nc1965, nc1966, 
        nc1967, nc1968, \R_DATA_TEMPR3[0] }), .B_DOUT({nc1969, nc1970, 
        nc1971, nc1972, nc1973, nc1974, nc1975, nc1976, nc1977, nc1978, 
        nc1979, nc1980, nc1981, nc1982, nc1983, nc1984, nc1985, nc1986, 
        nc1987, nc1988}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][0] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[0]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%17%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C17 (.A_DOUT({nc1989, 
        nc1990, nc1991, nc1992, nc1993, nc1994, nc1995, nc1996, nc1997, 
        nc1998, nc1999, nc2000, nc2001, nc2002, nc2003, nc2004, nc2005, 
        nc2006, nc2007, \R_DATA_TEMPR3[17] }), .B_DOUT({nc2008, nc2009, 
        nc2010, nc2011, nc2012, nc2013, nc2014, nc2015, nc2016, nc2017, 
        nc2018, nc2019, nc2020, nc2021, nc2022, nc2023, nc2024, nc2025, 
        nc2026, nc2027}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][17] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[17]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[15]  (.A(\R_DATA_TEMPR0[15] ), .B(
        \R_DATA_TEMPR1[15] ), .C(\R_DATA_TEMPR2[15] ), .D(
        \R_DATA_TEMPR3[15] ), .Y(R_DATA[15]));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%3%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C3 (.A_DOUT({nc2028, 
        nc2029, nc2030, nc2031, nc2032, nc2033, nc2034, nc2035, nc2036, 
        nc2037, nc2038, nc2039, nc2040, nc2041, nc2042, nc2043, nc2044, 
        nc2045, nc2046, \R_DATA_TEMPR0[3] }), .B_DOUT({nc2047, nc2048, 
        nc2049, nc2050, nc2051, nc2052, nc2053, nc2054, nc2055, nc2056, 
        nc2057, nc2058, nc2059, nc2060, nc2061, nc2062, nc2063, nc2064, 
        nc2065, nc2066}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][3] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[3]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%12%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C12 (.A_DOUT({nc2067, 
        nc2068, nc2069, nc2070, nc2071, nc2072, nc2073, nc2074, nc2075, 
        nc2076, nc2077, nc2078, nc2079, nc2080, nc2081, nc2082, nc2083, 
        nc2084, nc2085, \R_DATA_TEMPR3[12] }), .B_DOUT({nc2086, nc2087, 
        nc2088, nc2089, nc2090, nc2091, nc2092, nc2093, nc2094, nc2095, 
        nc2096, nc2097, nc2098, nc2099, nc2100, nc2101, nc2102, nc2103, 
        nc2104, nc2105}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][12] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[12]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%6%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C6 (.A_DOUT({nc2106, 
        nc2107, nc2108, nc2109, nc2110, nc2111, nc2112, nc2113, nc2114, 
        nc2115, nc2116, nc2117, nc2118, nc2119, nc2120, nc2121, nc2122, 
        nc2123, nc2124, \R_DATA_TEMPR2[6] }), .B_DOUT({nc2125, nc2126, 
        nc2127, nc2128, nc2129, nc2130, nc2131, nc2132, nc2133, nc2134, 
        nc2135, nc2136, nc2137, nc2138, nc2139, nc2140, nc2141, nc2142, 
        nc2143, nc2144}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][6] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[6]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%2%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C2 (.A_DOUT({nc2145, 
        nc2146, nc2147, nc2148, nc2149, nc2150, nc2151, nc2152, nc2153, 
        nc2154, nc2155, nc2156, nc2157, nc2158, nc2159, nc2160, nc2161, 
        nc2162, nc2163, \R_DATA_TEMPR0[2] }), .B_DOUT({nc2164, nc2165, 
        nc2166, nc2167, nc2168, nc2169, nc2170, nc2171, nc2172, nc2173, 
        nc2174, nc2175, nc2176, nc2177, nc2178, nc2179, nc2180, nc2181, 
        nc2182, nc2183}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][2] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[2]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%1%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C1 (.A_DOUT({nc2184, 
        nc2185, nc2186, nc2187, nc2188, nc2189, nc2190, nc2191, nc2192, 
        nc2193, nc2194, nc2195, nc2196, nc2197, nc2198, nc2199, nc2200, 
        nc2201, nc2202, \R_DATA_TEMPR0[1] }), .B_DOUT({nc2203, nc2204, 
        nc2205, nc2206, nc2207, nc2208, nc2209, nc2210, nc2211, nc2212, 
        nc2213, nc2214, nc2215, nc2216, nc2217, nc2218, nc2219, nc2220, 
        nc2221, nc2222}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[1]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%16%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C16 (.A_DOUT({nc2223, 
        nc2224, nc2225, nc2226, nc2227, nc2228, nc2229, nc2230, nc2231, 
        nc2232, nc2233, nc2234, nc2235, nc2236, nc2237, nc2238, nc2239, 
        nc2240, nc2241, \R_DATA_TEMPR2[16] }), .B_DOUT({nc2242, nc2243, 
        nc2244, nc2245, nc2246, nc2247, nc2248, nc2249, nc2250, nc2251, 
        nc2252, nc2253, nc2254, nc2255, nc2256, nc2257, nc2258, nc2259, 
        nc2260, nc2261}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][16] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[16]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%4%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C4 (.A_DOUT({nc2262, 
        nc2263, nc2264, nc2265, nc2266, nc2267, nc2268, nc2269, nc2270, 
        nc2271, nc2272, nc2273, nc2274, nc2275, nc2276, nc2277, nc2278, 
        nc2279, nc2280, \R_DATA_TEMPR2[4] }), .B_DOUT({nc2281, nc2282, 
        nc2283, nc2284, nc2285, nc2286, nc2287, nc2288, nc2289, nc2290, 
        nc2291, nc2292, nc2293, nc2294, nc2295, nc2296, nc2297, nc2298, 
        nc2299, nc2300}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][4] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[4]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%17%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C17 (.A_DOUT({nc2301, 
        nc2302, nc2303, nc2304, nc2305, nc2306, nc2307, nc2308, nc2309, 
        nc2310, nc2311, nc2312, nc2313, nc2314, nc2315, nc2316, nc2317, 
        nc2318, nc2319, \R_DATA_TEMPR1[17] }), .B_DOUT({nc2320, nc2321, 
        nc2322, nc2323, nc2324, nc2325, nc2326, nc2327, nc2328, nc2329, 
        nc2330, nc2331, nc2332, nc2333, nc2334, nc2335, nc2336, nc2337, 
        nc2338, nc2339}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][17] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[17]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%8%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C8 (.A_DOUT({nc2340, 
        nc2341, nc2342, nc2343, nc2344, nc2345, nc2346, nc2347, nc2348, 
        nc2349, nc2350, nc2351, nc2352, nc2353, nc2354, nc2355, nc2356, 
        nc2357, nc2358, \R_DATA_TEMPR3[8] }), .B_DOUT({nc2359, nc2360, 
        nc2361, nc2362, nc2363, nc2364, nc2365, nc2366, nc2367, nc2368, 
        nc2369, nc2370, nc2371, nc2372, nc2373, nc2374, nc2375, nc2376, 
        nc2377, nc2378}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][8] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[8]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%3%1%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R3C1 (.A_DOUT({nc2379, 
        nc2380, nc2381, nc2382, nc2383, nc2384, nc2385, nc2386, nc2387, 
        nc2388, nc2389, nc2390, nc2391, nc2392, nc2393, nc2394, nc2395, 
        nc2396, nc2397, \R_DATA_TEMPR3[1] }), .B_DOUT({nc2398, nc2399, 
        nc2400, nc2401, nc2402, nc2403, nc2404, nc2405, nc2406, nc2407, 
        nc2408, nc2409, nc2410, nc2411, nc2412, nc2413, nc2414, nc2415, 
        nc2416, nc2417}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[3][1] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[1]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    INV \INVBLKY0[0]  (.A(R_ADDR[14]), .Y(\BLKY0[0] ));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%12%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C12 (.A_DOUT({nc2418, 
        nc2419, nc2420, nc2421, nc2422, nc2423, nc2424, nc2425, nc2426, 
        nc2427, nc2428, nc2429, nc2430, nc2431, nc2432, nc2433, nc2434, 
        nc2435, nc2436, \R_DATA_TEMPR1[12] }), .B_DOUT({nc2437, nc2438, 
        nc2439, nc2440, nc2441, nc2442, nc2443, nc2444, nc2445, nc2446, 
        nc2447, nc2448, nc2449, nc2450, nc2451, nc2452, nc2453, nc2454, 
        nc2455, nc2456}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][12] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[12]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[5]  (.A(\R_DATA_TEMPR0[5] ), .B(\R_DATA_TEMPR1[5] )
        , .C(\R_DATA_TEMPR2[5] ), .D(\R_DATA_TEMPR3[5] ), .Y(R_DATA[5])
        );
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%6%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C6 (.A_DOUT({nc2457, 
        nc2458, nc2459, nc2460, nc2461, nc2462, nc2463, nc2464, nc2465, 
        nc2466, nc2467, nc2468, nc2469, nc2470, nc2471, nc2472, nc2473, 
        nc2474, nc2475, \R_DATA_TEMPR0[6] }), .B_DOUT({nc2476, nc2477, 
        nc2478, nc2479, nc2480, nc2481, nc2482, nc2483, nc2484, nc2485, 
        nc2486, nc2487, nc2488, nc2489, nc2490, nc2491, nc2492, nc2493, 
        nc2494, nc2495}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][6] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[6]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%7%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C7 (.A_DOUT({nc2496, 
        nc2497, nc2498, nc2499, nc2500, nc2501, nc2502, nc2503, nc2504, 
        nc2505, nc2506, nc2507, nc2508, nc2509, nc2510, nc2511, nc2512, 
        nc2513, nc2514, \R_DATA_TEMPR1[7] }), .B_DOUT({nc2515, nc2516, 
        nc2517, nc2518, nc2519, nc2520, nc2521, nc2522, nc2523, nc2524, 
        nc2525, nc2526, nc2527, nc2528, nc2529, nc2530, nc2531, nc2532, 
        nc2533, nc2534}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][7] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[7]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%2%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C2 (.A_DOUT({nc2535, 
        nc2536, nc2537, nc2538, nc2539, nc2540, nc2541, nc2542, nc2543, 
        nc2544, nc2545, nc2546, nc2547, nc2548, nc2549, nc2550, nc2551, 
        nc2552, nc2553, \R_DATA_TEMPR2[2] }), .B_DOUT({nc2554, nc2555, 
        nc2556, nc2557, nc2558, nc2559, nc2560, nc2561, nc2562, nc2563, 
        nc2564, nc2565, nc2566, nc2567, nc2568, nc2569, nc2570, nc2571, 
        nc2572, nc2573}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][2] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[2]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%6%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C6 (.A_DOUT({nc2574, 
        nc2575, nc2576, nc2577, nc2578, nc2579, nc2580, nc2581, nc2582, 
        nc2583, nc2584, nc2585, nc2586, nc2587, nc2588, nc2589, nc2590, 
        nc2591, nc2592, \R_DATA_TEMPR1[6] }), .B_DOUT({nc2593, nc2594, 
        nc2595, nc2596, nc2597, nc2598, nc2599, nc2600, nc2601, nc2602, 
        nc2603, nc2604, nc2605, nc2606, nc2607, nc2608, nc2609, nc2610, 
        nc2611, nc2612}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][6] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[6]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_R_DATA[7]  (.A(\R_DATA_TEMPR0[7] ), .B(\R_DATA_TEMPR1[7] )
        , .C(\R_DATA_TEMPR2[7] ), .D(\R_DATA_TEMPR3[7] ), .Y(R_DATA[7])
        );
    OR4 \OR4_R_DATA[6]  (.A(\R_DATA_TEMPR0[6] ), .B(\R_DATA_TEMPR1[6] )
        , .C(\R_DATA_TEMPR2[6] ), .D(\R_DATA_TEMPR3[6] ), .Y(R_DATA[6])
        );
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%2%15%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R2C15 (.A_DOUT({nc2613, 
        nc2614, nc2615, nc2616, nc2617, nc2618, nc2619, nc2620, nc2621, 
        nc2622, nc2623, nc2624, nc2625, nc2626, nc2627, nc2628, nc2629, 
        nc2630, nc2631, \R_DATA_TEMPR2[15] }), .B_DOUT({nc2632, nc2633, 
        nc2634, nc2635, nc2636, nc2637, nc2638, nc2639, nc2640, nc2641, 
        nc2642, nc2643, nc2644, nc2645, nc2646, nc2647, nc2648, nc2649, 
        nc2650, nc2651}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[2][15] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, R_ADDR[15], 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        W_ADDR[15], \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[15]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    INV \INVBLKY1[0]  (.A(R_ADDR[15]), .Y(\BLKY1[0] ));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%5%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C5 (.A_DOUT({nc2652, 
        nc2653, nc2654, nc2655, nc2656, nc2657, nc2658, nc2659, nc2660, 
        nc2661, nc2662, nc2663, nc2664, nc2665, nc2666, nc2667, nc2668, 
        nc2669, nc2670, \R_DATA_TEMPR0[5] }), .B_DOUT({nc2671, nc2672, 
        nc2673, nc2674, nc2675, nc2676, nc2677, nc2678, nc2679, nc2680, 
        nc2681, nc2682, nc2683, nc2684, nc2685, nc2686, nc2687, nc2688, 
        nc2689, nc2690}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][5] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[5]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%3%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C3 (.A_DOUT({nc2691, 
        nc2692, nc2693, nc2694, nc2695, nc2696, nc2697, nc2698, nc2699, 
        nc2700, nc2701, nc2702, nc2703, nc2704, nc2705, nc2706, nc2707, 
        nc2708, nc2709, \R_DATA_TEMPR1[3] }), .B_DOUT({nc2710, nc2711, 
        nc2712, nc2713, nc2714, nc2715, nc2716, nc2717, nc2718, nc2719, 
        nc2720, nc2721, nc2722, nc2723, nc2724, nc2725, nc2726, nc2727, 
        nc2728, nc2729}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][3] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[3]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%0%14%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R0C14 (.A_DOUT({nc2730, 
        nc2731, nc2732, nc2733, nc2734, nc2735, nc2736, nc2737, nc2738, 
        nc2739, nc2740, nc2741, nc2742, nc2743, nc2744, nc2745, nc2746, 
        nc2747, nc2748, \R_DATA_TEMPR0[14] }), .B_DOUT({nc2749, nc2750, 
        nc2751, nc2752, nc2753, nc2754, nc2755, nc2756, nc2757, nc2758, 
        nc2759, nc2760, nc2761, nc2762, nc2763, nc2764, nc2765, nc2766, 
        nc2767, nc2768}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][14] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        \BLKY0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , \BLKX0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[14]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%65536-65536%18-18%SPEED%1%1%TWO-PORT%ECC_EN-0")
         )  COREFIFO_C5_COREFIFO_C5_0_LSRAM_top_R1C1 (.A_DOUT({nc2769, 
        nc2770, nc2771, nc2772, nc2773, nc2774, nc2775, nc2776, nc2777, 
        nc2778, nc2779, nc2780, nc2781, nc2782, nc2783, nc2784, nc2785, 
        nc2786, nc2787, \R_DATA_TEMPR1[1] }), .B_DOUT({nc2788, nc2789, 
        nc2790, nc2791, nc2792, nc2793, nc2794, nc2795, nc2796, nc2797, 
        nc2798, nc2799, nc2800, nc2801, nc2802, nc2803, nc2804, nc2805, 
        nc2806, nc2807}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[1][1] ), .A_ADDR({R_ADDR[13], R_ADDR[12], 
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0]}), .A_BLK_EN({R_EN, \BLKY1[0] , 
        R_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({
        W_ADDR[13], W_ADDR[12], W_ADDR[11], W_ADDR[10], W_ADDR[9], 
        W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0]}), .B_BLK_EN({W_EN, 
        \BLKX1[0] , W_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, W_DATA[1]}), .B_REN(VCC), .B_WEN({GND, VCC})
        , .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
