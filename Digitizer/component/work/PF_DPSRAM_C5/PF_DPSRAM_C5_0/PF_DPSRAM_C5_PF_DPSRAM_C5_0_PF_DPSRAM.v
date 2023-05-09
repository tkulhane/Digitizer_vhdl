`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.10


module PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM(
       A_DIN,
       A_DOUT,
       B_DIN,
       B_DOUT,
       A_ADDR,
       B_ADDR,
       A_BLK_EN,
       B_BLK_EN,
       CLK,
       A_WEN,
       B_WEN
    );
input  [63:0] A_DIN;
output [63:0] A_DOUT;
input  [63:0] B_DIN;
output [63:0] B_DOUT;
input  [15:0] A_ADDR;
input  [15:0] B_ADDR;
input  A_BLK_EN;
input  B_BLK_EN;
input  CLK;
input  A_WEN;
input  B_WEN;

    wire \B_DOUT_TEMPR0[0] , \B_DOUT_TEMPR1[0] , \B_DOUT_TEMPR2[0] , 
        \B_DOUT_TEMPR3[0] , \B_DOUT_TEMPR0[1] , \B_DOUT_TEMPR1[1] , 
        \B_DOUT_TEMPR2[1] , \B_DOUT_TEMPR3[1] , \B_DOUT_TEMPR0[2] , 
        \B_DOUT_TEMPR1[2] , \B_DOUT_TEMPR2[2] , \B_DOUT_TEMPR3[2] , 
        \B_DOUT_TEMPR0[3] , \B_DOUT_TEMPR1[3] , \B_DOUT_TEMPR2[3] , 
        \B_DOUT_TEMPR3[3] , \B_DOUT_TEMPR0[4] , \B_DOUT_TEMPR1[4] , 
        \B_DOUT_TEMPR2[4] , \B_DOUT_TEMPR3[4] , \B_DOUT_TEMPR0[5] , 
        \B_DOUT_TEMPR1[5] , \B_DOUT_TEMPR2[5] , \B_DOUT_TEMPR3[5] , 
        \B_DOUT_TEMPR0[6] , \B_DOUT_TEMPR1[6] , \B_DOUT_TEMPR2[6] , 
        \B_DOUT_TEMPR3[6] , \B_DOUT_TEMPR0[7] , \B_DOUT_TEMPR1[7] , 
        \B_DOUT_TEMPR2[7] , \B_DOUT_TEMPR3[7] , \B_DOUT_TEMPR0[8] , 
        \B_DOUT_TEMPR1[8] , \B_DOUT_TEMPR2[8] , \B_DOUT_TEMPR3[8] , 
        \B_DOUT_TEMPR0[9] , \B_DOUT_TEMPR1[9] , \B_DOUT_TEMPR2[9] , 
        \B_DOUT_TEMPR3[9] , \B_DOUT_TEMPR0[10] , \B_DOUT_TEMPR1[10] , 
        \B_DOUT_TEMPR2[10] , \B_DOUT_TEMPR3[10] , \B_DOUT_TEMPR0[11] , 
        \B_DOUT_TEMPR1[11] , \B_DOUT_TEMPR2[11] , \B_DOUT_TEMPR3[11] , 
        \B_DOUT_TEMPR0[12] , \B_DOUT_TEMPR1[12] , \B_DOUT_TEMPR2[12] , 
        \B_DOUT_TEMPR3[12] , \B_DOUT_TEMPR0[13] , \B_DOUT_TEMPR1[13] , 
        \B_DOUT_TEMPR2[13] , \B_DOUT_TEMPR3[13] , \B_DOUT_TEMPR0[14] , 
        \B_DOUT_TEMPR1[14] , \B_DOUT_TEMPR2[14] , \B_DOUT_TEMPR3[14] , 
        \B_DOUT_TEMPR0[15] , \B_DOUT_TEMPR1[15] , \B_DOUT_TEMPR2[15] , 
        \B_DOUT_TEMPR3[15] , \B_DOUT_TEMPR0[16] , \B_DOUT_TEMPR1[16] , 
        \B_DOUT_TEMPR2[16] , \B_DOUT_TEMPR3[16] , \B_DOUT_TEMPR0[17] , 
        \B_DOUT_TEMPR1[17] , \B_DOUT_TEMPR2[17] , \B_DOUT_TEMPR3[17] , 
        \B_DOUT_TEMPR0[18] , \B_DOUT_TEMPR1[18] , \B_DOUT_TEMPR2[18] , 
        \B_DOUT_TEMPR3[18] , \B_DOUT_TEMPR0[19] , \B_DOUT_TEMPR1[19] , 
        \B_DOUT_TEMPR2[19] , \B_DOUT_TEMPR3[19] , \B_DOUT_TEMPR0[20] , 
        \B_DOUT_TEMPR1[20] , \B_DOUT_TEMPR2[20] , \B_DOUT_TEMPR3[20] , 
        \B_DOUT_TEMPR0[21] , \B_DOUT_TEMPR1[21] , \B_DOUT_TEMPR2[21] , 
        \B_DOUT_TEMPR3[21] , \B_DOUT_TEMPR0[22] , \B_DOUT_TEMPR1[22] , 
        \B_DOUT_TEMPR2[22] , \B_DOUT_TEMPR3[22] , \B_DOUT_TEMPR0[23] , 
        \B_DOUT_TEMPR1[23] , \B_DOUT_TEMPR2[23] , \B_DOUT_TEMPR3[23] , 
        \B_DOUT_TEMPR0[24] , \B_DOUT_TEMPR1[24] , \B_DOUT_TEMPR2[24] , 
        \B_DOUT_TEMPR3[24] , \B_DOUT_TEMPR0[25] , \B_DOUT_TEMPR1[25] , 
        \B_DOUT_TEMPR2[25] , \B_DOUT_TEMPR3[25] , \B_DOUT_TEMPR0[26] , 
        \B_DOUT_TEMPR1[26] , \B_DOUT_TEMPR2[26] , \B_DOUT_TEMPR3[26] , 
        \B_DOUT_TEMPR0[27] , \B_DOUT_TEMPR1[27] , \B_DOUT_TEMPR2[27] , 
        \B_DOUT_TEMPR3[27] , \B_DOUT_TEMPR0[28] , \B_DOUT_TEMPR1[28] , 
        \B_DOUT_TEMPR2[28] , \B_DOUT_TEMPR3[28] , \B_DOUT_TEMPR0[29] , 
        \B_DOUT_TEMPR1[29] , \B_DOUT_TEMPR2[29] , \B_DOUT_TEMPR3[29] , 
        \B_DOUT_TEMPR0[30] , \B_DOUT_TEMPR1[30] , \B_DOUT_TEMPR2[30] , 
        \B_DOUT_TEMPR3[30] , \B_DOUT_TEMPR0[31] , \B_DOUT_TEMPR1[31] , 
        \B_DOUT_TEMPR2[31] , \B_DOUT_TEMPR3[31] , \B_DOUT_TEMPR0[32] , 
        \B_DOUT_TEMPR1[32] , \B_DOUT_TEMPR2[32] , \B_DOUT_TEMPR3[32] , 
        \B_DOUT_TEMPR0[33] , \B_DOUT_TEMPR1[33] , \B_DOUT_TEMPR2[33] , 
        \B_DOUT_TEMPR3[33] , \B_DOUT_TEMPR0[34] , \B_DOUT_TEMPR1[34] , 
        \B_DOUT_TEMPR2[34] , \B_DOUT_TEMPR3[34] , \B_DOUT_TEMPR0[35] , 
        \B_DOUT_TEMPR1[35] , \B_DOUT_TEMPR2[35] , \B_DOUT_TEMPR3[35] , 
        \B_DOUT_TEMPR0[36] , \B_DOUT_TEMPR1[36] , \B_DOUT_TEMPR2[36] , 
        \B_DOUT_TEMPR3[36] , \B_DOUT_TEMPR0[37] , \B_DOUT_TEMPR1[37] , 
        \B_DOUT_TEMPR2[37] , \B_DOUT_TEMPR3[37] , \B_DOUT_TEMPR0[38] , 
        \B_DOUT_TEMPR1[38] , \B_DOUT_TEMPR2[38] , \B_DOUT_TEMPR3[38] , 
        \B_DOUT_TEMPR0[39] , \B_DOUT_TEMPR1[39] , \B_DOUT_TEMPR2[39] , 
        \B_DOUT_TEMPR3[39] , \B_DOUT_TEMPR0[40] , \B_DOUT_TEMPR1[40] , 
        \B_DOUT_TEMPR2[40] , \B_DOUT_TEMPR3[40] , \B_DOUT_TEMPR0[41] , 
        \B_DOUT_TEMPR1[41] , \B_DOUT_TEMPR2[41] , \B_DOUT_TEMPR3[41] , 
        \B_DOUT_TEMPR0[42] , \B_DOUT_TEMPR1[42] , \B_DOUT_TEMPR2[42] , 
        \B_DOUT_TEMPR3[42] , \B_DOUT_TEMPR0[43] , \B_DOUT_TEMPR1[43] , 
        \B_DOUT_TEMPR2[43] , \B_DOUT_TEMPR3[43] , \B_DOUT_TEMPR0[44] , 
        \B_DOUT_TEMPR1[44] , \B_DOUT_TEMPR2[44] , \B_DOUT_TEMPR3[44] , 
        \B_DOUT_TEMPR0[45] , \B_DOUT_TEMPR1[45] , \B_DOUT_TEMPR2[45] , 
        \B_DOUT_TEMPR3[45] , \B_DOUT_TEMPR0[46] , \B_DOUT_TEMPR1[46] , 
        \B_DOUT_TEMPR2[46] , \B_DOUT_TEMPR3[46] , \B_DOUT_TEMPR0[47] , 
        \B_DOUT_TEMPR1[47] , \B_DOUT_TEMPR2[47] , \B_DOUT_TEMPR3[47] , 
        \B_DOUT_TEMPR0[48] , \B_DOUT_TEMPR1[48] , \B_DOUT_TEMPR2[48] , 
        \B_DOUT_TEMPR3[48] , \B_DOUT_TEMPR0[49] , \B_DOUT_TEMPR1[49] , 
        \B_DOUT_TEMPR2[49] , \B_DOUT_TEMPR3[49] , \B_DOUT_TEMPR0[50] , 
        \B_DOUT_TEMPR1[50] , \B_DOUT_TEMPR2[50] , \B_DOUT_TEMPR3[50] , 
        \B_DOUT_TEMPR0[51] , \B_DOUT_TEMPR1[51] , \B_DOUT_TEMPR2[51] , 
        \B_DOUT_TEMPR3[51] , \B_DOUT_TEMPR0[52] , \B_DOUT_TEMPR1[52] , 
        \B_DOUT_TEMPR2[52] , \B_DOUT_TEMPR3[52] , \B_DOUT_TEMPR0[53] , 
        \B_DOUT_TEMPR1[53] , \B_DOUT_TEMPR2[53] , \B_DOUT_TEMPR3[53] , 
        \B_DOUT_TEMPR0[54] , \B_DOUT_TEMPR1[54] , \B_DOUT_TEMPR2[54] , 
        \B_DOUT_TEMPR3[54] , \B_DOUT_TEMPR0[55] , \B_DOUT_TEMPR1[55] , 
        \B_DOUT_TEMPR2[55] , \B_DOUT_TEMPR3[55] , \B_DOUT_TEMPR0[56] , 
        \B_DOUT_TEMPR1[56] , \B_DOUT_TEMPR2[56] , \B_DOUT_TEMPR3[56] , 
        \B_DOUT_TEMPR0[57] , \B_DOUT_TEMPR1[57] , \B_DOUT_TEMPR2[57] , 
        \B_DOUT_TEMPR3[57] , \B_DOUT_TEMPR0[58] , \B_DOUT_TEMPR1[58] , 
        \B_DOUT_TEMPR2[58] , \B_DOUT_TEMPR3[58] , \B_DOUT_TEMPR0[59] , 
        \B_DOUT_TEMPR1[59] , \B_DOUT_TEMPR2[59] , \B_DOUT_TEMPR3[59] , 
        \B_DOUT_TEMPR0[60] , \B_DOUT_TEMPR1[60] , \B_DOUT_TEMPR2[60] , 
        \B_DOUT_TEMPR3[60] , \B_DOUT_TEMPR0[61] , \B_DOUT_TEMPR1[61] , 
        \B_DOUT_TEMPR2[61] , \B_DOUT_TEMPR3[61] , \B_DOUT_TEMPR0[62] , 
        \B_DOUT_TEMPR1[62] , \B_DOUT_TEMPR2[62] , \B_DOUT_TEMPR3[62] , 
        \B_DOUT_TEMPR0[63] , \B_DOUT_TEMPR1[63] , \B_DOUT_TEMPR2[63] , 
        \B_DOUT_TEMPR3[63] , \A_DOUT_TEMPR0[0] , \A_DOUT_TEMPR1[0] , 
        \A_DOUT_TEMPR2[0] , \A_DOUT_TEMPR3[0] , \A_DOUT_TEMPR0[1] , 
        \A_DOUT_TEMPR1[1] , \A_DOUT_TEMPR2[1] , \A_DOUT_TEMPR3[1] , 
        \A_DOUT_TEMPR0[2] , \A_DOUT_TEMPR1[2] , \A_DOUT_TEMPR2[2] , 
        \A_DOUT_TEMPR3[2] , \A_DOUT_TEMPR0[3] , \A_DOUT_TEMPR1[3] , 
        \A_DOUT_TEMPR2[3] , \A_DOUT_TEMPR3[3] , \A_DOUT_TEMPR0[4] , 
        \A_DOUT_TEMPR1[4] , \A_DOUT_TEMPR2[4] , \A_DOUT_TEMPR3[4] , 
        \A_DOUT_TEMPR0[5] , \A_DOUT_TEMPR1[5] , \A_DOUT_TEMPR2[5] , 
        \A_DOUT_TEMPR3[5] , \A_DOUT_TEMPR0[6] , \A_DOUT_TEMPR1[6] , 
        \A_DOUT_TEMPR2[6] , \A_DOUT_TEMPR3[6] , \A_DOUT_TEMPR0[7] , 
        \A_DOUT_TEMPR1[7] , \A_DOUT_TEMPR2[7] , \A_DOUT_TEMPR3[7] , 
        \A_DOUT_TEMPR0[8] , \A_DOUT_TEMPR1[8] , \A_DOUT_TEMPR2[8] , 
        \A_DOUT_TEMPR3[8] , \A_DOUT_TEMPR0[9] , \A_DOUT_TEMPR1[9] , 
        \A_DOUT_TEMPR2[9] , \A_DOUT_TEMPR3[9] , \A_DOUT_TEMPR0[10] , 
        \A_DOUT_TEMPR1[10] , \A_DOUT_TEMPR2[10] , \A_DOUT_TEMPR3[10] , 
        \A_DOUT_TEMPR0[11] , \A_DOUT_TEMPR1[11] , \A_DOUT_TEMPR2[11] , 
        \A_DOUT_TEMPR3[11] , \A_DOUT_TEMPR0[12] , \A_DOUT_TEMPR1[12] , 
        \A_DOUT_TEMPR2[12] , \A_DOUT_TEMPR3[12] , \A_DOUT_TEMPR0[13] , 
        \A_DOUT_TEMPR1[13] , \A_DOUT_TEMPR2[13] , \A_DOUT_TEMPR3[13] , 
        \A_DOUT_TEMPR0[14] , \A_DOUT_TEMPR1[14] , \A_DOUT_TEMPR2[14] , 
        \A_DOUT_TEMPR3[14] , \A_DOUT_TEMPR0[15] , \A_DOUT_TEMPR1[15] , 
        \A_DOUT_TEMPR2[15] , \A_DOUT_TEMPR3[15] , \A_DOUT_TEMPR0[16] , 
        \A_DOUT_TEMPR1[16] , \A_DOUT_TEMPR2[16] , \A_DOUT_TEMPR3[16] , 
        \A_DOUT_TEMPR0[17] , \A_DOUT_TEMPR1[17] , \A_DOUT_TEMPR2[17] , 
        \A_DOUT_TEMPR3[17] , \A_DOUT_TEMPR0[18] , \A_DOUT_TEMPR1[18] , 
        \A_DOUT_TEMPR2[18] , \A_DOUT_TEMPR3[18] , \A_DOUT_TEMPR0[19] , 
        \A_DOUT_TEMPR1[19] , \A_DOUT_TEMPR2[19] , \A_DOUT_TEMPR3[19] , 
        \A_DOUT_TEMPR0[20] , \A_DOUT_TEMPR1[20] , \A_DOUT_TEMPR2[20] , 
        \A_DOUT_TEMPR3[20] , \A_DOUT_TEMPR0[21] , \A_DOUT_TEMPR1[21] , 
        \A_DOUT_TEMPR2[21] , \A_DOUT_TEMPR3[21] , \A_DOUT_TEMPR0[22] , 
        \A_DOUT_TEMPR1[22] , \A_DOUT_TEMPR2[22] , \A_DOUT_TEMPR3[22] , 
        \A_DOUT_TEMPR0[23] , \A_DOUT_TEMPR1[23] , \A_DOUT_TEMPR2[23] , 
        \A_DOUT_TEMPR3[23] , \A_DOUT_TEMPR0[24] , \A_DOUT_TEMPR1[24] , 
        \A_DOUT_TEMPR2[24] , \A_DOUT_TEMPR3[24] , \A_DOUT_TEMPR0[25] , 
        \A_DOUT_TEMPR1[25] , \A_DOUT_TEMPR2[25] , \A_DOUT_TEMPR3[25] , 
        \A_DOUT_TEMPR0[26] , \A_DOUT_TEMPR1[26] , \A_DOUT_TEMPR2[26] , 
        \A_DOUT_TEMPR3[26] , \A_DOUT_TEMPR0[27] , \A_DOUT_TEMPR1[27] , 
        \A_DOUT_TEMPR2[27] , \A_DOUT_TEMPR3[27] , \A_DOUT_TEMPR0[28] , 
        \A_DOUT_TEMPR1[28] , \A_DOUT_TEMPR2[28] , \A_DOUT_TEMPR3[28] , 
        \A_DOUT_TEMPR0[29] , \A_DOUT_TEMPR1[29] , \A_DOUT_TEMPR2[29] , 
        \A_DOUT_TEMPR3[29] , \A_DOUT_TEMPR0[30] , \A_DOUT_TEMPR1[30] , 
        \A_DOUT_TEMPR2[30] , \A_DOUT_TEMPR3[30] , \A_DOUT_TEMPR0[31] , 
        \A_DOUT_TEMPR1[31] , \A_DOUT_TEMPR2[31] , \A_DOUT_TEMPR3[31] , 
        \A_DOUT_TEMPR0[32] , \A_DOUT_TEMPR1[32] , \A_DOUT_TEMPR2[32] , 
        \A_DOUT_TEMPR3[32] , \A_DOUT_TEMPR0[33] , \A_DOUT_TEMPR1[33] , 
        \A_DOUT_TEMPR2[33] , \A_DOUT_TEMPR3[33] , \A_DOUT_TEMPR0[34] , 
        \A_DOUT_TEMPR1[34] , \A_DOUT_TEMPR2[34] , \A_DOUT_TEMPR3[34] , 
        \A_DOUT_TEMPR0[35] , \A_DOUT_TEMPR1[35] , \A_DOUT_TEMPR2[35] , 
        \A_DOUT_TEMPR3[35] , \A_DOUT_TEMPR0[36] , \A_DOUT_TEMPR1[36] , 
        \A_DOUT_TEMPR2[36] , \A_DOUT_TEMPR3[36] , \A_DOUT_TEMPR0[37] , 
        \A_DOUT_TEMPR1[37] , \A_DOUT_TEMPR2[37] , \A_DOUT_TEMPR3[37] , 
        \A_DOUT_TEMPR0[38] , \A_DOUT_TEMPR1[38] , \A_DOUT_TEMPR2[38] , 
        \A_DOUT_TEMPR3[38] , \A_DOUT_TEMPR0[39] , \A_DOUT_TEMPR1[39] , 
        \A_DOUT_TEMPR2[39] , \A_DOUT_TEMPR3[39] , \A_DOUT_TEMPR0[40] , 
        \A_DOUT_TEMPR1[40] , \A_DOUT_TEMPR2[40] , \A_DOUT_TEMPR3[40] , 
        \A_DOUT_TEMPR0[41] , \A_DOUT_TEMPR1[41] , \A_DOUT_TEMPR2[41] , 
        \A_DOUT_TEMPR3[41] , \A_DOUT_TEMPR0[42] , \A_DOUT_TEMPR1[42] , 
        \A_DOUT_TEMPR2[42] , \A_DOUT_TEMPR3[42] , \A_DOUT_TEMPR0[43] , 
        \A_DOUT_TEMPR1[43] , \A_DOUT_TEMPR2[43] , \A_DOUT_TEMPR3[43] , 
        \A_DOUT_TEMPR0[44] , \A_DOUT_TEMPR1[44] , \A_DOUT_TEMPR2[44] , 
        \A_DOUT_TEMPR3[44] , \A_DOUT_TEMPR0[45] , \A_DOUT_TEMPR1[45] , 
        \A_DOUT_TEMPR2[45] , \A_DOUT_TEMPR3[45] , \A_DOUT_TEMPR0[46] , 
        \A_DOUT_TEMPR1[46] , \A_DOUT_TEMPR2[46] , \A_DOUT_TEMPR3[46] , 
        \A_DOUT_TEMPR0[47] , \A_DOUT_TEMPR1[47] , \A_DOUT_TEMPR2[47] , 
        \A_DOUT_TEMPR3[47] , \A_DOUT_TEMPR0[48] , \A_DOUT_TEMPR1[48] , 
        \A_DOUT_TEMPR2[48] , \A_DOUT_TEMPR3[48] , \A_DOUT_TEMPR0[49] , 
        \A_DOUT_TEMPR1[49] , \A_DOUT_TEMPR2[49] , \A_DOUT_TEMPR3[49] , 
        \A_DOUT_TEMPR0[50] , \A_DOUT_TEMPR1[50] , \A_DOUT_TEMPR2[50] , 
        \A_DOUT_TEMPR3[50] , \A_DOUT_TEMPR0[51] , \A_DOUT_TEMPR1[51] , 
        \A_DOUT_TEMPR2[51] , \A_DOUT_TEMPR3[51] , \A_DOUT_TEMPR0[52] , 
        \A_DOUT_TEMPR1[52] , \A_DOUT_TEMPR2[52] , \A_DOUT_TEMPR3[52] , 
        \A_DOUT_TEMPR0[53] , \A_DOUT_TEMPR1[53] , \A_DOUT_TEMPR2[53] , 
        \A_DOUT_TEMPR3[53] , \A_DOUT_TEMPR0[54] , \A_DOUT_TEMPR1[54] , 
        \A_DOUT_TEMPR2[54] , \A_DOUT_TEMPR3[54] , \A_DOUT_TEMPR0[55] , 
        \A_DOUT_TEMPR1[55] , \A_DOUT_TEMPR2[55] , \A_DOUT_TEMPR3[55] , 
        \A_DOUT_TEMPR0[56] , \A_DOUT_TEMPR1[56] , \A_DOUT_TEMPR2[56] , 
        \A_DOUT_TEMPR3[56] , \A_DOUT_TEMPR0[57] , \A_DOUT_TEMPR1[57] , 
        \A_DOUT_TEMPR2[57] , \A_DOUT_TEMPR3[57] , \A_DOUT_TEMPR0[58] , 
        \A_DOUT_TEMPR1[58] , \A_DOUT_TEMPR2[58] , \A_DOUT_TEMPR3[58] , 
        \A_DOUT_TEMPR0[59] , \A_DOUT_TEMPR1[59] , \A_DOUT_TEMPR2[59] , 
        \A_DOUT_TEMPR3[59] , \A_DOUT_TEMPR0[60] , \A_DOUT_TEMPR1[60] , 
        \A_DOUT_TEMPR2[60] , \A_DOUT_TEMPR3[60] , \A_DOUT_TEMPR0[61] , 
        \A_DOUT_TEMPR1[61] , \A_DOUT_TEMPR2[61] , \A_DOUT_TEMPR3[61] , 
        \A_DOUT_TEMPR0[62] , \A_DOUT_TEMPR1[62] , \A_DOUT_TEMPR2[62] , 
        \A_DOUT_TEMPR3[62] , \A_DOUT_TEMPR0[63] , \A_DOUT_TEMPR1[63] , 
        \A_DOUT_TEMPR2[63] , \A_DOUT_TEMPR3[63] , \BLKX0[0] , 
        \BLKY0[0] , \BLKX1[0] , \BLKY1[0] , \ACCESS_BUSY[0][0] , 
        \ACCESS_BUSY[0][1] , \ACCESS_BUSY[0][2] , \ACCESS_BUSY[0][3] , 
        \ACCESS_BUSY[0][4] , \ACCESS_BUSY[0][5] , \ACCESS_BUSY[0][6] , 
        \ACCESS_BUSY[0][7] , \ACCESS_BUSY[0][8] , \ACCESS_BUSY[0][9] , 
        \ACCESS_BUSY[0][10] , \ACCESS_BUSY[0][11] , 
        \ACCESS_BUSY[0][12] , \ACCESS_BUSY[0][13] , 
        \ACCESS_BUSY[0][14] , \ACCESS_BUSY[0][15] , 
        \ACCESS_BUSY[0][16] , \ACCESS_BUSY[0][17] , 
        \ACCESS_BUSY[0][18] , \ACCESS_BUSY[0][19] , 
        \ACCESS_BUSY[0][20] , \ACCESS_BUSY[0][21] , 
        \ACCESS_BUSY[0][22] , \ACCESS_BUSY[0][23] , 
        \ACCESS_BUSY[0][24] , \ACCESS_BUSY[0][25] , 
        \ACCESS_BUSY[0][26] , \ACCESS_BUSY[0][27] , 
        \ACCESS_BUSY[0][28] , \ACCESS_BUSY[0][29] , 
        \ACCESS_BUSY[0][30] , \ACCESS_BUSY[0][31] , 
        \ACCESS_BUSY[0][32] , \ACCESS_BUSY[0][33] , 
        \ACCESS_BUSY[0][34] , \ACCESS_BUSY[0][35] , 
        \ACCESS_BUSY[0][36] , \ACCESS_BUSY[0][37] , 
        \ACCESS_BUSY[0][38] , \ACCESS_BUSY[0][39] , 
        \ACCESS_BUSY[0][40] , \ACCESS_BUSY[0][41] , 
        \ACCESS_BUSY[0][42] , \ACCESS_BUSY[0][43] , 
        \ACCESS_BUSY[0][44] , \ACCESS_BUSY[0][45] , 
        \ACCESS_BUSY[0][46] , \ACCESS_BUSY[0][47] , 
        \ACCESS_BUSY[0][48] , \ACCESS_BUSY[0][49] , 
        \ACCESS_BUSY[0][50] , \ACCESS_BUSY[0][51] , 
        \ACCESS_BUSY[0][52] , \ACCESS_BUSY[0][53] , 
        \ACCESS_BUSY[0][54] , \ACCESS_BUSY[0][55] , 
        \ACCESS_BUSY[0][56] , \ACCESS_BUSY[0][57] , 
        \ACCESS_BUSY[0][58] , \ACCESS_BUSY[0][59] , 
        \ACCESS_BUSY[0][60] , \ACCESS_BUSY[0][61] , 
        \ACCESS_BUSY[0][62] , \ACCESS_BUSY[0][63] , 
        \ACCESS_BUSY[1][0] , \ACCESS_BUSY[1][1] , \ACCESS_BUSY[1][2] , 
        \ACCESS_BUSY[1][3] , \ACCESS_BUSY[1][4] , \ACCESS_BUSY[1][5] , 
        \ACCESS_BUSY[1][6] , \ACCESS_BUSY[1][7] , \ACCESS_BUSY[1][8] , 
        \ACCESS_BUSY[1][9] , \ACCESS_BUSY[1][10] , 
        \ACCESS_BUSY[1][11] , \ACCESS_BUSY[1][12] , 
        \ACCESS_BUSY[1][13] , \ACCESS_BUSY[1][14] , 
        \ACCESS_BUSY[1][15] , \ACCESS_BUSY[1][16] , 
        \ACCESS_BUSY[1][17] , \ACCESS_BUSY[1][18] , 
        \ACCESS_BUSY[1][19] , \ACCESS_BUSY[1][20] , 
        \ACCESS_BUSY[1][21] , \ACCESS_BUSY[1][22] , 
        \ACCESS_BUSY[1][23] , \ACCESS_BUSY[1][24] , 
        \ACCESS_BUSY[1][25] , \ACCESS_BUSY[1][26] , 
        \ACCESS_BUSY[1][27] , \ACCESS_BUSY[1][28] , 
        \ACCESS_BUSY[1][29] , \ACCESS_BUSY[1][30] , 
        \ACCESS_BUSY[1][31] , \ACCESS_BUSY[1][32] , 
        \ACCESS_BUSY[1][33] , \ACCESS_BUSY[1][34] , 
        \ACCESS_BUSY[1][35] , \ACCESS_BUSY[1][36] , 
        \ACCESS_BUSY[1][37] , \ACCESS_BUSY[1][38] , 
        \ACCESS_BUSY[1][39] , \ACCESS_BUSY[1][40] , 
        \ACCESS_BUSY[1][41] , \ACCESS_BUSY[1][42] , 
        \ACCESS_BUSY[1][43] , \ACCESS_BUSY[1][44] , 
        \ACCESS_BUSY[1][45] , \ACCESS_BUSY[1][46] , 
        \ACCESS_BUSY[1][47] , \ACCESS_BUSY[1][48] , 
        \ACCESS_BUSY[1][49] , \ACCESS_BUSY[1][50] , 
        \ACCESS_BUSY[1][51] , \ACCESS_BUSY[1][52] , 
        \ACCESS_BUSY[1][53] , \ACCESS_BUSY[1][54] , 
        \ACCESS_BUSY[1][55] , \ACCESS_BUSY[1][56] , 
        \ACCESS_BUSY[1][57] , \ACCESS_BUSY[1][58] , 
        \ACCESS_BUSY[1][59] , \ACCESS_BUSY[1][60] , 
        \ACCESS_BUSY[1][61] , \ACCESS_BUSY[1][62] , 
        \ACCESS_BUSY[1][63] , \ACCESS_BUSY[2][0] , \ACCESS_BUSY[2][1] , 
        \ACCESS_BUSY[2][2] , \ACCESS_BUSY[2][3] , \ACCESS_BUSY[2][4] , 
        \ACCESS_BUSY[2][5] , \ACCESS_BUSY[2][6] , \ACCESS_BUSY[2][7] , 
        \ACCESS_BUSY[2][8] , \ACCESS_BUSY[2][9] , \ACCESS_BUSY[2][10] , 
        \ACCESS_BUSY[2][11] , \ACCESS_BUSY[2][12] , 
        \ACCESS_BUSY[2][13] , \ACCESS_BUSY[2][14] , 
        \ACCESS_BUSY[2][15] , \ACCESS_BUSY[2][16] , 
        \ACCESS_BUSY[2][17] , \ACCESS_BUSY[2][18] , 
        \ACCESS_BUSY[2][19] , \ACCESS_BUSY[2][20] , 
        \ACCESS_BUSY[2][21] , \ACCESS_BUSY[2][22] , 
        \ACCESS_BUSY[2][23] , \ACCESS_BUSY[2][24] , 
        \ACCESS_BUSY[2][25] , \ACCESS_BUSY[2][26] , 
        \ACCESS_BUSY[2][27] , \ACCESS_BUSY[2][28] , 
        \ACCESS_BUSY[2][29] , \ACCESS_BUSY[2][30] , 
        \ACCESS_BUSY[2][31] , \ACCESS_BUSY[2][32] , 
        \ACCESS_BUSY[2][33] , \ACCESS_BUSY[2][34] , 
        \ACCESS_BUSY[2][35] , \ACCESS_BUSY[2][36] , 
        \ACCESS_BUSY[2][37] , \ACCESS_BUSY[2][38] , 
        \ACCESS_BUSY[2][39] , \ACCESS_BUSY[2][40] , 
        \ACCESS_BUSY[2][41] , \ACCESS_BUSY[2][42] , 
        \ACCESS_BUSY[2][43] , \ACCESS_BUSY[2][44] , 
        \ACCESS_BUSY[2][45] , \ACCESS_BUSY[2][46] , 
        \ACCESS_BUSY[2][47] , \ACCESS_BUSY[2][48] , 
        \ACCESS_BUSY[2][49] , \ACCESS_BUSY[2][50] , 
        \ACCESS_BUSY[2][51] , \ACCESS_BUSY[2][52] , 
        \ACCESS_BUSY[2][53] , \ACCESS_BUSY[2][54] , 
        \ACCESS_BUSY[2][55] , \ACCESS_BUSY[2][56] , 
        \ACCESS_BUSY[2][57] , \ACCESS_BUSY[2][58] , 
        \ACCESS_BUSY[2][59] , \ACCESS_BUSY[2][60] , 
        \ACCESS_BUSY[2][61] , \ACCESS_BUSY[2][62] , 
        \ACCESS_BUSY[2][63] , \ACCESS_BUSY[3][0] , \ACCESS_BUSY[3][1] , 
        \ACCESS_BUSY[3][2] , \ACCESS_BUSY[3][3] , \ACCESS_BUSY[3][4] , 
        \ACCESS_BUSY[3][5] , \ACCESS_BUSY[3][6] , \ACCESS_BUSY[3][7] , 
        \ACCESS_BUSY[3][8] , \ACCESS_BUSY[3][9] , \ACCESS_BUSY[3][10] , 
        \ACCESS_BUSY[3][11] , \ACCESS_BUSY[3][12] , 
        \ACCESS_BUSY[3][13] , \ACCESS_BUSY[3][14] , 
        \ACCESS_BUSY[3][15] , \ACCESS_BUSY[3][16] , 
        \ACCESS_BUSY[3][17] , \ACCESS_BUSY[3][18] , 
        \ACCESS_BUSY[3][19] , \ACCESS_BUSY[3][20] , 
        \ACCESS_BUSY[3][21] , \ACCESS_BUSY[3][22] , 
        \ACCESS_BUSY[3][23] , \ACCESS_BUSY[3][24] , 
        \ACCESS_BUSY[3][25] , \ACCESS_BUSY[3][26] , 
        \ACCESS_BUSY[3][27] , \ACCESS_BUSY[3][28] , 
        \ACCESS_BUSY[3][29] , \ACCESS_BUSY[3][30] , 
        \ACCESS_BUSY[3][31] , \ACCESS_BUSY[3][32] , 
        \ACCESS_BUSY[3][33] , \ACCESS_BUSY[3][34] , 
        \ACCESS_BUSY[3][35] , \ACCESS_BUSY[3][36] , 
        \ACCESS_BUSY[3][37] , \ACCESS_BUSY[3][38] , 
        \ACCESS_BUSY[3][39] , \ACCESS_BUSY[3][40] , 
        \ACCESS_BUSY[3][41] , \ACCESS_BUSY[3][42] , 
        \ACCESS_BUSY[3][43] , \ACCESS_BUSY[3][44] , 
        \ACCESS_BUSY[3][45] , \ACCESS_BUSY[3][46] , 
        \ACCESS_BUSY[3][47] , \ACCESS_BUSY[3][48] , 
        \ACCESS_BUSY[3][49] , \ACCESS_BUSY[3][50] , 
        \ACCESS_BUSY[3][51] , \ACCESS_BUSY[3][52] , 
        \ACCESS_BUSY[3][53] , \ACCESS_BUSY[3][54] , 
        \ACCESS_BUSY[3][55] , \ACCESS_BUSY[3][56] , 
        \ACCESS_BUSY[3][57] , \ACCESS_BUSY[3][58] , 
        \ACCESS_BUSY[3][59] , \ACCESS_BUSY[3][60] , 
        \ACCESS_BUSY[3][61] , \ACCESS_BUSY[3][62] , 
        \ACCESS_BUSY[3][63] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%40%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C40 (.A_DOUT({nc0, 
        nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, 
        nc13, nc14, nc15, nc16, nc17, nc18, \A_DOUT_TEMPR0[40] }), 
        .B_DOUT({nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26, nc27, 
        nc28, nc29, nc30, nc31, nc32, nc33, nc34, nc35, nc36, nc37, 
        \B_DOUT_TEMPR0[40] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][40] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[40]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[40]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%48%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C48 (.A_DOUT({nc38, 
        nc39, nc40, nc41, nc42, nc43, nc44, nc45, nc46, nc47, nc48, 
        nc49, nc50, nc51, nc52, nc53, nc54, nc55, nc56, 
        \A_DOUT_TEMPR0[48] }), .B_DOUT({nc57, nc58, nc59, nc60, nc61, 
        nc62, nc63, nc64, nc65, nc66, nc67, nc68, nc69, nc70, nc71, 
        nc72, nc73, nc74, nc75, \B_DOUT_TEMPR0[48] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][48] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[48]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[48]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%44%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C44 (.A_DOUT({nc76, 
        nc77, nc78, nc79, nc80, nc81, nc82, nc83, nc84, nc85, nc86, 
        nc87, nc88, nc89, nc90, nc91, nc92, nc93, nc94, 
        \A_DOUT_TEMPR1[44] }), .B_DOUT({nc95, nc96, nc97, nc98, nc99, 
        nc100, nc101, nc102, nc103, nc104, nc105, nc106, nc107, nc108, 
        nc109, nc110, nc111, nc112, nc113, \B_DOUT_TEMPR1[44] }), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][44] )
        , .A_ADDR({A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], 
        A_ADDR[9], A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], 
        A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), 
        .A_BLK_EN({A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, A_DIN[44]}), .A_REN(
        VCC), .A_WEN({GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(
        VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[44]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[13]  (.A(\A_DOUT_TEMPR0[13] ), .B(
        \A_DOUT_TEMPR1[13] ), .C(\A_DOUT_TEMPR2[13] ), .D(
        \A_DOUT_TEMPR3[13] ), .Y(A_DOUT[13]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%30%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C30 (.A_DOUT({
        nc114, nc115, nc116, nc117, nc118, nc119, nc120, nc121, nc122, 
        nc123, nc124, nc125, nc126, nc127, nc128, nc129, nc130, nc131, 
        nc132, \A_DOUT_TEMPR1[30] }), .B_DOUT({nc133, nc134, nc135, 
        nc136, nc137, nc138, nc139, nc140, nc141, nc142, nc143, nc144, 
        nc145, nc146, nc147, nc148, nc149, nc150, nc151, 
        \B_DOUT_TEMPR1[30] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[1][30] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[30]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[30]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%38%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C38 (.A_DOUT({
        nc152, nc153, nc154, nc155, nc156, nc157, nc158, nc159, nc160, 
        nc161, nc162, nc163, nc164, nc165, nc166, nc167, nc168, nc169, 
        nc170, \A_DOUT_TEMPR1[38] }), .B_DOUT({nc171, nc172, nc173, 
        nc174, nc175, nc176, nc177, nc178, nc179, nc180, nc181, nc182, 
        nc183, nc184, nc185, nc186, nc187, nc188, nc189, 
        \B_DOUT_TEMPR1[38] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[1][38] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[38]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[38]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[0]  (.A(\B_DOUT_TEMPR0[0] ), .B(\B_DOUT_TEMPR1[0] )
        , .C(\B_DOUT_TEMPR2[0] ), .D(\B_DOUT_TEMPR3[0] ), .Y(B_DOUT[0])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%30%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C30 (.A_DOUT({
        nc190, nc191, nc192, nc193, nc194, nc195, nc196, nc197, nc198, 
        nc199, nc200, nc201, nc202, nc203, nc204, nc205, nc206, nc207, 
        nc208, \A_DOUT_TEMPR2[30] }), .B_DOUT({nc209, nc210, nc211, 
        nc212, nc213, nc214, nc215, nc216, nc217, nc218, nc219, nc220, 
        nc221, nc222, nc223, nc224, nc225, nc226, nc227, 
        \B_DOUT_TEMPR2[30] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][30] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[30]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[30]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%41%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C41 (.A_DOUT({
        nc228, nc229, nc230, nc231, nc232, nc233, nc234, nc235, nc236, 
        nc237, nc238, nc239, nc240, nc241, nc242, nc243, nc244, nc245, 
        nc246, \A_DOUT_TEMPR2[41] }), .B_DOUT({nc247, nc248, nc249, 
        nc250, nc251, nc252, nc253, nc254, nc255, nc256, nc257, nc258, 
        nc259, nc260, nc261, nc262, nc263, nc264, nc265, 
        \B_DOUT_TEMPR2[41] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][41] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[41]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[41]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%38%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C38 (.A_DOUT({
        nc266, nc267, nc268, nc269, nc270, nc271, nc272, nc273, nc274, 
        nc275, nc276, nc277, nc278, nc279, nc280, nc281, nc282, nc283, 
        nc284, \A_DOUT_TEMPR2[38] }), .B_DOUT({nc285, nc286, nc287, 
        nc288, nc289, nc290, nc291, nc292, nc293, nc294, nc295, nc296, 
        nc297, nc298, nc299, nc300, nc301, nc302, nc303, 
        \B_DOUT_TEMPR2[38] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][38] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[38]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[38]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%43%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C43 (.A_DOUT({
        nc304, nc305, nc306, nc307, nc308, nc309, nc310, nc311, nc312, 
        nc313, nc314, nc315, nc316, nc317, nc318, nc319, nc320, nc321, 
        nc322, \A_DOUT_TEMPR3[43] }), .B_DOUT({nc323, nc324, nc325, 
        nc326, nc327, nc328, nc329, nc330, nc331, nc332, nc333, nc334, 
        nc335, nc336, nc337, nc338, nc339, nc340, nc341, 
        \B_DOUT_TEMPR3[43] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[3][43] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[43]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[43]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%7%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C7 (.A_DOUT({nc342, 
        nc343, nc344, nc345, nc346, nc347, nc348, nc349, nc350, nc351, 
        nc352, nc353, nc354, nc355, nc356, nc357, nc358, nc359, nc360, 
        \A_DOUT_TEMPR2[7] }), .B_DOUT({nc361, nc362, nc363, nc364, 
        nc365, nc366, nc367, nc368, nc369, nc370, nc371, nc372, nc373, 
        nc374, nc375, nc376, nc377, nc378, nc379, \B_DOUT_TEMPR2[7] }), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][7] ), 
        .A_ADDR({A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], 
        A_ADDR[9], A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], 
        A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), 
        .A_BLK_EN({A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, A_DIN[7]}), .A_REN(VCC)
        , .A_WEN({GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[7]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%21%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C21 (.A_DOUT({
        nc380, nc381, nc382, nc383, nc384, nc385, nc386, nc387, nc388, 
        nc389, nc390, nc391, nc392, nc393, nc394, nc395, nc396, nc397, 
        nc398, \A_DOUT_TEMPR2[21] }), .B_DOUT({nc399, nc400, nc401, 
        nc402, nc403, nc404, nc405, nc406, nc407, nc408, nc409, nc410, 
        nc411, nc412, nc413, nc414, nc415, nc416, nc417, 
        \B_DOUT_TEMPR2[21] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][21] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[21]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[21]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[39]  (.A(\A_DOUT_TEMPR0[39] ), .B(
        \A_DOUT_TEMPR1[39] ), .C(\A_DOUT_TEMPR2[39] ), .D(
        \A_DOUT_TEMPR3[39] ), .Y(A_DOUT[39]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%23%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C23 (.A_DOUT({
        nc418, nc419, nc420, nc421, nc422, nc423, nc424, nc425, nc426, 
        nc427, nc428, nc429, nc430, nc431, nc432, nc433, nc434, nc435, 
        nc436, \A_DOUT_TEMPR1[23] }), .B_DOUT({nc437, nc438, nc439, 
        nc440, nc441, nc442, nc443, nc444, nc445, nc446, nc447, nc448, 
        nc449, nc450, nc451, nc452, nc453, nc454, nc455, 
        \B_DOUT_TEMPR1[23] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[1][23] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[23]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[23]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%60%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C60 (.A_DOUT({
        nc456, nc457, nc458, nc459, nc460, nc461, nc462, nc463, nc464, 
        nc465, nc466, nc467, nc468, nc469, nc470, nc471, nc472, nc473, 
        nc474, \A_DOUT_TEMPR3[60] }), .B_DOUT({nc475, nc476, nc477, 
        nc478, nc479, nc480, nc481, nc482, nc483, nc484, nc485, nc486, 
        nc487, nc488, nc489, nc490, nc491, nc492, nc493, 
        \B_DOUT_TEMPR3[60] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[3][60] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[60]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[60]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%6%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C6 (.A_DOUT({nc494, 
        nc495, nc496, nc497, nc498, nc499, nc500, nc501, nc502, nc503, 
        nc504, nc505, nc506, nc507, nc508, nc509, nc510, nc511, nc512, 
        \A_DOUT_TEMPR1[6] }), .B_DOUT({nc513, nc514, nc515, nc516, 
        nc517, nc518, nc519, nc520, nc521, nc522, nc523, nc524, nc525, 
        nc526, nc527, nc528, nc529, nc530, nc531, \B_DOUT_TEMPR1[6] }), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][6] ), 
        .A_ADDR({A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], 
        A_ADDR[9], A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], 
        A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), 
        .A_BLK_EN({A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, A_DIN[6]}), .A_REN(VCC)
        , .A_WEN({GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[6]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[37]  (.A(\A_DOUT_TEMPR0[37] ), .B(
        \A_DOUT_TEMPR1[37] ), .C(\A_DOUT_TEMPR2[37] ), .D(
        \A_DOUT_TEMPR3[37] ), .Y(A_DOUT[37]));
    OR4 \OR4_A_DOUT[36]  (.A(\A_DOUT_TEMPR0[36] ), .B(
        \A_DOUT_TEMPR1[36] ), .C(\A_DOUT_TEMPR2[36] ), .D(
        \A_DOUT_TEMPR3[36] ), .Y(A_DOUT[36]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%62%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C62 (.A_DOUT({
        nc532, nc533, nc534, nc535, nc536, nc537, nc538, nc539, nc540, 
        nc541, nc542, nc543, nc544, nc545, nc546, nc547, nc548, nc549, 
        nc550, \A_DOUT_TEMPR1[62] }), .B_DOUT({nc551, nc552, nc553, 
        nc554, nc555, nc556, nc557, nc558, nc559, nc560, nc561, nc562, 
        nc563, nc564, nc565, nc566, nc567, nc568, nc569, 
        \B_DOUT_TEMPR1[62] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[1][62] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[62]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[62]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%23%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C23 (.A_DOUT({
        nc570, nc571, nc572, nc573, nc574, nc575, nc576, nc577, nc578, 
        nc579, nc580, nc581, nc582, nc583, nc584, nc585, nc586, nc587, 
        nc588, \A_DOUT_TEMPR3[23] }), .B_DOUT({nc589, nc590, nc591, 
        nc592, nc593, nc594, nc595, nc596, nc597, nc598, nc599, nc600, 
        nc601, nc602, nc603, nc604, nc605, nc606, nc607, 
        \B_DOUT_TEMPR3[23] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[3][23] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[23]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[23]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%45%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C45 (.A_DOUT({
        nc608, nc609, nc610, nc611, nc612, nc613, nc614, nc615, nc616, 
        nc617, nc618, nc619, nc620, nc621, nc622, nc623, nc624, nc625, 
        nc626, \A_DOUT_TEMPR2[45] }), .B_DOUT({nc627, nc628, nc629, 
        nc630, nc631, nc632, nc633, nc634, nc635, nc636, nc637, nc638, 
        nc639, nc640, nc641, nc642, nc643, nc644, nc645, 
        \B_DOUT_TEMPR2[45] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][45] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[45]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[45]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[9]  (.A(\B_DOUT_TEMPR0[9] ), .B(\B_DOUT_TEMPR1[9] )
        , .C(\B_DOUT_TEMPR2[9] ), .D(\B_DOUT_TEMPR3[9] ), .Y(B_DOUT[9])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%46%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C46 (.A_DOUT({
        nc646, nc647, nc648, nc649, nc650, nc651, nc652, nc653, nc654, 
        nc655, nc656, nc657, nc658, nc659, nc660, nc661, nc662, nc663, 
        nc664, \A_DOUT_TEMPR2[46] }), .B_DOUT({nc665, nc666, nc667, 
        nc668, nc669, nc670, nc671, nc672, nc673, nc674, nc675, nc676, 
        nc677, nc678, nc679, nc680, nc681, nc682, nc683, 
        \B_DOUT_TEMPR2[46] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][46] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[46]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[46]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%25%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C25 (.A_DOUT({
        nc684, nc685, nc686, nc687, nc688, nc689, nc690, nc691, nc692, 
        nc693, nc694, nc695, nc696, nc697, nc698, nc699, nc700, nc701, 
        nc702, \A_DOUT_TEMPR2[25] }), .B_DOUT({nc703, nc704, nc705, 
        nc706, nc707, nc708, nc709, nc710, nc711, nc712, nc713, nc714, 
        nc715, nc716, nc717, nc718, nc719, nc720, nc721, 
        \B_DOUT_TEMPR2[25] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][25] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[25]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[25]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%26%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C26 (.A_DOUT({
        nc722, nc723, nc724, nc725, nc726, nc727, nc728, nc729, nc730, 
        nc731, nc732, nc733, nc734, nc735, nc736, nc737, nc738, nc739, 
        nc740, \A_DOUT_TEMPR2[26] }), .B_DOUT({nc741, nc742, nc743, 
        nc744, nc745, nc746, nc747, nc748, nc749, nc750, nc751, nc752, 
        nc753, nc754, nc755, nc756, nc757, nc758, nc759, 
        \B_DOUT_TEMPR2[26] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][26] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[26]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[26]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[29]  (.A(\B_DOUT_TEMPR0[29] ), .B(
        \B_DOUT_TEMPR1[29] ), .C(\B_DOUT_TEMPR2[29] ), .D(
        \B_DOUT_TEMPR3[29] ), .Y(B_DOUT[29]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%17%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C17 (.A_DOUT({
        nc760, nc761, nc762, nc763, nc764, nc765, nc766, nc767, nc768, 
        nc769, nc770, nc771, nc772, nc773, nc774, nc775, nc776, nc777, 
        nc778, \A_DOUT_TEMPR3[17] }), .B_DOUT({nc779, nc780, nc781, 
        nc782, nc783, nc784, nc785, nc786, nc787, nc788, nc789, nc790, 
        nc791, nc792, nc793, nc794, nc795, nc796, nc797, 
        \B_DOUT_TEMPR3[17] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[3][17] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[17]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[17]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%20%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C20 (.A_DOUT({
        nc798, nc799, nc800, nc801, nc802, nc803, nc804, nc805, nc806, 
        nc807, nc808, nc809, nc810, nc811, nc812, nc813, nc814, nc815, 
        nc816, \A_DOUT_TEMPR0[20] }), .B_DOUT({nc817, nc818, nc819, 
        nc820, nc821, nc822, nc823, nc824, nc825, nc826, nc827, nc828, 
        nc829, nc830, nc831, nc832, nc833, nc834, nc835, 
        \B_DOUT_TEMPR0[20] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][20] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[20]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[20]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%28%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C28 (.A_DOUT({
        nc836, nc837, nc838, nc839, nc840, nc841, nc842, nc843, nc844, 
        nc845, nc846, nc847, nc848, nc849, nc850, nc851, nc852, nc853, 
        nc854, \A_DOUT_TEMPR0[28] }), .B_DOUT({nc855, nc856, nc857, 
        nc858, nc859, nc860, nc861, nc862, nc863, nc864, nc865, nc866, 
        nc867, nc868, nc869, nc870, nc871, nc872, nc873, 
        \B_DOUT_TEMPR0[28] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][28] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[28]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[28]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[28]  (.A(\B_DOUT_TEMPR0[28] ), .B(
        \B_DOUT_TEMPR1[28] ), .C(\B_DOUT_TEMPR2[28] ), .D(
        \B_DOUT_TEMPR3[28] ), .Y(B_DOUT[28]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%4%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C4 (.A_DOUT({nc874, 
        nc875, nc876, nc877, nc878, nc879, nc880, nc881, nc882, nc883, 
        nc884, nc885, nc886, nc887, nc888, nc889, nc890, nc891, nc892, 
        \A_DOUT_TEMPR2[4] }), .B_DOUT({nc893, nc894, nc895, nc896, 
        nc897, nc898, nc899, nc900, nc901, nc902, nc903, nc904, nc905, 
        nc906, nc907, nc908, nc909, nc910, nc911, \B_DOUT_TEMPR2[4] }), 
        .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][4] ), 
        .A_ADDR({A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], 
        A_ADDR[9], A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], 
        A_ADDR[4], A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), 
        .A_BLK_EN({A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, A_DIN[4]}), .A_REN(VCC)
        , .A_WEN({GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[4]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%42%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C42 (.A_DOUT({
        nc912, nc913, nc914, nc915, nc916, nc917, nc918, nc919, nc920, 
        nc921, nc922, nc923, nc924, nc925, nc926, nc927, nc928, nc929, 
        nc930, \A_DOUT_TEMPR2[42] }), .B_DOUT({nc931, nc932, nc933, 
        nc934, nc935, nc936, nc937, nc938, nc939, nc940, nc941, nc942, 
        nc943, nc944, nc945, nc946, nc947, nc948, nc949, 
        \B_DOUT_TEMPR2[42] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][42] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[42]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[42]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%10%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C10 (.A_DOUT({
        nc950, nc951, nc952, nc953, nc954, nc955, nc956, nc957, nc958, 
        nc959, nc960, nc961, nc962, nc963, nc964, nc965, nc966, nc967, 
        nc968, \A_DOUT_TEMPR1[10] }), .B_DOUT({nc969, nc970, nc971, 
        nc972, nc973, nc974, nc975, nc976, nc977, nc978, nc979, nc980, 
        nc981, nc982, nc983, nc984, nc985, nc986, nc987, 
        \B_DOUT_TEMPR1[10] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[1][10] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[10]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, \BLKY1[0] , B_ADDR[14]}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[10]}), .B_REN(
        VCC), .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(
        VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), 
        .A_WIDTH({GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC)
        , .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(
        VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%2%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C2 (.A_DOUT({nc988, 
        nc989, nc990, nc991, nc992, nc993, nc994, nc995, nc996, nc997, 
        nc998, nc999, nc1000, nc1001, nc1002, nc1003, nc1004, nc1005, 
        nc1006, \A_DOUT_TEMPR2[2] }), .B_DOUT({nc1007, nc1008, nc1009, 
        nc1010, nc1011, nc1012, nc1013, nc1014, nc1015, nc1016, nc1017, 
        nc1018, nc1019, nc1020, nc1021, nc1022, nc1023, nc1024, nc1025, 
        \B_DOUT_TEMPR2[2] }), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[2][2] ), .A_ADDR({A_ADDR[13], 
        A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], A_ADDR[8], 
        A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], 
        A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({A_BLK_EN, 
        A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, A_DIN[2]}), .A_REN(VCC), .A_WEN({GND, 
        A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], B_ADDR[11], B_ADDR[10], 
        B_ADDR[9], B_ADDR[8], B_ADDR[7], B_ADDR[6], B_ADDR[5], 
        B_ADDR[4], B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0]}), 
        .B_BLK_EN({B_BLK_EN, B_ADDR[15], \BLKY0[0] }), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, B_DIN[2]}), .B_REN(VCC)
        , .B_WEN({GND, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({GND, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%18%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C18 (.A_DOUT({
        nc1026, nc1027, nc1028, nc1029, nc1030, nc1031, nc1032, nc1033, 
        nc1034, nc1035, nc1036, nc1037, nc1038, nc1039, nc1040, nc1041, 
        nc1042, nc1043, nc1044, \A_DOUT_TEMPR1[18] }), .B_DOUT({nc1045, 
        nc1046, nc1047, nc1048, nc1049, nc1050, nc1051, nc1052, nc1053, 
        nc1054, nc1055, nc1056, nc1057, nc1058, nc1059, nc1060, nc1061, 
        nc1062, nc1063, \B_DOUT_TEMPR1[18] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][18] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[18]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[18]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[19]  (.A(\A_DOUT_TEMPR0[19] ), .B(
        \A_DOUT_TEMPR1[19] ), .C(\A_DOUT_TEMPR2[19] ), .D(
        \A_DOUT_TEMPR3[19] ), .Y(A_DOUT[19]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%11%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C11 (.A_DOUT({
        nc1064, nc1065, nc1066, nc1067, nc1068, nc1069, nc1070, nc1071, 
        nc1072, nc1073, nc1074, nc1075, nc1076, nc1077, nc1078, nc1079, 
        nc1080, nc1081, nc1082, \A_DOUT_TEMPR0[11] }), .B_DOUT({nc1083, 
        nc1084, nc1085, nc1086, nc1087, nc1088, nc1089, nc1090, nc1091, 
        nc1092, nc1093, nc1094, nc1095, nc1096, nc1097, nc1098, nc1099, 
        nc1100, nc1101, \B_DOUT_TEMPR0[11] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][11] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[11]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[11]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%22%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C22 (.A_DOUT({
        nc1102, nc1103, nc1104, nc1105, nc1106, nc1107, nc1108, nc1109, 
        nc1110, nc1111, nc1112, nc1113, nc1114, nc1115, nc1116, nc1117, 
        nc1118, nc1119, nc1120, \A_DOUT_TEMPR2[22] }), .B_DOUT({nc1121, 
        nc1122, nc1123, nc1124, nc1125, nc1126, nc1127, nc1128, nc1129, 
        nc1130, nc1131, nc1132, nc1133, nc1134, nc1135, nc1136, nc1137, 
        nc1138, nc1139, \B_DOUT_TEMPR2[22] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][22] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[22]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[22]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[27]  (.A(\B_DOUT_TEMPR0[27] ), .B(
        \B_DOUT_TEMPR1[27] ), .C(\B_DOUT_TEMPR2[27] ), .D(
        \B_DOUT_TEMPR3[27] ), .Y(B_DOUT[27]));
    OR4 \OR4_B_DOUT[56]  (.A(\B_DOUT_TEMPR0[56] ), .B(
        \B_DOUT_TEMPR1[56] ), .C(\B_DOUT_TEMPR2[56] ), .D(
        \B_DOUT_TEMPR3[56] ), .Y(B_DOUT[56]));
    OR4 \OR4_A_DOUT[61]  (.A(\A_DOUT_TEMPR0[61] ), .B(
        \A_DOUT_TEMPR1[61] ), .C(\A_DOUT_TEMPR2[61] ), .D(
        \A_DOUT_TEMPR3[61] ), .Y(A_DOUT[61]));
    OR4 \OR4_A_DOUT[17]  (.A(\A_DOUT_TEMPR0[17] ), .B(
        \A_DOUT_TEMPR1[17] ), .C(\A_DOUT_TEMPR2[17] ), .D(
        \A_DOUT_TEMPR3[17] ), .Y(A_DOUT[17]));
    OR4 \OR4_A_DOUT[16]  (.A(\A_DOUT_TEMPR0[16] ), .B(
        \A_DOUT_TEMPR1[16] ), .C(\A_DOUT_TEMPR2[16] ), .D(
        \A_DOUT_TEMPR3[16] ), .Y(A_DOUT[16]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%63%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C63 (.A_DOUT({
        nc1140, nc1141, nc1142, nc1143, nc1144, nc1145, nc1146, nc1147, 
        nc1148, nc1149, nc1150, nc1151, nc1152, nc1153, nc1154, nc1155, 
        nc1156, nc1157, nc1158, \A_DOUT_TEMPR1[63] }), .B_DOUT({nc1159, 
        nc1160, nc1161, nc1162, nc1163, nc1164, nc1165, nc1166, nc1167, 
        nc1168, nc1169, nc1170, nc1171, nc1172, nc1173, nc1174, nc1175, 
        nc1176, nc1177, \B_DOUT_TEMPR1[63] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][63] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[63]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[63]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%49%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C49 (.A_DOUT({
        nc1178, nc1179, nc1180, nc1181, nc1182, nc1183, nc1184, nc1185, 
        nc1186, nc1187, nc1188, nc1189, nc1190, nc1191, nc1192, nc1193, 
        nc1194, nc1195, nc1196, \A_DOUT_TEMPR1[49] }), .B_DOUT({nc1197, 
        nc1198, nc1199, nc1200, nc1201, nc1202, nc1203, nc1204, nc1205, 
        nc1206, nc1207, nc1208, nc1209, nc1210, nc1211, nc1212, nc1213, 
        nc1214, nc1215, \B_DOUT_TEMPR1[49] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][49] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[49]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[49]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[55]  (.A(\A_DOUT_TEMPR0[55] ), .B(
        \A_DOUT_TEMPR1[55] ), .C(\A_DOUT_TEMPR2[55] ), .D(
        \A_DOUT_TEMPR3[55] ), .Y(A_DOUT[55]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%47%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C47 (.A_DOUT({
        nc1216, nc1217, nc1218, nc1219, nc1220, nc1221, nc1222, nc1223, 
        nc1224, nc1225, nc1226, nc1227, nc1228, nc1229, nc1230, nc1231, 
        nc1232, nc1233, nc1234, \A_DOUT_TEMPR0[47] }), .B_DOUT({nc1235, 
        nc1236, nc1237, nc1238, nc1239, nc1240, nc1241, nc1242, nc1243, 
        nc1244, nc1245, nc1246, nc1247, nc1248, nc1249, nc1250, nc1251, 
        nc1252, nc1253, \B_DOUT_TEMPR0[47] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][47] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[47]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[47]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%15%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C15 (.A_DOUT({
        nc1254, nc1255, nc1256, nc1257, nc1258, nc1259, nc1260, nc1261, 
        nc1262, nc1263, nc1264, nc1265, nc1266, nc1267, nc1268, nc1269, 
        nc1270, nc1271, nc1272, \A_DOUT_TEMPR0[15] }), .B_DOUT({nc1273, 
        nc1274, nc1275, nc1276, nc1277, nc1278, nc1279, nc1280, nc1281, 
        nc1282, nc1283, nc1284, nc1285, nc1286, nc1287, nc1288, nc1289, 
        nc1290, nc1291, \B_DOUT_TEMPR0[15] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][15] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[15]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[15]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[22]  (.A(\A_DOUT_TEMPR0[22] ), .B(
        \A_DOUT_TEMPR1[22] ), .C(\A_DOUT_TEMPR2[22] ), .D(
        \A_DOUT_TEMPR3[22] ), .Y(A_DOUT[22]));
    OR4 \OR4_B_DOUT[46]  (.A(\B_DOUT_TEMPR0[46] ), .B(
        \B_DOUT_TEMPR1[46] ), .C(\B_DOUT_TEMPR2[46] ), .D(
        \B_DOUT_TEMPR3[46] ), .Y(B_DOUT[46]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%37%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C37 (.A_DOUT({
        nc1292, nc1293, nc1294, nc1295, nc1296, nc1297, nc1298, nc1299, 
        nc1300, nc1301, nc1302, nc1303, nc1304, nc1305, nc1306, nc1307, 
        nc1308, nc1309, nc1310, \A_DOUT_TEMPR1[37] }), .B_DOUT({nc1311, 
        nc1312, nc1313, nc1314, nc1315, nc1316, nc1317, nc1318, nc1319, 
        nc1320, nc1321, nc1322, nc1323, nc1324, nc1325, nc1326, nc1327, 
        nc1328, nc1329, \B_DOUT_TEMPR1[37] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][37] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[37]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[37]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%16%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C16 (.A_DOUT({
        nc1330, nc1331, nc1332, nc1333, nc1334, nc1335, nc1336, nc1337, 
        nc1338, nc1339, nc1340, nc1341, nc1342, nc1343, nc1344, nc1345, 
        nc1346, nc1347, nc1348, \A_DOUT_TEMPR0[16] }), .B_DOUT({nc1349, 
        nc1350, nc1351, nc1352, nc1353, nc1354, nc1355, nc1356, nc1357, 
        nc1358, nc1359, nc1360, nc1361, nc1362, nc1363, nc1364, nc1365, 
        nc1366, nc1367, \B_DOUT_TEMPR0[16] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][16] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[16]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[16]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[45]  (.A(\A_DOUT_TEMPR0[45] ), .B(
        \A_DOUT_TEMPR1[45] ), .C(\A_DOUT_TEMPR2[45] ), .D(
        \A_DOUT_TEMPR3[45] ), .Y(A_DOUT[45]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%37%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C37 (.A_DOUT({
        nc1368, nc1369, nc1370, nc1371, nc1372, nc1373, nc1374, nc1375, 
        nc1376, nc1377, nc1378, nc1379, nc1380, nc1381, nc1382, nc1383, 
        nc1384, nc1385, nc1386, \A_DOUT_TEMPR2[37] }), .B_DOUT({nc1387, 
        nc1388, nc1389, nc1390, nc1391, nc1392, nc1393, nc1394, nc1395, 
        nc1396, nc1397, nc1398, nc1399, nc1400, nc1401, nc1402, nc1403, 
        nc1404, nc1405, \B_DOUT_TEMPR2[37] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][37] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[37]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[37]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%43%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C43 (.A_DOUT({
        nc1406, nc1407, nc1408, nc1409, nc1410, nc1411, nc1412, nc1413, 
        nc1414, nc1415, nc1416, nc1417, nc1418, nc1419, nc1420, nc1421, 
        nc1422, nc1423, nc1424, \A_DOUT_TEMPR2[43] }), .B_DOUT({nc1425, 
        nc1426, nc1427, nc1428, nc1429, nc1430, nc1431, nc1432, nc1433, 
        nc1434, nc1435, nc1436, nc1437, nc1438, nc1439, nc1440, nc1441, 
        nc1442, nc1443, \B_DOUT_TEMPR2[43] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][43] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[43]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[43]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%40%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C40 (.A_DOUT({
        nc1444, nc1445, nc1446, nc1447, nc1448, nc1449, nc1450, nc1451, 
        nc1452, nc1453, nc1454, nc1455, nc1456, nc1457, nc1458, nc1459, 
        nc1460, nc1461, nc1462, \A_DOUT_TEMPR3[40] }), .B_DOUT({nc1463, 
        nc1464, nc1465, nc1466, nc1467, nc1468, nc1469, nc1470, nc1471, 
        nc1472, nc1473, nc1474, nc1475, nc1476, nc1477, nc1478, nc1479, 
        nc1480, nc1481, \B_DOUT_TEMPR3[40] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][40] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[40]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[40]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[60]  (.A(\B_DOUT_TEMPR0[60] ), .B(
        \B_DOUT_TEMPR1[60] ), .C(\B_DOUT_TEMPR2[60] ), .D(
        \B_DOUT_TEMPR3[60] ), .Y(B_DOUT[60]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%48%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C48 (.A_DOUT({
        nc1482, nc1483, nc1484, nc1485, nc1486, nc1487, nc1488, nc1489, 
        nc1490, nc1491, nc1492, nc1493, nc1494, nc1495, nc1496, nc1497, 
        nc1498, nc1499, nc1500, \A_DOUT_TEMPR3[48] }), .B_DOUT({nc1501, 
        nc1502, nc1503, nc1504, nc1505, nc1506, nc1507, nc1508, nc1509, 
        nc1510, nc1511, nc1512, nc1513, nc1514, nc1515, nc1516, nc1517, 
        nc1518, nc1519, \B_DOUT_TEMPR3[48] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][48] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[48]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[48]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%23%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C23 (.A_DOUT({
        nc1520, nc1521, nc1522, nc1523, nc1524, nc1525, nc1526, nc1527, 
        nc1528, nc1529, nc1530, nc1531, nc1532, nc1533, nc1534, nc1535, 
        nc1536, nc1537, nc1538, \A_DOUT_TEMPR2[23] }), .B_DOUT({nc1539, 
        nc1540, nc1541, nc1542, nc1543, nc1544, nc1545, nc1546, nc1547, 
        nc1548, nc1549, nc1550, nc1551, nc1552, nc1553, nc1554, nc1555, 
        nc1556, nc1557, \B_DOUT_TEMPR2[23] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][23] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[23]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[23]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%20%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C20 (.A_DOUT({
        nc1558, nc1559, nc1560, nc1561, nc1562, nc1563, nc1564, nc1565, 
        nc1566, nc1567, nc1568, nc1569, nc1570, nc1571, nc1572, nc1573, 
        nc1574, nc1575, nc1576, \A_DOUT_TEMPR1[20] }), .B_DOUT({nc1577, 
        nc1578, nc1579, nc1580, nc1581, nc1582, nc1583, nc1584, nc1585, 
        nc1586, nc1587, nc1588, nc1589, nc1590, nc1591, nc1592, nc1593, 
        nc1594, nc1595, \B_DOUT_TEMPR1[20] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][20] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[20]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[20]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%1%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C1 (.A_DOUT({
        nc1596, nc1597, nc1598, nc1599, nc1600, nc1601, nc1602, nc1603, 
        nc1604, nc1605, nc1606, nc1607, nc1608, nc1609, nc1610, nc1611, 
        nc1612, nc1613, nc1614, \A_DOUT_TEMPR0[1] }), .B_DOUT({nc1615, 
        nc1616, nc1617, nc1618, nc1619, nc1620, nc1621, nc1622, nc1623, 
        nc1624, nc1625, nc1626, nc1627, nc1628, nc1629, nc1630, nc1631, 
        nc1632, nc1633, \B_DOUT_TEMPR0[1] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[1]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[1]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%12%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C12 (.A_DOUT({
        nc1634, nc1635, nc1636, nc1637, nc1638, nc1639, nc1640, nc1641, 
        nc1642, nc1643, nc1644, nc1645, nc1646, nc1647, nc1648, nc1649, 
        nc1650, nc1651, nc1652, \A_DOUT_TEMPR0[12] }), .B_DOUT({nc1653, 
        nc1654, nc1655, nc1656, nc1657, nc1658, nc1659, nc1660, nc1661, 
        nc1662, nc1663, nc1664, nc1665, nc1666, nc1667, nc1668, nc1669, 
        nc1670, nc1671, \B_DOUT_TEMPR0[12] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][12] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[12]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[12]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%9%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C9 (.A_DOUT({
        nc1672, nc1673, nc1674, nc1675, nc1676, nc1677, nc1678, nc1679, 
        nc1680, nc1681, nc1682, nc1683, nc1684, nc1685, nc1686, nc1687, 
        nc1688, nc1689, nc1690, \A_DOUT_TEMPR1[9] }), .B_DOUT({nc1691, 
        nc1692, nc1693, nc1694, nc1695, nc1696, nc1697, nc1698, nc1699, 
        nc1700, nc1701, nc1702, nc1703, nc1704, nc1705, nc1706, nc1707, 
        nc1708, nc1709, \B_DOUT_TEMPR1[9] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][9] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[9]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[9]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%28%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C28 (.A_DOUT({
        nc1710, nc1711, nc1712, nc1713, nc1714, nc1715, nc1716, nc1717, 
        nc1718, nc1719, nc1720, nc1721, nc1722, nc1723, nc1724, nc1725, 
        nc1726, nc1727, nc1728, \A_DOUT_TEMPR1[28] }), .B_DOUT({nc1729, 
        nc1730, nc1731, nc1732, nc1733, nc1734, nc1735, nc1736, nc1737, 
        nc1738, nc1739, nc1740, nc1741, nc1742, nc1743, nc1744, nc1745, 
        nc1746, nc1747, \B_DOUT_TEMPR1[28] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][28] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[28]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[28]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%51%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C51 (.A_DOUT({
        nc1748, nc1749, nc1750, nc1751, nc1752, nc1753, nc1754, nc1755, 
        nc1756, nc1757, nc1758, nc1759, nc1760, nc1761, nc1762, nc1763, 
        nc1764, nc1765, nc1766, \A_DOUT_TEMPR0[51] }), .B_DOUT({nc1767, 
        nc1768, nc1769, nc1770, nc1771, nc1772, nc1773, nc1774, nc1775, 
        nc1776, nc1777, nc1778, nc1779, nc1780, nc1781, nc1782, nc1783, 
        nc1784, nc1785, \B_DOUT_TEMPR0[51] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][51] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[51]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[51]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%20%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C20 (.A_DOUT({
        nc1786, nc1787, nc1788, nc1789, nc1790, nc1791, nc1792, nc1793, 
        nc1794, nc1795, nc1796, nc1797, nc1798, nc1799, nc1800, nc1801, 
        nc1802, nc1803, nc1804, \A_DOUT_TEMPR3[20] }), .B_DOUT({nc1805, 
        nc1806, nc1807, nc1808, nc1809, nc1810, nc1811, nc1812, nc1813, 
        nc1814, nc1815, nc1816, nc1817, nc1818, nc1819, nc1820, nc1821, 
        nc1822, nc1823, \B_DOUT_TEMPR3[20] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][20] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[20]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[20]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%28%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C28 (.A_DOUT({
        nc1824, nc1825, nc1826, nc1827, nc1828, nc1829, nc1830, nc1831, 
        nc1832, nc1833, nc1834, nc1835, nc1836, nc1837, nc1838, nc1839, 
        nc1840, nc1841, nc1842, \A_DOUT_TEMPR3[28] }), .B_DOUT({nc1843, 
        nc1844, nc1845, nc1846, nc1847, nc1848, nc1849, nc1850, nc1851, 
        nc1852, nc1853, nc1854, nc1855, nc1856, nc1857, nc1858, nc1859, 
        nc1860, nc1861, \B_DOUT_TEMPR3[28] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][28] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[28]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[28]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[53]  (.A(\B_DOUT_TEMPR0[53] ), .B(
        \B_DOUT_TEMPR1[53] ), .C(\B_DOUT_TEMPR2[53] ), .D(
        \B_DOUT_TEMPR3[53] ), .Y(B_DOUT[53]));
    OR4 \OR4_A_DOUT[60]  (.A(\A_DOUT_TEMPR0[60] ), .B(
        \A_DOUT_TEMPR1[60] ), .C(\A_DOUT_TEMPR2[60] ), .D(
        \A_DOUT_TEMPR3[60] ), .Y(A_DOUT[60]));
    OR4 \OR4_B_DOUT[1]  (.A(\B_DOUT_TEMPR0[1] ), .B(\B_DOUT_TEMPR1[1] )
        , .C(\B_DOUT_TEMPR2[1] ), .D(\B_DOUT_TEMPR3[1] ), .Y(B_DOUT[1])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%55%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C55 (.A_DOUT({
        nc1862, nc1863, nc1864, nc1865, nc1866, nc1867, nc1868, nc1869, 
        nc1870, nc1871, nc1872, nc1873, nc1874, nc1875, nc1876, nc1877, 
        nc1878, nc1879, nc1880, \A_DOUT_TEMPR0[55] }), .B_DOUT({nc1881, 
        nc1882, nc1883, nc1884, nc1885, nc1886, nc1887, nc1888, nc1889, 
        nc1890, nc1891, nc1892, nc1893, nc1894, nc1895, nc1896, nc1897, 
        nc1898, nc1899, \B_DOUT_TEMPR0[55] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][55] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[55]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[55]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%27%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C27 (.A_DOUT({
        nc1900, nc1901, nc1902, nc1903, nc1904, nc1905, nc1906, nc1907, 
        nc1908, nc1909, nc1910, nc1911, nc1912, nc1913, nc1914, nc1915, 
        nc1916, nc1917, nc1918, \A_DOUT_TEMPR0[27] }), .B_DOUT({nc1919, 
        nc1920, nc1921, nc1922, nc1923, nc1924, nc1925, nc1926, nc1927, 
        nc1928, nc1929, nc1930, nc1931, nc1932, nc1933, nc1934, nc1935, 
        nc1936, nc1937, \B_DOUT_TEMPR0[27] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][27] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[27]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[27]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%56%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C56 (.A_DOUT({
        nc1938, nc1939, nc1940, nc1941, nc1942, nc1943, nc1944, nc1945, 
        nc1946, nc1947, nc1948, nc1949, nc1950, nc1951, nc1952, nc1953, 
        nc1954, nc1955, nc1956, \A_DOUT_TEMPR0[56] }), .B_DOUT({nc1957, 
        nc1958, nc1959, nc1960, nc1961, nc1962, nc1963, nc1964, nc1965, 
        nc1966, nc1967, nc1968, nc1969, nc1970, nc1971, nc1972, nc1973, 
        nc1974, nc1975, \B_DOUT_TEMPR0[56] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][56] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[56]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[56]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[39]  (.A(\B_DOUT_TEMPR0[39] ), .B(
        \B_DOUT_TEMPR1[39] ), .C(\B_DOUT_TEMPR2[39] ), .D(
        \B_DOUT_TEMPR3[39] ), .Y(B_DOUT[39]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%51%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C51 (.A_DOUT({
        nc1976, nc1977, nc1978, nc1979, nc1980, nc1981, nc1982, nc1983, 
        nc1984, nc1985, nc1986, nc1987, nc1988, nc1989, nc1990, nc1991, 
        nc1992, nc1993, nc1994, \A_DOUT_TEMPR1[51] }), .B_DOUT({nc1995, 
        nc1996, nc1997, nc1998, nc1999, nc2000, nc2001, nc2002, nc2003, 
        nc2004, nc2005, nc2006, nc2007, nc2008, nc2009, nc2010, nc2011, 
        nc2012, nc2013, \B_DOUT_TEMPR1[51] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][51] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[51]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[51]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%17%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C17 (.A_DOUT({
        nc2014, nc2015, nc2016, nc2017, nc2018, nc2019, nc2020, nc2021, 
        nc2022, nc2023, nc2024, nc2025, nc2026, nc2027, nc2028, nc2029, 
        nc2030, nc2031, nc2032, \A_DOUT_TEMPR1[17] }), .B_DOUT({nc2033, 
        nc2034, nc2035, nc2036, nc2037, nc2038, nc2039, nc2040, nc2041, 
        nc2042, nc2043, nc2044, nc2045, nc2046, nc2047, nc2048, nc2049, 
        nc2050, nc2051, \B_DOUT_TEMPR1[17] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][17] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[17]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[17]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[43]  (.A(\B_DOUT_TEMPR0[43] ), .B(
        \B_DOUT_TEMPR1[43] ), .C(\B_DOUT_TEMPR2[43] ), .D(
        \B_DOUT_TEMPR3[43] ), .Y(B_DOUT[43]));
    OR4 \OR4_B_DOUT[38]  (.A(\B_DOUT_TEMPR0[38] ), .B(
        \B_DOUT_TEMPR1[38] ), .C(\B_DOUT_TEMPR2[38] ), .D(
        \B_DOUT_TEMPR3[38] ), .Y(B_DOUT[38]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%13%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C13 (.A_DOUT({
        nc2052, nc2053, nc2054, nc2055, nc2056, nc2057, nc2058, nc2059, 
        nc2060, nc2061, nc2062, nc2063, nc2064, nc2065, nc2066, nc2067, 
        nc2068, nc2069, nc2070, \A_DOUT_TEMPR0[13] }), .B_DOUT({nc2071, 
        nc2072, nc2073, nc2074, nc2075, nc2076, nc2077, nc2078, nc2079, 
        nc2080, nc2081, nc2082, nc2083, nc2084, nc2085, nc2086, nc2087, 
        nc2088, nc2089, \B_DOUT_TEMPR0[13] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][13] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[13]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[13]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%5%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C5 (.A_DOUT({
        nc2090, nc2091, nc2092, nc2093, nc2094, nc2095, nc2096, nc2097, 
        nc2098, nc2099, nc2100, nc2101, nc2102, nc2103, nc2104, nc2105, 
        nc2106, nc2107, nc2108, \A_DOUT_TEMPR0[5] }), .B_DOUT({nc2109, 
        nc2110, nc2111, nc2112, nc2113, nc2114, nc2115, nc2116, nc2117, 
        nc2118, nc2119, nc2120, nc2121, nc2122, nc2123, nc2124, nc2125, 
        nc2126, nc2127, \B_DOUT_TEMPR0[5] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[5]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[5]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%60%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C60 (.A_DOUT({
        nc2128, nc2129, nc2130, nc2131, nc2132, nc2133, nc2134, nc2135, 
        nc2136, nc2137, nc2138, nc2139, nc2140, nc2141, nc2142, nc2143, 
        nc2144, nc2145, nc2146, \A_DOUT_TEMPR1[60] }), .B_DOUT({nc2147, 
        nc2148, nc2149, nc2150, nc2151, nc2152, nc2153, nc2154, nc2155, 
        nc2156, nc2157, nc2158, nc2159, nc2160, nc2161, nc2162, nc2163, 
        nc2164, nc2165, \B_DOUT_TEMPR1[60] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][60] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[60]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[60]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%52%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C52 (.A_DOUT({
        nc2166, nc2167, nc2168, nc2169, nc2170, nc2171, nc2172, nc2173, 
        nc2174, nc2175, nc2176, nc2177, nc2178, nc2179, nc2180, nc2181, 
        nc2182, nc2183, nc2184, \A_DOUT_TEMPR0[52] }), .B_DOUT({nc2185, 
        nc2186, nc2187, nc2188, nc2189, nc2190, nc2191, nc2192, nc2193, 
        nc2194, nc2195, nc2196, nc2197, nc2198, nc2199, nc2200, nc2201, 
        nc2202, nc2203, \B_DOUT_TEMPR0[52] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][52] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[52]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[52]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%51%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C51 (.A_DOUT({
        nc2204, nc2205, nc2206, nc2207, nc2208, nc2209, nc2210, nc2211, 
        nc2212, nc2213, nc2214, nc2215, nc2216, nc2217, nc2218, nc2219, 
        nc2220, nc2221, nc2222, \A_DOUT_TEMPR2[51] }), .B_DOUT({nc2223, 
        nc2224, nc2225, nc2226, nc2227, nc2228, nc2229, nc2230, nc2231, 
        nc2232, nc2233, nc2234, nc2235, nc2236, nc2237, nc2238, nc2239, 
        nc2240, nc2241, \B_DOUT_TEMPR2[51] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][51] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[51]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[51]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[5]  (.A(\B_DOUT_TEMPR0[5] ), .B(\B_DOUT_TEMPR1[5] )
        , .C(\B_DOUT_TEMPR2[5] ), .D(\B_DOUT_TEMPR3[5] ), .Y(B_DOUT[5])
        );
    OR4 \OR4_B_DOUT[37]  (.A(\B_DOUT_TEMPR0[37] ), .B(
        \B_DOUT_TEMPR1[37] ), .C(\B_DOUT_TEMPR2[37] ), .D(
        \B_DOUT_TEMPR3[37] ), .Y(B_DOUT[37]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%55%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C55 (.A_DOUT({
        nc2242, nc2243, nc2244, nc2245, nc2246, nc2247, nc2248, nc2249, 
        nc2250, nc2251, nc2252, nc2253, nc2254, nc2255, nc2256, nc2257, 
        nc2258, nc2259, nc2260, \A_DOUT_TEMPR1[55] }), .B_DOUT({nc2261, 
        nc2262, nc2263, nc2264, nc2265, nc2266, nc2267, nc2268, nc2269, 
        nc2270, nc2271, nc2272, nc2273, nc2274, nc2275, nc2276, nc2277, 
        nc2278, nc2279, \B_DOUT_TEMPR1[55] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][55] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[55]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[55]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%56%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C56 (.A_DOUT({
        nc2280, nc2281, nc2282, nc2283, nc2284, nc2285, nc2286, nc2287, 
        nc2288, nc2289, nc2290, nc2291, nc2292, nc2293, nc2294, nc2295, 
        nc2296, nc2297, nc2298, \A_DOUT_TEMPR1[56] }), .B_DOUT({nc2299, 
        nc2300, nc2301, nc2302, nc2303, nc2304, nc2305, nc2306, nc2307, 
        nc2308, nc2309, nc2310, nc2311, nc2312, nc2313, nc2314, nc2315, 
        nc2316, nc2317, \B_DOUT_TEMPR1[56] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][56] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[56]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[56]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%34%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C34 (.A_DOUT({
        nc2318, nc2319, nc2320, nc2321, nc2322, nc2323, nc2324, nc2325, 
        nc2326, nc2327, nc2328, nc2329, nc2330, nc2331, nc2332, nc2333, 
        nc2334, nc2335, nc2336, \A_DOUT_TEMPR3[34] }), .B_DOUT({nc2337, 
        nc2338, nc2339, nc2340, nc2341, nc2342, nc2343, nc2344, nc2345, 
        nc2346, nc2347, nc2348, nc2349, nc2350, nc2351, nc2352, nc2353, 
        nc2354, nc2355, \B_DOUT_TEMPR3[34] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][34] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[34]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[34]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%55%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C55 (.A_DOUT({
        nc2356, nc2357, nc2358, nc2359, nc2360, nc2361, nc2362, nc2363, 
        nc2364, nc2365, nc2366, nc2367, nc2368, nc2369, nc2370, nc2371, 
        nc2372, nc2373, nc2374, \A_DOUT_TEMPR2[55] }), .B_DOUT({nc2375, 
        nc2376, nc2377, nc2378, nc2379, nc2380, nc2381, nc2382, nc2383, 
        nc2384, nc2385, nc2386, nc2387, nc2388, nc2389, nc2390, nc2391, 
        nc2392, nc2393, \B_DOUT_TEMPR2[55] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][55] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[55]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[55]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[32]  (.A(\A_DOUT_TEMPR0[32] ), .B(
        \A_DOUT_TEMPR1[32] ), .C(\A_DOUT_TEMPR2[32] ), .D(
        \A_DOUT_TEMPR3[32] ), .Y(A_DOUT[32]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%56%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C56 (.A_DOUT({
        nc2394, nc2395, nc2396, nc2397, nc2398, nc2399, nc2400, nc2401, 
        nc2402, nc2403, nc2404, nc2405, nc2406, nc2407, nc2408, nc2409, 
        nc2410, nc2411, nc2412, \A_DOUT_TEMPR2[56] }), .B_DOUT({nc2413, 
        nc2414, nc2415, nc2416, nc2417, nc2418, nc2419, nc2420, nc2421, 
        nc2422, nc2423, nc2424, nc2425, nc2426, nc2427, nc2428, nc2429, 
        nc2430, nc2431, \B_DOUT_TEMPR2[56] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][56] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[56]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[56]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[19]  (.A(\B_DOUT_TEMPR0[19] ), .B(
        \B_DOUT_TEMPR1[19] ), .C(\B_DOUT_TEMPR2[19] ), .D(
        \B_DOUT_TEMPR3[19] ), .Y(B_DOUT[19]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%5%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C5 (.A_DOUT({
        nc2432, nc2433, nc2434, nc2435, nc2436, nc2437, nc2438, nc2439, 
        nc2440, nc2441, nc2442, nc2443, nc2444, nc2445, nc2446, nc2447, 
        nc2448, nc2449, nc2450, \A_DOUT_TEMPR1[5] }), .B_DOUT({nc2451, 
        nc2452, nc2453, nc2454, nc2455, nc2456, nc2457, nc2458, nc2459, 
        nc2460, nc2461, nc2462, nc2463, nc2464, nc2465, nc2466, nc2467, 
        nc2468, nc2469, \B_DOUT_TEMPR1[5] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][5] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[5]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[5]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%40%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C40 (.A_DOUT({
        nc2470, nc2471, nc2472, nc2473, nc2474, nc2475, nc2476, nc2477, 
        nc2478, nc2479, nc2480, nc2481, nc2482, nc2483, nc2484, nc2485, 
        nc2486, nc2487, nc2488, \A_DOUT_TEMPR2[40] }), .B_DOUT({nc2489, 
        nc2490, nc2491, nc2492, nc2493, nc2494, nc2495, nc2496, nc2497, 
        nc2498, nc2499, nc2500, nc2501, nc2502, nc2503, nc2504, nc2505, 
        nc2506, nc2507, \B_DOUT_TEMPR2[40] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][40] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[40]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[40]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%52%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C52 (.A_DOUT({
        nc2508, nc2509, nc2510, nc2511, nc2512, nc2513, nc2514, nc2515, 
        nc2516, nc2517, nc2518, nc2519, nc2520, nc2521, nc2522, nc2523, 
        nc2524, nc2525, nc2526, \A_DOUT_TEMPR1[52] }), .B_DOUT({nc2527, 
        nc2528, nc2529, nc2530, nc2531, nc2532, nc2533, nc2534, nc2535, 
        nc2536, nc2537, nc2538, nc2539, nc2540, nc2541, nc2542, nc2543, 
        nc2544, nc2545, \B_DOUT_TEMPR1[52] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][52] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[52]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[52]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%48%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C48 (.A_DOUT({
        nc2546, nc2547, nc2548, nc2549, nc2550, nc2551, nc2552, nc2553, 
        nc2554, nc2555, nc2556, nc2557, nc2558, nc2559, nc2560, nc2561, 
        nc2562, nc2563, nc2564, \A_DOUT_TEMPR2[48] }), .B_DOUT({nc2565, 
        nc2566, nc2567, nc2568, nc2569, nc2570, nc2571, nc2572, nc2573, 
        nc2574, nc2575, nc2576, nc2577, nc2578, nc2579, nc2580, nc2581, 
        nc2582, nc2583, \B_DOUT_TEMPR2[48] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][48] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[48]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[48]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%47%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C47 (.A_DOUT({
        nc2584, nc2585, nc2586, nc2587, nc2588, nc2589, nc2590, nc2591, 
        nc2592, nc2593, nc2594, nc2595, nc2596, nc2597, nc2598, nc2599, 
        nc2600, nc2601, nc2602, \A_DOUT_TEMPR3[47] }), .B_DOUT({nc2603, 
        nc2604, nc2605, nc2606, nc2607, nc2608, nc2609, nc2610, nc2611, 
        nc2612, nc2613, nc2614, nc2615, nc2616, nc2617, nc2618, nc2619, 
        nc2620, nc2621, \B_DOUT_TEMPR3[47] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][47] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[47]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[47]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[18]  (.A(\B_DOUT_TEMPR0[18] ), .B(
        \B_DOUT_TEMPR1[18] ), .C(\B_DOUT_TEMPR2[18] ), .D(
        \B_DOUT_TEMPR3[18] ), .Y(B_DOUT[18]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%20%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C20 (.A_DOUT({
        nc2622, nc2623, nc2624, nc2625, nc2626, nc2627, nc2628, nc2629, 
        nc2630, nc2631, nc2632, nc2633, nc2634, nc2635, nc2636, nc2637, 
        nc2638, nc2639, nc2640, \A_DOUT_TEMPR2[20] }), .B_DOUT({nc2641, 
        nc2642, nc2643, nc2644, nc2645, nc2646, nc2647, nc2648, nc2649, 
        nc2650, nc2651, nc2652, nc2653, nc2654, nc2655, nc2656, nc2657, 
        nc2658, nc2659, \B_DOUT_TEMPR2[20] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][20] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[20]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[20]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%27%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C27 (.A_DOUT({
        nc2660, nc2661, nc2662, nc2663, nc2664, nc2665, nc2666, nc2667, 
        nc2668, nc2669, nc2670, nc2671, nc2672, nc2673, nc2674, nc2675, 
        nc2676, nc2677, nc2678, \A_DOUT_TEMPR1[27] }), .B_DOUT({nc2679, 
        nc2680, nc2681, nc2682, nc2683, nc2684, nc2685, nc2686, nc2687, 
        nc2688, nc2689, nc2690, nc2691, nc2692, nc2693, nc2694, nc2695, 
        nc2696, nc2697, \B_DOUT_TEMPR1[27] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][27] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[27]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[27]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%28%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C28 (.A_DOUT({
        nc2698, nc2699, nc2700, nc2701, nc2702, nc2703, nc2704, nc2705, 
        nc2706, nc2707, nc2708, nc2709, nc2710, nc2711, nc2712, nc2713, 
        nc2714, nc2715, nc2716, \A_DOUT_TEMPR2[28] }), .B_DOUT({nc2717, 
        nc2718, nc2719, nc2720, nc2721, nc2722, nc2723, nc2724, nc2725, 
        nc2726, nc2727, nc2728, nc2729, nc2730, nc2731, nc2732, nc2733, 
        nc2734, nc2735, \B_DOUT_TEMPR2[28] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][28] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[28]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[28]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%53%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C53 (.A_DOUT({
        nc2736, nc2737, nc2738, nc2739, nc2740, nc2741, nc2742, nc2743, 
        nc2744, nc2745, nc2746, nc2747, nc2748, nc2749, nc2750, nc2751, 
        nc2752, nc2753, nc2754, \A_DOUT_TEMPR0[53] }), .B_DOUT({nc2755, 
        nc2756, nc2757, nc2758, nc2759, nc2760, nc2761, nc2762, nc2763, 
        nc2764, nc2765, nc2766, nc2767, nc2768, nc2769, nc2770, nc2771, 
        nc2772, nc2773, \B_DOUT_TEMPR0[53] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][53] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[53]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[53]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%5%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C5 (.A_DOUT({
        nc2774, nc2775, nc2776, nc2777, nc2778, nc2779, nc2780, nc2781, 
        nc2782, nc2783, nc2784, nc2785, nc2786, nc2787, nc2788, nc2789, 
        nc2790, nc2791, nc2792, \A_DOUT_TEMPR2[5] }), .B_DOUT({nc2793, 
        nc2794, nc2795, nc2796, nc2797, nc2798, nc2799, nc2800, nc2801, 
        nc2802, nc2803, nc2804, nc2805, nc2806, nc2807, nc2808, nc2809, 
        nc2810, nc2811, \B_DOUT_TEMPR2[5] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][5] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[5]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[5]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%27%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C27 (.A_DOUT({
        nc2812, nc2813, nc2814, nc2815, nc2816, nc2817, nc2818, nc2819, 
        nc2820, nc2821, nc2822, nc2823, nc2824, nc2825, nc2826, nc2827, 
        nc2828, nc2829, nc2830, \A_DOUT_TEMPR3[27] }), .B_DOUT({nc2831, 
        nc2832, nc2833, nc2834, nc2835, nc2836, nc2837, nc2838, nc2839, 
        nc2840, nc2841, nc2842, nc2843, nc2844, nc2845, nc2846, nc2847, 
        nc2848, nc2849, \B_DOUT_TEMPR3[27] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][27] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[27]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[27]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[26]  (.A(\B_DOUT_TEMPR0[26] ), .B(
        \B_DOUT_TEMPR1[26] ), .C(\B_DOUT_TEMPR2[26] ), .D(
        \B_DOUT_TEMPR3[26] ), .Y(B_DOUT[26]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%52%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C52 (.A_DOUT({
        nc2850, nc2851, nc2852, nc2853, nc2854, nc2855, nc2856, nc2857, 
        nc2858, nc2859, nc2860, nc2861, nc2862, nc2863, nc2864, nc2865, 
        nc2866, nc2867, nc2868, \A_DOUT_TEMPR2[52] }), .B_DOUT({nc2869, 
        nc2870, nc2871, nc2872, nc2873, nc2874, nc2875, nc2876, nc2877, 
        nc2878, nc2879, nc2880, nc2881, nc2882, nc2883, nc2884, nc2885, 
        nc2886, nc2887, \B_DOUT_TEMPR2[52] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][52] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[52]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[52]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[17]  (.A(\B_DOUT_TEMPR0[17] ), .B(
        \B_DOUT_TEMPR1[17] ), .C(\B_DOUT_TEMPR2[17] ), .D(
        \B_DOUT_TEMPR3[17] ), .Y(B_DOUT[17]));
    OR4 \OR4_B_DOUT[3]  (.A(\B_DOUT_TEMPR0[3] ), .B(\B_DOUT_TEMPR1[3] )
        , .C(\B_DOUT_TEMPR2[3] ), .D(\B_DOUT_TEMPR3[3] ), .Y(B_DOUT[3])
        );
    OR4 \OR4_A_DOUT[25]  (.A(\A_DOUT_TEMPR0[25] ), .B(
        \A_DOUT_TEMPR1[25] ), .C(\A_DOUT_TEMPR2[25] ), .D(
        \A_DOUT_TEMPR3[25] ), .Y(A_DOUT[25]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%14%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C14 (.A_DOUT({
        nc2888, nc2889, nc2890, nc2891, nc2892, nc2893, nc2894, nc2895, 
        nc2896, nc2897, nc2898, nc2899, nc2900, nc2901, nc2902, nc2903, 
        nc2904, nc2905, nc2906, \A_DOUT_TEMPR2[14] }), .B_DOUT({nc2907, 
        nc2908, nc2909, nc2910, nc2911, nc2912, nc2913, nc2914, nc2915, 
        nc2916, nc2917, nc2918, nc2919, nc2920, nc2921, nc2922, nc2923, 
        nc2924, nc2925, \B_DOUT_TEMPR2[14] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][14] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[14]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[14]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%34%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C34 (.A_DOUT({
        nc2926, nc2927, nc2928, nc2929, nc2930, nc2931, nc2932, nc2933, 
        nc2934, nc2935, nc2936, nc2937, nc2938, nc2939, nc2940, nc2941, 
        nc2942, nc2943, nc2944, \A_DOUT_TEMPR0[34] }), .B_DOUT({nc2945, 
        nc2946, nc2947, nc2948, nc2949, nc2950, nc2951, nc2952, nc2953, 
        nc2954, nc2955, nc2956, nc2957, nc2958, nc2959, nc2960, nc2961, 
        nc2962, nc2963, \B_DOUT_TEMPR0[34] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][34] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[34]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[34]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[51]  (.A(\A_DOUT_TEMPR0[51] ), .B(
        \A_DOUT_TEMPR1[51] ), .C(\A_DOUT_TEMPR2[51] ), .D(
        \A_DOUT_TEMPR3[51] ), .Y(A_DOUT[51]));
    OR4 \OR4_A_DOUT[12]  (.A(\A_DOUT_TEMPR0[12] ), .B(
        \A_DOUT_TEMPR1[12] ), .C(\A_DOUT_TEMPR2[12] ), .D(
        \A_DOUT_TEMPR3[12] ), .Y(A_DOUT[12]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%53%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C53 (.A_DOUT({
        nc2964, nc2965, nc2966, nc2967, nc2968, nc2969, nc2970, nc2971, 
        nc2972, nc2973, nc2974, nc2975, nc2976, nc2977, nc2978, nc2979, 
        nc2980, nc2981, nc2982, \A_DOUT_TEMPR1[53] }), .B_DOUT({nc2983, 
        nc2984, nc2985, nc2986, nc2987, nc2988, nc2989, nc2990, nc2991, 
        nc2992, nc2993, nc2994, nc2995, nc2996, nc2997, nc2998, nc2999, 
        nc3000, nc3001, \B_DOUT_TEMPR1[53] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][53] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[53]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[53]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%10%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C10 (.A_DOUT({
        nc3002, nc3003, nc3004, nc3005, nc3006, nc3007, nc3008, nc3009, 
        nc3010, nc3011, nc3012, nc3013, nc3014, nc3015, nc3016, nc3017, 
        nc3018, nc3019, nc3020, \A_DOUT_TEMPR0[10] }), .B_DOUT({nc3021, 
        nc3022, nc3023, nc3024, nc3025, nc3026, nc3027, nc3028, nc3029, 
        nc3030, nc3031, nc3032, nc3033, nc3034, nc3035, nc3036, nc3037, 
        nc3038, nc3039, \B_DOUT_TEMPR0[10] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[10]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[10]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%18%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C18 (.A_DOUT({
        nc3040, nc3041, nc3042, nc3043, nc3044, nc3045, nc3046, nc3047, 
        nc3048, nc3049, nc3050, nc3051, nc3052, nc3053, nc3054, nc3055, 
        nc3056, nc3057, nc3058, \A_DOUT_TEMPR0[18] }), .B_DOUT({nc3059, 
        nc3060, nc3061, nc3062, nc3063, nc3064, nc3065, nc3066, nc3067, 
        nc3068, nc3069, nc3070, nc3071, nc3072, nc3073, nc3074, nc3075, 
        nc3076, nc3077, \B_DOUT_TEMPR0[18] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][18] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[18]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[18]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[41]  (.A(\A_DOUT_TEMPR0[41] ), .B(
        \A_DOUT_TEMPR1[41] ), .C(\A_DOUT_TEMPR2[41] ), .D(
        \A_DOUT_TEMPR3[41] ), .Y(A_DOUT[41]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%53%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C53 (.A_DOUT({
        nc3078, nc3079, nc3080, nc3081, nc3082, nc3083, nc3084, nc3085, 
        nc3086, nc3087, nc3088, nc3089, nc3090, nc3091, nc3092, nc3093, 
        nc3094, nc3095, nc3096, \A_DOUT_TEMPR2[53] }), .B_DOUT({nc3097, 
        nc3098, nc3099, nc3100, nc3101, nc3102, nc3103, nc3104, nc3105, 
        nc3106, nc3107, nc3108, nc3109, nc3110, nc3111, nc3112, nc3113, 
        nc3114, nc3115, \B_DOUT_TEMPR2[53] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][53] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[53]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[53]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%54%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C54 (.A_DOUT({
        nc3116, nc3117, nc3118, nc3119, nc3120, nc3121, nc3122, nc3123, 
        nc3124, nc3125, nc3126, nc3127, nc3128, nc3129, nc3130, nc3131, 
        nc3132, nc3133, nc3134, \A_DOUT_TEMPR3[54] }), .B_DOUT({nc3135, 
        nc3136, nc3137, nc3138, nc3139, nc3140, nc3141, nc3142, nc3143, 
        nc3144, nc3145, nc3146, nc3147, nc3148, nc3149, nc3150, nc3151, 
        nc3152, nc3153, \B_DOUT_TEMPR3[54] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][54] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[54]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[54]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%39%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C39 (.A_DOUT({
        nc3154, nc3155, nc3156, nc3157, nc3158, nc3159, nc3160, nc3161, 
        nc3162, nc3163, nc3164, nc3165, nc3166, nc3167, nc3168, nc3169, 
        nc3170, nc3171, nc3172, \A_DOUT_TEMPR3[39] }), .B_DOUT({nc3173, 
        nc3174, nc3175, nc3176, nc3177, nc3178, nc3179, nc3180, nc3181, 
        nc3182, nc3183, nc3184, nc3185, nc3186, nc3187, nc3188, nc3189, 
        nc3190, nc3191, \B_DOUT_TEMPR3[39] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][39] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[39]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[39]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[50]  (.A(\B_DOUT_TEMPR0[50] ), .B(
        \B_DOUT_TEMPR1[50] ), .C(\B_DOUT_TEMPR2[50] ), .D(
        \B_DOUT_TEMPR3[50] ), .Y(B_DOUT[50]));
    OR4 \OR4_B_DOUT[23]  (.A(\B_DOUT_TEMPR0[23] ), .B(
        \B_DOUT_TEMPR1[23] ), .C(\B_DOUT_TEMPR2[23] ), .D(
        \B_DOUT_TEMPR3[23] ), .Y(B_DOUT[23]));
    OR4 \OR4_B_DOUT[61]  (.A(\B_DOUT_TEMPR0[61] ), .B(
        \B_DOUT_TEMPR1[61] ), .C(\B_DOUT_TEMPR2[61] ), .D(
        \B_DOUT_TEMPR3[61] ), .Y(B_DOUT[61]));
    OR4 \OR4_A_DOUT[4]  (.A(\A_DOUT_TEMPR0[4] ), .B(\A_DOUT_TEMPR1[4] )
        , .C(\A_DOUT_TEMPR2[4] ), .D(\A_DOUT_TEMPR3[4] ), .Y(A_DOUT[4])
        );
    OR4 \OR4_A_DOUT[8]  (.A(\A_DOUT_TEMPR0[8] ), .B(\A_DOUT_TEMPR1[8] )
        , .C(\A_DOUT_TEMPR2[8] ), .D(\A_DOUT_TEMPR3[8] ), .Y(A_DOUT[8])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%0%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C0 (.A_DOUT({
        nc3192, nc3193, nc3194, nc3195, nc3196, nc3197, nc3198, nc3199, 
        nc3200, nc3201, nc3202, nc3203, nc3204, nc3205, nc3206, nc3207, 
        nc3208, nc3209, nc3210, \A_DOUT_TEMPR0[0] }), .B_DOUT({nc3211, 
        nc3212, nc3213, nc3214, nc3215, nc3216, nc3217, nc3218, nc3219, 
        nc3220, nc3221, nc3222, nc3223, nc3224, nc3225, nc3226, nc3227, 
        nc3228, nc3229, \B_DOUT_TEMPR0[0] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[0]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[0]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%8%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C8 (.A_DOUT({
        nc3230, nc3231, nc3232, nc3233, nc3234, nc3235, nc3236, nc3237, 
        nc3238, nc3239, nc3240, nc3241, nc3242, nc3243, nc3244, nc3245, 
        nc3246, nc3247, nc3248, \A_DOUT_TEMPR3[8] }), .B_DOUT({nc3249, 
        nc3250, nc3251, nc3252, nc3253, nc3254, nc3255, nc3256, nc3257, 
        nc3258, nc3259, nc3260, nc3261, nc3262, nc3263, nc3264, nc3265, 
        nc3266, nc3267, \B_DOUT_TEMPR3[8] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][8] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[8]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[8]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[62]  (.A(\B_DOUT_TEMPR0[62] ), .B(
        \B_DOUT_TEMPR1[62] ), .C(\B_DOUT_TEMPR2[62] ), .D(
        \B_DOUT_TEMPR3[62] ), .Y(B_DOUT[62]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%47%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C47 (.A_DOUT({
        nc3268, nc3269, nc3270, nc3271, nc3272, nc3273, nc3274, nc3275, 
        nc3276, nc3277, nc3278, nc3279, nc3280, nc3281, nc3282, nc3283, 
        nc3284, nc3285, nc3286, \A_DOUT_TEMPR2[47] }), .B_DOUT({nc3287, 
        nc3288, nc3289, nc3290, nc3291, nc3292, nc3293, nc3294, nc3295, 
        nc3296, nc3297, nc3298, nc3299, nc3300, nc3301, nc3302, nc3303, 
        nc3304, nc3305, \B_DOUT_TEMPR2[47] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][47] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[47]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[47]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%41%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C41 (.A_DOUT({
        nc3306, nc3307, nc3308, nc3309, nc3310, nc3311, nc3312, nc3313, 
        nc3314, nc3315, nc3316, nc3317, nc3318, nc3319, nc3320, nc3321, 
        nc3322, nc3323, nc3324, \A_DOUT_TEMPR1[41] }), .B_DOUT({nc3325, 
        nc3326, nc3327, nc3328, nc3329, nc3330, nc3331, nc3332, nc3333, 
        nc3334, nc3335, nc3336, nc3337, nc3338, nc3339, nc3340, nc3341, 
        nc3342, nc3343, \B_DOUT_TEMPR1[41] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][41] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[41]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[41]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[50]  (.A(\A_DOUT_TEMPR0[50] ), .B(
        \A_DOUT_TEMPR1[50] ), .C(\A_DOUT_TEMPR2[50] ), .D(
        \A_DOUT_TEMPR3[50] ), .Y(A_DOUT[50]));
    OR4 \OR4_B_DOUT[40]  (.A(\B_DOUT_TEMPR0[40] ), .B(
        \B_DOUT_TEMPR1[40] ), .C(\B_DOUT_TEMPR2[40] ), .D(
        \B_DOUT_TEMPR3[40] ), .Y(B_DOUT[40]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%27%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C27 (.A_DOUT({
        nc3344, nc3345, nc3346, nc3347, nc3348, nc3349, nc3350, nc3351, 
        nc3352, nc3353, nc3354, nc3355, nc3356, nc3357, nc3358, nc3359, 
        nc3360, nc3361, nc3362, \A_DOUT_TEMPR2[27] }), .B_DOUT({nc3363, 
        nc3364, nc3365, nc3366, nc3367, nc3368, nc3369, nc3370, nc3371, 
        nc3372, nc3373, nc3374, nc3375, nc3376, nc3377, nc3378, nc3379, 
        nc3380, nc3381, \B_DOUT_TEMPR2[27] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][27] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[27]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[27]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%19%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C19 (.A_DOUT({
        nc3382, nc3383, nc3384, nc3385, nc3386, nc3387, nc3388, nc3389, 
        nc3390, nc3391, nc3392, nc3393, nc3394, nc3395, nc3396, nc3397, 
        nc3398, nc3399, nc3400, \A_DOUT_TEMPR2[19] }), .B_DOUT({nc3401, 
        nc3402, nc3403, nc3404, nc3405, nc3406, nc3407, nc3408, nc3409, 
        nc3410, nc3411, nc3412, nc3413, nc3414, nc3415, nc3416, nc3417, 
        nc3418, nc3419, \B_DOUT_TEMPR2[19] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][19] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[19]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[19]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%39%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C39 (.A_DOUT({
        nc3420, nc3421, nc3422, nc3423, nc3424, nc3425, nc3426, nc3427, 
        nc3428, nc3429, nc3430, nc3431, nc3432, nc3433, nc3434, nc3435, 
        nc3436, nc3437, nc3438, \A_DOUT_TEMPR0[39] }), .B_DOUT({nc3439, 
        nc3440, nc3441, nc3442, nc3443, nc3444, nc3445, nc3446, nc3447, 
        nc3448, nc3449, nc3450, nc3451, nc3452, nc3453, nc3454, nc3455, 
        nc3456, nc3457, \B_DOUT_TEMPR0[39] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][39] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[39]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[39]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%50%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C50 (.A_DOUT({
        nc3458, nc3459, nc3460, nc3461, nc3462, nc3463, nc3464, nc3465, 
        nc3466, nc3467, nc3468, nc3469, nc3470, nc3471, nc3472, nc3473, 
        nc3474, nc3475, nc3476, \A_DOUT_TEMPR0[50] }), .B_DOUT({nc3477, 
        nc3478, nc3479, nc3480, nc3481, nc3482, nc3483, nc3484, nc3485, 
        nc3486, nc3487, nc3488, nc3489, nc3490, nc3491, nc3492, nc3493, 
        nc3494, nc3495, \B_DOUT_TEMPR0[50] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][50] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[50]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[50]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%58%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C58 (.A_DOUT({
        nc3496, nc3497, nc3498, nc3499, nc3500, nc3501, nc3502, nc3503, 
        nc3504, nc3505, nc3506, nc3507, nc3508, nc3509, nc3510, nc3511, 
        nc3512, nc3513, nc3514, \A_DOUT_TEMPR0[58] }), .B_DOUT({nc3515, 
        nc3516, nc3517, nc3518, nc3519, nc3520, nc3521, nc3522, nc3523, 
        nc3524, nc3525, nc3526, nc3527, nc3528, nc3529, nc3530, nc3531, 
        nc3532, nc3533, \B_DOUT_TEMPR0[58] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][58] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[58]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[58]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%9%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C9 (.A_DOUT({
        nc3534, nc3535, nc3536, nc3537, nc3538, nc3539, nc3540, nc3541, 
        nc3542, nc3543, nc3544, nc3545, nc3546, nc3547, nc3548, nc3549, 
        nc3550, nc3551, nc3552, \A_DOUT_TEMPR3[9] }), .B_DOUT({nc3553, 
        nc3554, nc3555, nc3556, nc3557, nc3558, nc3559, nc3560, nc3561, 
        nc3562, nc3563, nc3564, nc3565, nc3566, nc3567, nc3568, nc3569, 
        nc3570, nc3571, \B_DOUT_TEMPR3[9] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][9] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[9]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[9]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[36]  (.A(\B_DOUT_TEMPR0[36] ), .B(
        \B_DOUT_TEMPR1[36] ), .C(\B_DOUT_TEMPR2[36] ), .D(
        \B_DOUT_TEMPR3[36] ), .Y(B_DOUT[36]));
    OR4 \OR4_B_DOUT[55]  (.A(\B_DOUT_TEMPR0[55] ), .B(
        \B_DOUT_TEMPR1[55] ), .C(\B_DOUT_TEMPR2[55] ), .D(
        \B_DOUT_TEMPR3[55] ), .Y(B_DOUT[55]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%45%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C45 (.A_DOUT({
        nc3572, nc3573, nc3574, nc3575, nc3576, nc3577, nc3578, nc3579, 
        nc3580, nc3581, nc3582, nc3583, nc3584, nc3585, nc3586, nc3587, 
        nc3588, nc3589, nc3590, \A_DOUT_TEMPR1[45] }), .B_DOUT({nc3591, 
        nc3592, nc3593, nc3594, nc3595, nc3596, nc3597, nc3598, nc3599, 
        nc3600, nc3601, nc3602, nc3603, nc3604, nc3605, nc3606, nc3607, 
        nc3608, nc3609, \B_DOUT_TEMPR1[45] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][45] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[45]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[45]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[40]  (.A(\A_DOUT_TEMPR0[40] ), .B(
        \A_DOUT_TEMPR1[40] ), .C(\A_DOUT_TEMPR2[40] ), .D(
        \A_DOUT_TEMPR3[40] ), .Y(A_DOUT[40]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%46%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C46 (.A_DOUT({
        nc3610, nc3611, nc3612, nc3613, nc3614, nc3615, nc3616, nc3617, 
        nc3618, nc3619, nc3620, nc3621, nc3622, nc3623, nc3624, nc3625, 
        nc3626, nc3627, nc3628, \A_DOUT_TEMPR1[46] }), .B_DOUT({nc3629, 
        nc3630, nc3631, nc3632, nc3633, nc3634, nc3635, nc3636, nc3637, 
        nc3638, nc3639, nc3640, nc3641, nc3642, nc3643, nc3644, nc3645, 
        nc3646, nc3647, \B_DOUT_TEMPR1[46] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][46] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[46]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[46]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[35]  (.A(\A_DOUT_TEMPR0[35] ), .B(
        \A_DOUT_TEMPR1[35] ), .C(\A_DOUT_TEMPR2[35] ), .D(
        \A_DOUT_TEMPR3[35] ), .Y(A_DOUT[35]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%0%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C0 (.A_DOUT({
        nc3648, nc3649, nc3650, nc3651, nc3652, nc3653, nc3654, nc3655, 
        nc3656, nc3657, nc3658, nc3659, nc3660, nc3661, nc3662, nc3663, 
        nc3664, nc3665, nc3666, \A_DOUT_TEMPR2[0] }), .B_DOUT({nc3667, 
        nc3668, nc3669, nc3670, nc3671, nc3672, nc3673, nc3674, nc3675, 
        nc3676, nc3677, nc3678, nc3679, nc3680, nc3681, nc3682, nc3683, 
        nc3684, nc3685, \B_DOUT_TEMPR2[0] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][0] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[0]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[0]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%14%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C14 (.A_DOUT({
        nc3686, nc3687, nc3688, nc3689, nc3690, nc3691, nc3692, nc3693, 
        nc3694, nc3695, nc3696, nc3697, nc3698, nc3699, nc3700, nc3701, 
        nc3702, nc3703, nc3704, \A_DOUT_TEMPR3[14] }), .B_DOUT({nc3705, 
        nc3706, nc3707, nc3708, nc3709, nc3710, nc3711, nc3712, nc3713, 
        nc3714, nc3715, nc3716, nc3717, nc3718, nc3719, nc3720, nc3721, 
        nc3722, nc3723, \B_DOUT_TEMPR3[14] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][14] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[14]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[14]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%50%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C50 (.A_DOUT({
        nc3724, nc3725, nc3726, nc3727, nc3728, nc3729, nc3730, nc3731, 
        nc3732, nc3733, nc3734, nc3735, nc3736, nc3737, nc3738, nc3739, 
        nc3740, nc3741, nc3742, \A_DOUT_TEMPR1[50] }), .B_DOUT({nc3743, 
        nc3744, nc3745, nc3746, nc3747, nc3748, nc3749, nc3750, nc3751, 
        nc3752, nc3753, nc3754, nc3755, nc3756, nc3757, nc3758, nc3759, 
        nc3760, nc3761, \B_DOUT_TEMPR1[50] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][50] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[50]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[50]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%59%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C59 (.A_DOUT({
        nc3762, nc3763, nc3764, nc3765, nc3766, nc3767, nc3768, nc3769, 
        nc3770, nc3771, nc3772, nc3773, nc3774, nc3775, nc3776, nc3777, 
        nc3778, nc3779, nc3780, \A_DOUT_TEMPR3[59] }), .B_DOUT({nc3781, 
        nc3782, nc3783, nc3784, nc3785, nc3786, nc3787, nc3788, nc3789, 
        nc3790, nc3791, nc3792, nc3793, nc3794, nc3795, nc3796, nc3797, 
        nc3798, nc3799, \B_DOUT_TEMPR3[59] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][59] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[59]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[59]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%4%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C4 (.A_DOUT({
        nc3800, nc3801, nc3802, nc3803, nc3804, nc3805, nc3806, nc3807, 
        nc3808, nc3809, nc3810, nc3811, nc3812, nc3813, nc3814, nc3815, 
        nc3816, nc3817, nc3818, \A_DOUT_TEMPR1[4] }), .B_DOUT({nc3819, 
        nc3820, nc3821, nc3822, nc3823, nc3824, nc3825, nc3826, nc3827, 
        nc3828, nc3829, nc3830, nc3831, nc3832, nc3833, nc3834, nc3835, 
        nc3836, nc3837, \B_DOUT_TEMPR1[4] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][4] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[4]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[4]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%58%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C58 (.A_DOUT({
        nc3838, nc3839, nc3840, nc3841, nc3842, nc3843, nc3844, nc3845, 
        nc3846, nc3847, nc3848, nc3849, nc3850, nc3851, nc3852, nc3853, 
        nc3854, nc3855, nc3856, \A_DOUT_TEMPR1[58] }), .B_DOUT({nc3857, 
        nc3858, nc3859, nc3860, nc3861, nc3862, nc3863, nc3864, nc3865, 
        nc3866, nc3867, nc3868, nc3869, nc3870, nc3871, nc3872, nc3873, 
        nc3874, nc3875, \B_DOUT_TEMPR1[58] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][58] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[58]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[58]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[45]  (.A(\B_DOUT_TEMPR0[45] ), .B(
        \B_DOUT_TEMPR1[45] ), .C(\B_DOUT_TEMPR2[45] ), .D(
        \B_DOUT_TEMPR3[45] ), .Y(B_DOUT[45]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%42%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C42 (.A_DOUT({
        nc3876, nc3877, nc3878, nc3879, nc3880, nc3881, nc3882, nc3883, 
        nc3884, nc3885, nc3886, nc3887, nc3888, nc3889, nc3890, nc3891, 
        nc3892, nc3893, nc3894, \A_DOUT_TEMPR1[42] }), .B_DOUT({nc3895, 
        nc3896, nc3897, nc3898, nc3899, nc3900, nc3901, nc3902, nc3903, 
        nc3904, nc3905, nc3906, nc3907, nc3908, nc3909, nc3910, nc3911, 
        nc3912, nc3913, \B_DOUT_TEMPR1[42] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][42] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[42]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[42]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%17%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C17 (.A_DOUT({
        nc3914, nc3915, nc3916, nc3917, nc3918, nc3919, nc3920, nc3921, 
        nc3922, nc3923, nc3924, nc3925, nc3926, nc3927, nc3928, nc3929, 
        nc3930, nc3931, nc3932, \A_DOUT_TEMPR0[17] }), .B_DOUT({nc3933, 
        nc3934, nc3935, nc3936, nc3937, nc3938, nc3939, nc3940, nc3941, 
        nc3942, nc3943, nc3944, nc3945, nc3946, nc3947, nc3948, nc3949, 
        nc3950, nc3951, \B_DOUT_TEMPR0[17] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][17] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[17]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[17]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%50%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C50 (.A_DOUT({
        nc3952, nc3953, nc3954, nc3955, nc3956, nc3957, nc3958, nc3959, 
        nc3960, nc3961, nc3962, nc3963, nc3964, nc3965, nc3966, nc3967, 
        nc3968, nc3969, nc3970, \A_DOUT_TEMPR2[50] }), .B_DOUT({nc3971, 
        nc3972, nc3973, nc3974, nc3975, nc3976, nc3977, nc3978, nc3979, 
        nc3980, nc3981, nc3982, nc3983, nc3984, nc3985, nc3986, nc3987, 
        nc3988, nc3989, \B_DOUT_TEMPR2[50] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][50] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[50]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[50]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%58%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C58 (.A_DOUT({
        nc3990, nc3991, nc3992, nc3993, nc3994, nc3995, nc3996, nc3997, 
        nc3998, nc3999, nc4000, nc4001, nc4002, nc4003, nc4004, nc4005, 
        nc4006, nc4007, nc4008, \A_DOUT_TEMPR2[58] }), .B_DOUT({nc4009, 
        nc4010, nc4011, nc4012, nc4013, nc4014, nc4015, nc4016, nc4017, 
        nc4018, nc4019, nc4020, nc4021, nc4022, nc4023, nc4024, nc4025, 
        nc4026, nc4027, \B_DOUT_TEMPR2[58] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][58] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[58]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[58]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[16]  (.A(\B_DOUT_TEMPR0[16] ), .B(
        \B_DOUT_TEMPR1[16] ), .C(\B_DOUT_TEMPR2[16] ), .D(
        \B_DOUT_TEMPR3[16] ), .Y(B_DOUT[16]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%44%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C44 (.A_DOUT({
        nc4028, nc4029, nc4030, nc4031, nc4032, nc4033, nc4034, nc4035, 
        nc4036, nc4037, nc4038, nc4039, nc4040, nc4041, nc4042, nc4043, 
        nc4044, nc4045, nc4046, \A_DOUT_TEMPR0[44] }), .B_DOUT({nc4047, 
        nc4048, nc4049, nc4050, nc4051, nc4052, nc4053, nc4054, nc4055, 
        nc4056, nc4057, nc4058, nc4059, nc4060, nc4061, nc4062, nc4063, 
        nc4064, nc4065, \B_DOUT_TEMPR0[44] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][44] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[44]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[44]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[15]  (.A(\A_DOUT_TEMPR0[15] ), .B(
        \A_DOUT_TEMPR1[15] ), .C(\A_DOUT_TEMPR2[15] ), .D(
        \A_DOUT_TEMPR3[15] ), .Y(A_DOUT[15]));
    OR4 \OR4_B_DOUT[33]  (.A(\B_DOUT_TEMPR0[33] ), .B(
        \B_DOUT_TEMPR1[33] ), .C(\B_DOUT_TEMPR2[33] ), .D(
        \B_DOUT_TEMPR3[33] ), .Y(B_DOUT[33]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%34%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C34 (.A_DOUT({
        nc4066, nc4067, nc4068, nc4069, nc4070, nc4071, nc4072, nc4073, 
        nc4074, nc4075, nc4076, nc4077, nc4078, nc4079, nc4080, nc4081, 
        nc4082, nc4083, nc4084, \A_DOUT_TEMPR1[34] }), .B_DOUT({nc4085, 
        nc4086, nc4087, nc4088, nc4089, nc4090, nc4091, nc4092, nc4093, 
        nc4094, nc4095, nc4096, nc4097, nc4098, nc4099, nc4100, nc4101, 
        nc4102, nc4103, \B_DOUT_TEMPR1[34] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][34] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[34]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[34]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[21]  (.A(\A_DOUT_TEMPR0[21] ), .B(
        \A_DOUT_TEMPR1[21] ), .C(\A_DOUT_TEMPR2[21] ), .D(
        \A_DOUT_TEMPR3[21] ), .Y(A_DOUT[21]));
    OR4 \OR4_A_DOUT[54]  (.A(\A_DOUT_TEMPR0[54] ), .B(
        \A_DOUT_TEMPR1[54] ), .C(\A_DOUT_TEMPR2[54] ), .D(
        \A_DOUT_TEMPR3[54] ), .Y(A_DOUT[54]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%34%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C34 (.A_DOUT({
        nc4104, nc4105, nc4106, nc4107, nc4108, nc4109, nc4110, nc4111, 
        nc4112, nc4113, nc4114, nc4115, nc4116, nc4117, nc4118, nc4119, 
        nc4120, nc4121, nc4122, \A_DOUT_TEMPR2[34] }), .B_DOUT({nc4123, 
        nc4124, nc4125, nc4126, nc4127, nc4128, nc4129, nc4130, nc4131, 
        nc4132, nc4133, nc4134, nc4135, nc4136, nc4137, nc4138, nc4139, 
        nc4140, nc4141, \B_DOUT_TEMPR2[34] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][34] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[34]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[34]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%43%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C43 (.A_DOUT({
        nc4142, nc4143, nc4144, nc4145, nc4146, nc4147, nc4148, nc4149, 
        nc4150, nc4151, nc4152, nc4153, nc4154, nc4155, nc4156, nc4157, 
        nc4158, nc4159, nc4160, \A_DOUT_TEMPR1[43] }), .B_DOUT({nc4161, 
        nc4162, nc4163, nc4164, nc4165, nc4166, nc4167, nc4168, nc4169, 
        nc4170, nc4171, nc4172, nc4173, nc4174, nc4175, nc4176, nc4177, 
        nc4178, nc4179, \B_DOUT_TEMPR1[43] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][43] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[43]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[43]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[2]  (.A(\A_DOUT_TEMPR0[2] ), .B(\A_DOUT_TEMPR1[2] )
        , .C(\A_DOUT_TEMPR2[2] ), .D(\A_DOUT_TEMPR3[2] ), .Y(A_DOUT[2])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%57%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C57 (.A_DOUT({
        nc4180, nc4181, nc4182, nc4183, nc4184, nc4185, nc4186, nc4187, 
        nc4188, nc4189, nc4190, nc4191, nc4192, nc4193, nc4194, nc4195, 
        nc4196, nc4197, nc4198, \A_DOUT_TEMPR0[57] }), .B_DOUT({nc4199, 
        nc4200, nc4201, nc4202, nc4203, nc4204, nc4205, nc4206, nc4207, 
        nc4208, nc4209, nc4210, nc4211, nc4212, nc4213, nc4214, nc4215, 
        nc4216, nc4217, \B_DOUT_TEMPR0[57] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][57] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[57]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[57]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[63]  (.A(\A_DOUT_TEMPR0[63] ), .B(
        \A_DOUT_TEMPR1[63] ), .C(\A_DOUT_TEMPR2[63] ), .D(
        \A_DOUT_TEMPR3[63] ), .Y(A_DOUT[63]));
    OR4 \OR4_A_DOUT[44]  (.A(\A_DOUT_TEMPR0[44] ), .B(
        \A_DOUT_TEMPR1[44] ), .C(\A_DOUT_TEMPR2[44] ), .D(
        \A_DOUT_TEMPR3[44] ), .Y(A_DOUT[44]));
    OR4 \OR4_B_DOUT[54]  (.A(\B_DOUT_TEMPR0[54] ), .B(
        \B_DOUT_TEMPR1[54] ), .C(\B_DOUT_TEMPR2[54] ), .D(
        \B_DOUT_TEMPR3[54] ), .Y(B_DOUT[54]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%19%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C19 (.A_DOUT({
        nc4218, nc4219, nc4220, nc4221, nc4222, nc4223, nc4224, nc4225, 
        nc4226, nc4227, nc4228, nc4229, nc4230, nc4231, nc4232, nc4233, 
        nc4234, nc4235, nc4236, \A_DOUT_TEMPR3[19] }), .B_DOUT({nc4237, 
        nc4238, nc4239, nc4240, nc4241, nc4242, nc4243, nc4244, nc4245, 
        nc4246, nc4247, nc4248, nc4249, nc4250, nc4251, nc4252, nc4253, 
        nc4254, nc4255, \B_DOUT_TEMPR3[19] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][19] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[19]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[19]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[20]  (.A(\B_DOUT_TEMPR0[20] ), .B(
        \B_DOUT_TEMPR1[20] ), .C(\B_DOUT_TEMPR2[20] ), .D(
        \B_DOUT_TEMPR3[20] ), .Y(B_DOUT[20]));
    OR4 \OR4_B_DOUT[13]  (.A(\B_DOUT_TEMPR0[13] ), .B(
        \B_DOUT_TEMPR1[13] ), .C(\B_DOUT_TEMPR2[13] ), .D(
        \B_DOUT_TEMPR3[13] ), .Y(B_DOUT[13]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%24%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C24 (.A_DOUT({
        nc4256, nc4257, nc4258, nc4259, nc4260, nc4261, nc4262, nc4263, 
        nc4264, nc4265, nc4266, nc4267, nc4268, nc4269, nc4270, nc4271, 
        nc4272, nc4273, nc4274, \A_DOUT_TEMPR0[24] }), .B_DOUT({nc4275, 
        nc4276, nc4277, nc4278, nc4279, nc4280, nc4281, nc4282, nc4283, 
        nc4284, nc4285, nc4286, nc4287, nc4288, nc4289, nc4290, nc4291, 
        nc4292, nc4293, \B_DOUT_TEMPR0[24] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][24] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[24]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[24]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[44]  (.A(\B_DOUT_TEMPR0[44] ), .B(
        \B_DOUT_TEMPR1[44] ), .C(\B_DOUT_TEMPR2[44] ), .D(
        \B_DOUT_TEMPR3[44] ), .Y(B_DOUT[44]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%9%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C9 (.A_DOUT({
        nc4294, nc4295, nc4296, nc4297, nc4298, nc4299, nc4300, nc4301, 
        nc4302, nc4303, nc4304, nc4305, nc4306, nc4307, nc4308, nc4309, 
        nc4310, nc4311, nc4312, \A_DOUT_TEMPR0[9] }), .B_DOUT({nc4313, 
        nc4314, nc4315, nc4316, nc4317, nc4318, nc4319, nc4320, nc4321, 
        nc4322, nc4323, nc4324, nc4325, nc4326, nc4327, nc4328, nc4329, 
        nc4330, nc4331, \B_DOUT_TEMPR0[9] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][9] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[9]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[9]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%57%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C57 (.A_DOUT({
        nc4332, nc4333, nc4334, nc4335, nc4336, nc4337, nc4338, nc4339, 
        nc4340, nc4341, nc4342, nc4343, nc4344, nc4345, nc4346, nc4347, 
        nc4348, nc4349, nc4350, \A_DOUT_TEMPR1[57] }), .B_DOUT({nc4351, 
        nc4352, nc4353, nc4354, nc4355, nc4356, nc4357, nc4358, nc4359, 
        nc4360, nc4361, nc4362, nc4363, nc4364, nc4365, nc4366, nc4367, 
        nc4368, nc4369, \B_DOUT_TEMPR1[57] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][57] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[57]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[57]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[6]  (.A(\A_DOUT_TEMPR0[6] ), .B(\A_DOUT_TEMPR1[6] )
        , .C(\A_DOUT_TEMPR2[6] ), .D(\A_DOUT_TEMPR3[6] ), .Y(A_DOUT[6])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%14%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C14 (.A_DOUT({
        nc4370, nc4371, nc4372, nc4373, nc4374, nc4375, nc4376, nc4377, 
        nc4378, nc4379, nc4380, nc4381, nc4382, nc4383, nc4384, nc4385, 
        nc4386, nc4387, nc4388, \A_DOUT_TEMPR1[14] }), .B_DOUT({nc4389, 
        nc4390, nc4391, nc4392, nc4393, nc4394, nc4395, nc4396, nc4397, 
        nc4398, nc4399, nc4400, nc4401, nc4402, nc4403, nc4404, nc4405, 
        nc4406, nc4407, \B_DOUT_TEMPR1[14] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][14] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[14]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[14]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[51]  (.A(\B_DOUT_TEMPR0[51] ), .B(
        \B_DOUT_TEMPR1[51] ), .C(\B_DOUT_TEMPR2[51] ), .D(
        \B_DOUT_TEMPR3[51] ), .Y(B_DOUT[51]));
    OR4 \OR4_A_DOUT[20]  (.A(\A_DOUT_TEMPR0[20] ), .B(
        \A_DOUT_TEMPR1[20] ), .C(\A_DOUT_TEMPR2[20] ), .D(
        \A_DOUT_TEMPR3[20] ), .Y(A_DOUT[20]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%49%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C49 (.A_DOUT({
        nc4408, nc4409, nc4410, nc4411, nc4412, nc4413, nc4414, nc4415, 
        nc4416, nc4417, nc4418, nc4419, nc4420, nc4421, nc4422, nc4423, 
        nc4424, nc4425, nc4426, \A_DOUT_TEMPR0[49] }), .B_DOUT({nc4427, 
        nc4428, nc4429, nc4430, nc4431, nc4432, nc4433, nc4434, nc4435, 
        nc4436, nc4437, nc4438, nc4439, nc4440, nc4441, nc4442, nc4443, 
        nc4444, nc4445, \B_DOUT_TEMPR0[49] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][49] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[49]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[49]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%57%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C57 (.A_DOUT({
        nc4446, nc4447, nc4448, nc4449, nc4450, nc4451, nc4452, nc4453, 
        nc4454, nc4455, nc4456, nc4457, nc4458, nc4459, nc4460, nc4461, 
        nc4462, nc4463, nc4464, \A_DOUT_TEMPR2[57] }), .B_DOUT({nc4465, 
        nc4466, nc4467, nc4468, nc4469, nc4470, nc4471, nc4472, nc4473, 
        nc4474, nc4475, nc4476, nc4477, nc4478, nc4479, nc4480, nc4481, 
        nc4482, nc4483, \B_DOUT_TEMPR2[57] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][57] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[57]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[57]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[52]  (.A(\B_DOUT_TEMPR0[52] ), .B(
        \B_DOUT_TEMPR1[52] ), .C(\B_DOUT_TEMPR2[52] ), .D(
        \B_DOUT_TEMPR3[52] ), .Y(B_DOUT[52]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%39%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C39 (.A_DOUT({
        nc4484, nc4485, nc4486, nc4487, nc4488, nc4489, nc4490, nc4491, 
        nc4492, nc4493, nc4494, nc4495, nc4496, nc4497, nc4498, nc4499, 
        nc4500, nc4501, nc4502, \A_DOUT_TEMPR1[39] }), .B_DOUT({nc4503, 
        nc4504, nc4505, nc4506, nc4507, nc4508, nc4509, nc4510, nc4511, 
        nc4512, nc4513, nc4514, nc4515, nc4516, nc4517, nc4518, nc4519, 
        nc4520, nc4521, \B_DOUT_TEMPR1[39] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][39] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[39]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[39]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[25]  (.A(\B_DOUT_TEMPR0[25] ), .B(
        \B_DOUT_TEMPR1[25] ), .C(\B_DOUT_TEMPR2[25] ), .D(
        \B_DOUT_TEMPR3[25] ), .Y(B_DOUT[25]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%39%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C39 (.A_DOUT({
        nc4522, nc4523, nc4524, nc4525, nc4526, nc4527, nc4528, nc4529, 
        nc4530, nc4531, nc4532, nc4533, nc4534, nc4535, nc4536, nc4537, 
        nc4538, nc4539, nc4540, \A_DOUT_TEMPR2[39] }), .B_DOUT({nc4541, 
        nc4542, nc4543, nc4544, nc4545, nc4546, nc4547, nc4548, nc4549, 
        nc4550, nc4551, nc4552, nc4553, nc4554, nc4555, nc4556, nc4557, 
        nc4558, nc4559, \B_DOUT_TEMPR2[39] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][39] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[39]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[39]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[41]  (.A(\B_DOUT_TEMPR0[41] ), .B(
        \B_DOUT_TEMPR1[41] ), .C(\B_DOUT_TEMPR2[41] ), .D(
        \B_DOUT_TEMPR3[41] ), .Y(B_DOUT[41]));
    OR4 \OR4_B_DOUT[42]  (.A(\B_DOUT_TEMPR0[42] ), .B(
        \B_DOUT_TEMPR1[42] ), .C(\B_DOUT_TEMPR2[42] ), .D(
        \B_DOUT_TEMPR3[42] ), .Y(B_DOUT[42]));
    OR4 \OR4_A_DOUT[31]  (.A(\A_DOUT_TEMPR0[31] ), .B(
        \A_DOUT_TEMPR1[31] ), .C(\A_DOUT_TEMPR2[31] ), .D(
        \A_DOUT_TEMPR3[31] ), .Y(A_DOUT[31]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%40%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C40 (.A_DOUT({
        nc4560, nc4561, nc4562, nc4563, nc4564, nc4565, nc4566, nc4567, 
        nc4568, nc4569, nc4570, nc4571, nc4572, nc4573, nc4574, nc4575, 
        nc4576, nc4577, nc4578, \A_DOUT_TEMPR1[40] }), .B_DOUT({nc4579, 
        nc4580, nc4581, nc4582, nc4583, nc4584, nc4585, nc4586, nc4587, 
        nc4588, nc4589, nc4590, nc4591, nc4592, nc4593, nc4594, nc4595, 
        nc4596, nc4597, \B_DOUT_TEMPR1[40] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][40] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[40]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[40]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%31%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C31 (.A_DOUT({
        nc4598, nc4599, nc4600, nc4601, nc4602, nc4603, nc4604, nc4605, 
        nc4606, nc4607, nc4608, nc4609, nc4610, nc4611, nc4612, nc4613, 
        nc4614, nc4615, nc4616, \A_DOUT_TEMPR3[31] }), .B_DOUT({nc4617, 
        nc4618, nc4619, nc4620, nc4621, nc4622, nc4623, nc4624, nc4625, 
        nc4626, nc4627, nc4628, nc4629, nc4630, nc4631, nc4632, nc4633, 
        nc4634, nc4635, \B_DOUT_TEMPR3[31] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][31] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[31]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[31]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%48%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C48 (.A_DOUT({
        nc4636, nc4637, nc4638, nc4639, nc4640, nc4641, nc4642, nc4643, 
        nc4644, nc4645, nc4646, nc4647, nc4648, nc4649, nc4650, nc4651, 
        nc4652, nc4653, nc4654, \A_DOUT_TEMPR1[48] }), .B_DOUT({nc4655, 
        nc4656, nc4657, nc4658, nc4659, nc4660, nc4661, nc4662, nc4663, 
        nc4664, nc4665, nc4666, nc4667, nc4668, nc4669, nc4670, nc4671, 
        nc4672, nc4673, \B_DOUT_TEMPR1[48] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][48] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[48]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[48]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%44%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C44 (.A_DOUT({
        nc4674, nc4675, nc4676, nc4677, nc4678, nc4679, nc4680, nc4681, 
        nc4682, nc4683, nc4684, nc4685, nc4686, nc4687, nc4688, nc4689, 
        nc4690, nc4691, nc4692, \A_DOUT_TEMPR3[44] }), .B_DOUT({nc4693, 
        nc4694, nc4695, nc4696, nc4697, nc4698, nc4699, nc4700, nc4701, 
        nc4702, nc4703, nc4704, nc4705, nc4706, nc4707, nc4708, nc4709, 
        nc4710, nc4711, \B_DOUT_TEMPR3[44] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][44] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[44]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[44]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%24%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C24 (.A_DOUT({
        nc4712, nc4713, nc4714, nc4715, nc4716, nc4717, nc4718, nc4719, 
        nc4720, nc4721, nc4722, nc4723, nc4724, nc4725, nc4726, nc4727, 
        nc4728, nc4729, nc4730, \A_DOUT_TEMPR1[24] }), .B_DOUT({nc4731, 
        nc4732, nc4733, nc4734, nc4735, nc4736, nc4737, nc4738, nc4739, 
        nc4740, nc4741, nc4742, nc4743, nc4744, nc4745, nc4746, nc4747, 
        nc4748, nc4749, \B_DOUT_TEMPR1[24] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][24] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[24]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[24]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[7]  (.A(\A_DOUT_TEMPR0[7] ), .B(\A_DOUT_TEMPR1[7] )
        , .C(\A_DOUT_TEMPR2[7] ), .D(\A_DOUT_TEMPR3[7] ), .Y(A_DOUT[7])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%24%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C24 (.A_DOUT({
        nc4750, nc4751, nc4752, nc4753, nc4754, nc4755, nc4756, nc4757, 
        nc4758, nc4759, nc4760, nc4761, nc4762, nc4763, nc4764, nc4765, 
        nc4766, nc4767, nc4768, \A_DOUT_TEMPR3[24] }), .B_DOUT({nc4769, 
        nc4770, nc4771, nc4772, nc4773, nc4774, nc4775, nc4776, nc4777, 
        nc4778, nc4779, nc4780, nc4781, nc4782, nc4783, nc4784, nc4785, 
        nc4786, nc4787, \B_DOUT_TEMPR3[24] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][24] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[24]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[24]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[58]  (.A(\A_DOUT_TEMPR0[58] ), .B(
        \A_DOUT_TEMPR1[58] ), .C(\A_DOUT_TEMPR2[58] ), .D(
        \A_DOUT_TEMPR3[58] ), .Y(A_DOUT[58]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%29%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C29 (.A_DOUT({
        nc4788, nc4789, nc4790, nc4791, nc4792, nc4793, nc4794, nc4795, 
        nc4796, nc4797, nc4798, nc4799, nc4800, nc4801, nc4802, nc4803, 
        nc4804, nc4805, nc4806, \A_DOUT_TEMPR0[29] }), .B_DOUT({nc4807, 
        nc4808, nc4809, nc4810, nc4811, nc4812, nc4813, nc4814, nc4815, 
        nc4816, nc4817, nc4818, nc4819, nc4820, nc4821, nc4822, nc4823, 
        nc4824, nc4825, \B_DOUT_TEMPR0[29] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][29] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[29]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[29]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%35%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C35 (.A_DOUT({
        nc4826, nc4827, nc4828, nc4829, nc4830, nc4831, nc4832, nc4833, 
        nc4834, nc4835, nc4836, nc4837, nc4838, nc4839, nc4840, nc4841, 
        nc4842, nc4843, nc4844, \A_DOUT_TEMPR3[35] }), .B_DOUT({nc4845, 
        nc4846, nc4847, nc4848, nc4849, nc4850, nc4851, nc4852, nc4853, 
        nc4854, nc4855, nc4856, nc4857, nc4858, nc4859, nc4860, nc4861, 
        nc4862, nc4863, \B_DOUT_TEMPR3[35] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][35] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[35]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[35]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%36%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C36 (.A_DOUT({
        nc4864, nc4865, nc4866, nc4867, nc4868, nc4869, nc4870, nc4871, 
        nc4872, nc4873, nc4874, nc4875, nc4876, nc4877, nc4878, nc4879, 
        nc4880, nc4881, nc4882, \A_DOUT_TEMPR3[36] }), .B_DOUT({nc4883, 
        nc4884, nc4885, nc4886, nc4887, nc4888, nc4889, nc4890, nc4891, 
        nc4892, nc4893, nc4894, nc4895, nc4896, nc4897, nc4898, nc4899, 
        nc4900, nc4901, \B_DOUT_TEMPR3[36] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][36] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[36]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[36]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%19%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C19 (.A_DOUT({
        nc4902, nc4903, nc4904, nc4905, nc4906, nc4907, nc4908, nc4909, 
        nc4910, nc4911, nc4912, nc4913, nc4914, nc4915, nc4916, nc4917, 
        nc4918, nc4919, nc4920, \A_DOUT_TEMPR1[19] }), .B_DOUT({nc4921, 
        nc4922, nc4923, nc4924, nc4925, nc4926, nc4927, nc4928, nc4929, 
        nc4930, nc4931, nc4932, nc4933, nc4934, nc4935, nc4936, nc4937, 
        nc4938, nc4939, \B_DOUT_TEMPR1[19] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][19] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[19]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[19]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%0%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C0 (.A_DOUT({
        nc4940, nc4941, nc4942, nc4943, nc4944, nc4945, nc4946, nc4947, 
        nc4948, nc4949, nc4950, nc4951, nc4952, nc4953, nc4954, nc4955, 
        nc4956, nc4957, nc4958, \A_DOUT_TEMPR3[0] }), .B_DOUT({nc4959, 
        nc4960, nc4961, nc4962, nc4963, nc4964, nc4965, nc4966, nc4967, 
        nc4968, nc4969, nc4970, nc4971, nc4972, nc4973, nc4974, nc4975, 
        nc4976, nc4977, \B_DOUT_TEMPR3[0] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][0] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[0]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[0]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%11%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C11 (.A_DOUT({
        nc4978, nc4979, nc4980, nc4981, nc4982, nc4983, nc4984, nc4985, 
        nc4986, nc4987, nc4988, nc4989, nc4990, nc4991, nc4992, nc4993, 
        nc4994, nc4995, nc4996, \A_DOUT_TEMPR2[11] }), .B_DOUT({nc4997, 
        nc4998, nc4999, nc5000, nc5001, nc5002, nc5003, nc5004, nc5005, 
        nc5006, nc5007, nc5008, nc5009, nc5010, nc5011, nc5012, nc5013, 
        nc5014, nc5015, \B_DOUT_TEMPR2[11] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][11] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[11]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[11]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[30]  (.A(\B_DOUT_TEMPR0[30] ), .B(
        \B_DOUT_TEMPR1[30] ), .C(\B_DOUT_TEMPR2[30] ), .D(
        \B_DOUT_TEMPR3[30] ), .Y(B_DOUT[30]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%31%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C31 (.A_DOUT({
        nc5016, nc5017, nc5018, nc5019, nc5020, nc5021, nc5022, nc5023, 
        nc5024, nc5025, nc5026, nc5027, nc5028, nc5029, nc5030, nc5031, 
        nc5032, nc5033, nc5034, \A_DOUT_TEMPR0[31] }), .B_DOUT({nc5035, 
        nc5036, nc5037, nc5038, nc5039, nc5040, nc5041, nc5042, nc5043, 
        nc5044, nc5045, nc5046, nc5047, nc5048, nc5049, nc5050, nc5051, 
        nc5052, nc5053, \B_DOUT_TEMPR0[31] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][31] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[31]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[31]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[48]  (.A(\A_DOUT_TEMPR0[48] ), .B(
        \A_DOUT_TEMPR1[48] ), .C(\A_DOUT_TEMPR2[48] ), .D(
        \A_DOUT_TEMPR3[48] ), .Y(A_DOUT[48]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%7%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C7 (.A_DOUT({
        nc5054, nc5055, nc5056, nc5057, nc5058, nc5059, nc5060, nc5061, 
        nc5062, nc5063, nc5064, nc5065, nc5066, nc5067, nc5068, nc5069, 
        nc5070, nc5071, nc5072, \A_DOUT_TEMPR0[7] }), .B_DOUT({nc5073, 
        nc5074, nc5075, nc5076, nc5077, nc5078, nc5079, nc5080, nc5081, 
        nc5082, nc5083, nc5084, nc5085, nc5086, nc5087, nc5088, nc5089, 
        nc5090, nc5091, \B_DOUT_TEMPR0[7] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[7]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[7]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[24]  (.A(\A_DOUT_TEMPR0[24] ), .B(
        \A_DOUT_TEMPR1[24] ), .C(\A_DOUT_TEMPR2[24] ), .D(
        \A_DOUT_TEMPR3[24] ), .Y(A_DOUT[24]));
    OR4 \OR4_A_DOUT[11]  (.A(\A_DOUT_TEMPR0[11] ), .B(
        \A_DOUT_TEMPR1[11] ), .C(\A_DOUT_TEMPR2[11] ), .D(
        \A_DOUT_TEMPR3[11] ), .Y(A_DOUT[11]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%3%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C3 (.A_DOUT({
        nc5092, nc5093, nc5094, nc5095, nc5096, nc5097, nc5098, nc5099, 
        nc5100, nc5101, nc5102, nc5103, nc5104, nc5105, nc5106, nc5107, 
        nc5108, nc5109, nc5110, \A_DOUT_TEMPR3[3] }), .B_DOUT({nc5111, 
        nc5112, nc5113, nc5114, nc5115, nc5116, nc5117, nc5118, nc5119, 
        nc5120, nc5121, nc5122, nc5123, nc5124, nc5125, nc5126, nc5127, 
        nc5128, nc5129, \B_DOUT_TEMPR3[3] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][3] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[3]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[3]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%32%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C32 (.A_DOUT({
        nc5130, nc5131, nc5132, nc5133, nc5134, nc5135, nc5136, nc5137, 
        nc5138, nc5139, nc5140, nc5141, nc5142, nc5143, nc5144, nc5145, 
        nc5146, nc5147, nc5148, \A_DOUT_TEMPR3[32] }), .B_DOUT({nc5149, 
        nc5150, nc5151, nc5152, nc5153, nc5154, nc5155, nc5156, nc5157, 
        nc5158, nc5159, nc5160, nc5161, nc5162, nc5163, nc5164, nc5165, 
        nc5166, nc5167, \B_DOUT_TEMPR3[32] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][32] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[32]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[32]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[4]  (.A(\B_DOUT_TEMPR0[4] ), .B(\B_DOUT_TEMPR1[4] )
        , .C(\B_DOUT_TEMPR2[4] ), .D(\B_DOUT_TEMPR3[4] ), .Y(B_DOUT[4])
        );
    OR4 \OR4_B_DOUT[8]  (.A(\B_DOUT_TEMPR0[8] ), .B(\B_DOUT_TEMPR1[8] )
        , .C(\B_DOUT_TEMPR2[8] ), .D(\B_DOUT_TEMPR3[8] ), .Y(B_DOUT[8])
        );
    OR4 \OR4_A_DOUT[30]  (.A(\A_DOUT_TEMPR0[30] ), .B(
        \A_DOUT_TEMPR1[30] ), .C(\A_DOUT_TEMPR2[30] ), .D(
        \A_DOUT_TEMPR3[30] ), .Y(A_DOUT[30]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%15%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C15 (.A_DOUT({
        nc5168, nc5169, nc5170, nc5171, nc5172, nc5173, nc5174, nc5175, 
        nc5176, nc5177, nc5178, nc5179, nc5180, nc5181, nc5182, nc5183, 
        nc5184, nc5185, nc5186, \A_DOUT_TEMPR2[15] }), .B_DOUT({nc5187, 
        nc5188, nc5189, nc5190, nc5191, nc5192, nc5193, nc5194, nc5195, 
        nc5196, nc5197, nc5198, nc5199, nc5200, nc5201, nc5202, nc5203, 
        nc5204, nc5205, \B_DOUT_TEMPR2[15] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][15] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[15]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[15]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%35%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C35 (.A_DOUT({
        nc5206, nc5207, nc5208, nc5209, nc5210, nc5211, nc5212, nc5213, 
        nc5214, nc5215, nc5216, nc5217, nc5218, nc5219, nc5220, nc5221, 
        nc5222, nc5223, nc5224, \A_DOUT_TEMPR0[35] }), .B_DOUT({nc5225, 
        nc5226, nc5227, nc5228, nc5229, nc5230, nc5231, nc5232, nc5233, 
        nc5234, nc5235, nc5236, nc5237, nc5238, nc5239, nc5240, nc5241, 
        nc5242, nc5243, \B_DOUT_TEMPR0[35] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][35] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[35]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[35]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%16%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C16 (.A_DOUT({
        nc5244, nc5245, nc5246, nc5247, nc5248, nc5249, nc5250, nc5251, 
        nc5252, nc5253, nc5254, nc5255, nc5256, nc5257, nc5258, nc5259, 
        nc5260, nc5261, nc5262, \A_DOUT_TEMPR2[16] }), .B_DOUT({nc5263, 
        nc5264, nc5265, nc5266, nc5267, nc5268, nc5269, nc5270, nc5271, 
        nc5272, nc5273, nc5274, nc5275, nc5276, nc5277, nc5278, nc5279, 
        nc5280, nc5281, \B_DOUT_TEMPR2[16] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][16] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[16]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[16]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%36%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C36 (.A_DOUT({
        nc5282, nc5283, nc5284, nc5285, nc5286, nc5287, nc5288, nc5289, 
        nc5290, nc5291, nc5292, nc5293, nc5294, nc5295, nc5296, nc5297, 
        nc5298, nc5299, nc5300, \A_DOUT_TEMPR0[36] }), .B_DOUT({nc5301, 
        nc5302, nc5303, nc5304, nc5305, nc5306, nc5307, nc5308, nc5309, 
        nc5310, nc5311, nc5312, nc5313, nc5314, nc5315, nc5316, nc5317, 
        nc5318, nc5319, \B_DOUT_TEMPR0[36] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][36] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[36]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[36]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[24]  (.A(\B_DOUT_TEMPR0[24] ), .B(
        \B_DOUT_TEMPR1[24] ), .C(\B_DOUT_TEMPR2[24] ), .D(
        \B_DOUT_TEMPR3[24] ), .Y(B_DOUT[24]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%51%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C51 (.A_DOUT({
        nc5320, nc5321, nc5322, nc5323, nc5324, nc5325, nc5326, nc5327, 
        nc5328, nc5329, nc5330, nc5331, nc5332, nc5333, nc5334, nc5335, 
        nc5336, nc5337, nc5338, \A_DOUT_TEMPR3[51] }), .B_DOUT({nc5339, 
        nc5340, nc5341, nc5342, nc5343, nc5344, nc5345, nc5346, nc5347, 
        nc5348, nc5349, nc5350, nc5351, nc5352, nc5353, nc5354, nc5355, 
        nc5356, nc5357, \B_DOUT_TEMPR3[51] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][51] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[51]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[51]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%49%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C49 (.A_DOUT({
        nc5358, nc5359, nc5360, nc5361, nc5362, nc5363, nc5364, nc5365, 
        nc5366, nc5367, nc5368, nc5369, nc5370, nc5371, nc5372, nc5373, 
        nc5374, nc5375, nc5376, \A_DOUT_TEMPR3[49] }), .B_DOUT({nc5377, 
        nc5378, nc5379, nc5380, nc5381, nc5382, nc5383, nc5384, nc5385, 
        nc5386, nc5387, nc5388, nc5389, nc5390, nc5391, nc5392, nc5393, 
        nc5394, nc5395, \B_DOUT_TEMPR3[49] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][49] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[49]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[49]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[35]  (.A(\B_DOUT_TEMPR0[35] ), .B(
        \B_DOUT_TEMPR1[35] ), .C(\B_DOUT_TEMPR2[35] ), .D(
        \B_DOUT_TEMPR3[35] ), .Y(B_DOUT[35]));
    OR4 \OR4_A_DOUT[53]  (.A(\A_DOUT_TEMPR0[53] ), .B(
        \A_DOUT_TEMPR1[53] ), .C(\A_DOUT_TEMPR2[53] ), .D(
        \A_DOUT_TEMPR3[53] ), .Y(A_DOUT[53]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%29%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C29 (.A_DOUT({
        nc5396, nc5397, nc5398, nc5399, nc5400, nc5401, nc5402, nc5403, 
        nc5404, nc5405, nc5406, nc5407, nc5408, nc5409, nc5410, nc5411, 
        nc5412, nc5413, nc5414, \A_DOUT_TEMPR1[29] }), .B_DOUT({nc5415, 
        nc5416, nc5417, nc5418, nc5419, nc5420, nc5421, nc5422, nc5423, 
        nc5424, nc5425, nc5426, nc5427, nc5428, nc5429, nc5430, nc5431, 
        nc5432, nc5433, \B_DOUT_TEMPR1[29] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][29] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[29]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[29]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%1%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C1 (.A_DOUT({
        nc5434, nc5435, nc5436, nc5437, nc5438, nc5439, nc5440, nc5441, 
        nc5442, nc5443, nc5444, nc5445, nc5446, nc5447, nc5448, nc5449, 
        nc5450, nc5451, nc5452, \A_DOUT_TEMPR2[1] }), .B_DOUT({nc5453, 
        nc5454, nc5455, nc5456, nc5457, nc5458, nc5459, nc5460, nc5461, 
        nc5462, nc5463, nc5464, nc5465, nc5466, nc5467, nc5468, nc5469, 
        nc5470, nc5471, \B_DOUT_TEMPR2[1] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][1] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[1]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[1]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[10]  (.A(\B_DOUT_TEMPR0[10] ), .B(
        \B_DOUT_TEMPR1[10] ), .C(\B_DOUT_TEMPR2[10] ), .D(
        \B_DOUT_TEMPR3[10] ), .Y(B_DOUT[10]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%3%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C3 (.A_DOUT({
        nc5472, nc5473, nc5474, nc5475, nc5476, nc5477, nc5478, nc5479, 
        nc5480, nc5481, nc5482, nc5483, nc5484, nc5485, nc5486, nc5487, 
        nc5488, nc5489, nc5490, \A_DOUT_TEMPR0[3] }), .B_DOUT({nc5491, 
        nc5492, nc5493, nc5494, nc5495, nc5496, nc5497, nc5498, nc5499, 
        nc5500, nc5501, nc5502, nc5503, nc5504, nc5505, nc5506, nc5507, 
        nc5508, nc5509, \B_DOUT_TEMPR0[3] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[3]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[3]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%12%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C12 (.A_DOUT({
        nc5510, nc5511, nc5512, nc5513, nc5514, nc5515, nc5516, nc5517, 
        nc5518, nc5519, nc5520, nc5521, nc5522, nc5523, nc5524, nc5525, 
        nc5526, nc5527, nc5528, \A_DOUT_TEMPR2[12] }), .B_DOUT({nc5529, 
        nc5530, nc5531, nc5532, nc5533, nc5534, nc5535, nc5536, nc5537, 
        nc5538, nc5539, nc5540, nc5541, nc5542, nc5543, nc5544, nc5545, 
        nc5546, nc5547, \B_DOUT_TEMPR2[12] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][12] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[12]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[12]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%32%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C32 (.A_DOUT({
        nc5548, nc5549, nc5550, nc5551, nc5552, nc5553, nc5554, nc5555, 
        nc5556, nc5557, nc5558, nc5559, nc5560, nc5561, nc5562, nc5563, 
        nc5564, nc5565, nc5566, \A_DOUT_TEMPR0[32] }), .B_DOUT({nc5567, 
        nc5568, nc5569, nc5570, nc5571, nc5572, nc5573, nc5574, nc5575, 
        nc5576, nc5577, nc5578, nc5579, nc5580, nc5581, nc5582, nc5583, 
        nc5584, nc5585, \B_DOUT_TEMPR0[32] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][32] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[32]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[32]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%61%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C61 (.A_DOUT({
        nc5586, nc5587, nc5588, nc5589, nc5590, nc5591, nc5592, nc5593, 
        nc5594, nc5595, nc5596, nc5597, nc5598, nc5599, nc5600, nc5601, 
        nc5602, nc5603, nc5604, \A_DOUT_TEMPR0[61] }), .B_DOUT({nc5605, 
        nc5606, nc5607, nc5608, nc5609, nc5610, nc5611, nc5612, nc5613, 
        nc5614, nc5615, nc5616, nc5617, nc5618, nc5619, nc5620, nc5621, 
        nc5622, nc5623, \B_DOUT_TEMPR0[61] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][61] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[61]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[61]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%9%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C9 (.A_DOUT({
        nc5624, nc5625, nc5626, nc5627, nc5628, nc5629, nc5630, nc5631, 
        nc5632, nc5633, nc5634, nc5635, nc5636, nc5637, nc5638, nc5639, 
        nc5640, nc5641, nc5642, \A_DOUT_TEMPR2[9] }), .B_DOUT({nc5643, 
        nc5644, nc5645, nc5646, nc5647, nc5648, nc5649, nc5650, nc5651, 
        nc5652, nc5653, nc5654, nc5655, nc5656, nc5657, nc5658, nc5659, 
        nc5660, nc5661, \B_DOUT_TEMPR2[9] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][9] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[9]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[9]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%47%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C47 (.A_DOUT({
        nc5662, nc5663, nc5664, nc5665, nc5666, nc5667, nc5668, nc5669, 
        nc5670, nc5671, nc5672, nc5673, nc5674, nc5675, nc5676, nc5677, 
        nc5678, nc5679, nc5680, \A_DOUT_TEMPR1[47] }), .B_DOUT({nc5681, 
        nc5682, nc5683, nc5684, nc5685, nc5686, nc5687, nc5688, nc5689, 
        nc5690, nc5691, nc5692, nc5693, nc5694, nc5695, nc5696, nc5697, 
        nc5698, nc5699, \B_DOUT_TEMPR1[47] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][47] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[47]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[47]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%44%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C44 (.A_DOUT({
        nc5700, nc5701, nc5702, nc5703, nc5704, nc5705, nc5706, nc5707, 
        nc5708, nc5709, nc5710, nc5711, nc5712, nc5713, nc5714, nc5715, 
        nc5716, nc5717, nc5718, \A_DOUT_TEMPR2[44] }), .B_DOUT({nc5719, 
        nc5720, nc5721, nc5722, nc5723, nc5724, nc5725, nc5726, nc5727, 
        nc5728, nc5729, nc5730, nc5731, nc5732, nc5733, nc5734, nc5735, 
        nc5736, nc5737, \B_DOUT_TEMPR2[44] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][44] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[44]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[44]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%29%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C29 (.A_DOUT({
        nc5738, nc5739, nc5740, nc5741, nc5742, nc5743, nc5744, nc5745, 
        nc5746, nc5747, nc5748, nc5749, nc5750, nc5751, nc5752, nc5753, 
        nc5754, nc5755, nc5756, \A_DOUT_TEMPR3[29] }), .B_DOUT({nc5757, 
        nc5758, nc5759, nc5760, nc5761, nc5762, nc5763, nc5764, nc5765, 
        nc5766, nc5767, nc5768, nc5769, nc5770, nc5771, nc5772, nc5773, 
        nc5774, nc5775, \B_DOUT_TEMPR3[29] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][29] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[29]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[29]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%33%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C33 (.A_DOUT({
        nc5776, nc5777, nc5778, nc5779, nc5780, nc5781, nc5782, nc5783, 
        nc5784, nc5785, nc5786, nc5787, nc5788, nc5789, nc5790, nc5791, 
        nc5792, nc5793, nc5794, \A_DOUT_TEMPR3[33] }), .B_DOUT({nc5795, 
        nc5796, nc5797, nc5798, nc5799, nc5800, nc5801, nc5802, nc5803, 
        nc5804, nc5805, nc5806, nc5807, nc5808, nc5809, nc5810, nc5811, 
        nc5812, nc5813, \B_DOUT_TEMPR3[33] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][33] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[33]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[33]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%24%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C24 (.A_DOUT({
        nc5814, nc5815, nc5816, nc5817, nc5818, nc5819, nc5820, nc5821, 
        nc5822, nc5823, nc5824, nc5825, nc5826, nc5827, nc5828, nc5829, 
        nc5830, nc5831, nc5832, \A_DOUT_TEMPR2[24] }), .B_DOUT({nc5833, 
        nc5834, nc5835, nc5836, nc5837, nc5838, nc5839, nc5840, nc5841, 
        nc5842, nc5843, nc5844, nc5845, nc5846, nc5847, nc5848, nc5849, 
        nc5850, nc5851, \B_DOUT_TEMPR2[24] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][24] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[24]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[24]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%55%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C55 (.A_DOUT({
        nc5852, nc5853, nc5854, nc5855, nc5856, nc5857, nc5858, nc5859, 
        nc5860, nc5861, nc5862, nc5863, nc5864, nc5865, nc5866, nc5867, 
        nc5868, nc5869, nc5870, \A_DOUT_TEMPR3[55] }), .B_DOUT({nc5871, 
        nc5872, nc5873, nc5874, nc5875, nc5876, nc5877, nc5878, nc5879, 
        nc5880, nc5881, nc5882, nc5883, nc5884, nc5885, nc5886, nc5887, 
        nc5888, nc5889, \B_DOUT_TEMPR3[55] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][55] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[55]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[55]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%56%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C56 (.A_DOUT({
        nc5890, nc5891, nc5892, nc5893, nc5894, nc5895, nc5896, nc5897, 
        nc5898, nc5899, nc5900, nc5901, nc5902, nc5903, nc5904, nc5905, 
        nc5906, nc5907, nc5908, \A_DOUT_TEMPR3[56] }), .B_DOUT({nc5909, 
        nc5910, nc5911, nc5912, nc5913, nc5914, nc5915, nc5916, nc5917, 
        nc5918, nc5919, nc5920, nc5921, nc5922, nc5923, nc5924, nc5925, 
        nc5926, nc5927, \B_DOUT_TEMPR3[56] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][56] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[56]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[56]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[21]  (.A(\B_DOUT_TEMPR0[21] ), .B(
        \B_DOUT_TEMPR1[21] ), .C(\B_DOUT_TEMPR2[21] ), .D(
        \B_DOUT_TEMPR3[21] ), .Y(B_DOUT[21]));
    OR4 \OR4_A_DOUT[10]  (.A(\A_DOUT_TEMPR0[10] ), .B(
        \A_DOUT_TEMPR1[10] ), .C(\A_DOUT_TEMPR2[10] ), .D(
        \A_DOUT_TEMPR3[10] ), .Y(A_DOUT[10]));
    OR4 \OR4_A_DOUT[43]  (.A(\A_DOUT_TEMPR0[43] ), .B(
        \A_DOUT_TEMPR1[43] ), .C(\A_DOUT_TEMPR2[43] ), .D(
        \A_DOUT_TEMPR3[43] ), .Y(A_DOUT[43]));
    OR4 \OR4_B_DOUT[22]  (.A(\B_DOUT_TEMPR0[22] ), .B(
        \B_DOUT_TEMPR1[22] ), .C(\B_DOUT_TEMPR2[22] ), .D(
        \B_DOUT_TEMPR3[22] ), .Y(B_DOUT[22]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%5%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C5 (.A_DOUT({
        nc5928, nc5929, nc5930, nc5931, nc5932, nc5933, nc5934, nc5935, 
        nc5936, nc5937, nc5938, nc5939, nc5940, nc5941, nc5942, nc5943, 
        nc5944, nc5945, nc5946, \A_DOUT_TEMPR3[5] }), .B_DOUT({nc5947, 
        nc5948, nc5949, nc5950, nc5951, nc5952, nc5953, nc5954, nc5955, 
        nc5956, nc5957, nc5958, nc5959, nc5960, nc5961, nc5962, nc5963, 
        nc5964, nc5965, \B_DOUT_TEMPR3[5] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][5] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[5]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[5]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%52%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C52 (.A_DOUT({
        nc5966, nc5967, nc5968, nc5969, nc5970, nc5971, nc5972, nc5973, 
        nc5974, nc5975, nc5976, nc5977, nc5978, nc5979, nc5980, nc5981, 
        nc5982, nc5983, nc5984, \A_DOUT_TEMPR3[52] }), .B_DOUT({nc5985, 
        nc5986, nc5987, nc5988, nc5989, nc5990, nc5991, nc5992, nc5993, 
        nc5994, nc5995, nc5996, nc5997, nc5998, nc5999, nc6000, nc6001, 
        nc6002, nc6003, \B_DOUT_TEMPR3[52] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][52] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[52]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[52]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    INV \INVBLKX0[0]  (.A(A_ADDR[14]), .Y(\BLKX0[0] ));
    OR4 \OR4_A_DOUT[0]  (.A(\A_DOUT_TEMPR0[0] ), .B(\A_DOUT_TEMPR1[0] )
        , .C(\A_DOUT_TEMPR2[0] ), .D(\A_DOUT_TEMPR3[0] ), .Y(A_DOUT[0])
        );
    OR4 \OR4_B_DOUT[15]  (.A(\B_DOUT_TEMPR0[15] ), .B(
        \B_DOUT_TEMPR1[15] ), .C(\B_DOUT_TEMPR2[15] ), .D(
        \B_DOUT_TEMPR3[15] ), .Y(B_DOUT[15]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%13%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C13 (.A_DOUT({
        nc6004, nc6005, nc6006, nc6007, nc6008, nc6009, nc6010, nc6011, 
        nc6012, nc6013, nc6014, nc6015, nc6016, nc6017, nc6018, nc6019, 
        nc6020, nc6021, nc6022, \A_DOUT_TEMPR2[13] }), .B_DOUT({nc6023, 
        nc6024, nc6025, nc6026, nc6027, nc6028, nc6029, nc6030, nc6031, 
        nc6032, nc6033, nc6034, nc6035, nc6036, nc6037, nc6038, nc6039, 
        nc6040, nc6041, \B_DOUT_TEMPR2[13] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][13] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[13]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[13]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%33%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C33 (.A_DOUT({
        nc6042, nc6043, nc6044, nc6045, nc6046, nc6047, nc6048, nc6049, 
        nc6050, nc6051, nc6052, nc6053, nc6054, nc6055, nc6056, nc6057, 
        nc6058, nc6059, nc6060, \A_DOUT_TEMPR0[33] }), .B_DOUT({nc6061, 
        nc6062, nc6063, nc6064, nc6065, nc6066, nc6067, nc6068, nc6069, 
        nc6070, nc6071, nc6072, nc6073, nc6074, nc6075, nc6076, nc6077, 
        nc6078, nc6079, \B_DOUT_TEMPR0[33] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][33] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[33]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[33]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%6%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C6 (.A_DOUT({
        nc6080, nc6081, nc6082, nc6083, nc6084, nc6085, nc6086, nc6087, 
        nc6088, nc6089, nc6090, nc6091, nc6092, nc6093, nc6094, nc6095, 
        nc6096, nc6097, nc6098, \A_DOUT_TEMPR0[6] }), .B_DOUT({nc6099, 
        nc6100, nc6101, nc6102, nc6103, nc6104, nc6105, nc6106, nc6107, 
        nc6108, nc6109, nc6110, nc6111, nc6112, nc6113, nc6114, nc6115, 
        nc6116, nc6117, \B_DOUT_TEMPR0[6] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[6]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[6]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%62%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C62 (.A_DOUT({
        nc6118, nc6119, nc6120, nc6121, nc6122, nc6123, nc6124, nc6125, 
        nc6126, nc6127, nc6128, nc6129, nc6130, nc6131, nc6132, nc6133, 
        nc6134, nc6135, nc6136, \A_DOUT_TEMPR0[62] }), .B_DOUT({nc6137, 
        nc6138, nc6139, nc6140, nc6141, nc6142, nc6143, nc6144, nc6145, 
        nc6146, nc6147, nc6148, nc6149, nc6150, nc6151, nc6152, nc6153, 
        nc6154, nc6155, \B_DOUT_TEMPR0[62] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][62] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[62]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[62]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[34]  (.A(\A_DOUT_TEMPR0[34] ), .B(
        \A_DOUT_TEMPR1[34] ), .C(\A_DOUT_TEMPR2[34] ), .D(
        \A_DOUT_TEMPR3[34] ), .Y(A_DOUT[34]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%14%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C14 (.A_DOUT({
        nc6156, nc6157, nc6158, nc6159, nc6160, nc6161, nc6162, nc6163, 
        nc6164, nc6165, nc6166, nc6167, nc6168, nc6169, nc6170, nc6171, 
        nc6172, nc6173, nc6174, \A_DOUT_TEMPR0[14] }), .B_DOUT({nc6175, 
        nc6176, nc6177, nc6178, nc6179, nc6180, nc6181, nc6182, nc6183, 
        nc6184, nc6185, nc6186, nc6187, nc6188, nc6189, nc6190, nc6191, 
        nc6192, nc6193, \B_DOUT_TEMPR0[14] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][14] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[14]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[14]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%11%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C11 (.A_DOUT({
        nc6194, nc6195, nc6196, nc6197, nc6198, nc6199, nc6200, nc6201, 
        nc6202, nc6203, nc6204, nc6205, nc6206, nc6207, nc6208, nc6209, 
        nc6210, nc6211, nc6212, \A_DOUT_TEMPR3[11] }), .B_DOUT({nc6213, 
        nc6214, nc6215, nc6216, nc6217, nc6218, nc6219, nc6220, nc6221, 
        nc6222, nc6223, nc6224, nc6225, nc6226, nc6227, nc6228, nc6229, 
        nc6230, nc6231, \B_DOUT_TEMPR3[11] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][11] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[11]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[11]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[59]  (.A(\A_DOUT_TEMPR0[59] ), .B(
        \A_DOUT_TEMPR1[59] ), .C(\A_DOUT_TEMPR2[59] ), .D(
        \A_DOUT_TEMPR3[59] ), .Y(A_DOUT[59]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%8%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C8 (.A_DOUT({
        nc6232, nc6233, nc6234, nc6235, nc6236, nc6237, nc6238, nc6239, 
        nc6240, nc6241, nc6242, nc6243, nc6244, nc6245, nc6246, nc6247, 
        nc6248, nc6249, nc6250, \A_DOUT_TEMPR2[8] }), .B_DOUT({nc6251, 
        nc6252, nc6253, nc6254, nc6255, nc6256, nc6257, nc6258, nc6259, 
        nc6260, nc6261, nc6262, nc6263, nc6264, nc6265, nc6266, nc6267, 
        nc6268, nc6269, \B_DOUT_TEMPR2[8] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][8] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[8]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[8]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[57]  (.A(\A_DOUT_TEMPR0[57] ), .B(
        \A_DOUT_TEMPR1[57] ), .C(\A_DOUT_TEMPR2[57] ), .D(
        \A_DOUT_TEMPR3[57] ), .Y(A_DOUT[57]));
    OR4 \OR4_A_DOUT[56]  (.A(\A_DOUT_TEMPR0[56] ), .B(
        \A_DOUT_TEMPR1[56] ), .C(\A_DOUT_TEMPR2[56] ), .D(
        \A_DOUT_TEMPR3[56] ), .Y(A_DOUT[56]));
    OR4 \OR4_A_DOUT[9]  (.A(\A_DOUT_TEMPR0[9] ), .B(\A_DOUT_TEMPR1[9] )
        , .C(\A_DOUT_TEMPR2[9] ), .D(\A_DOUT_TEMPR3[9] ), .Y(A_DOUT[9])
        );
    OR4 \OR4_A_DOUT[62]  (.A(\A_DOUT_TEMPR0[62] ), .B(
        \A_DOUT_TEMPR1[62] ), .C(\A_DOUT_TEMPR2[62] ), .D(
        \A_DOUT_TEMPR3[62] ), .Y(A_DOUT[62]));
    INV \INVBLKX1[0]  (.A(A_ADDR[15]), .Y(\BLKX1[0] ));
    OR4 \OR4_A_DOUT[28]  (.A(\A_DOUT_TEMPR0[28] ), .B(
        \A_DOUT_TEMPR1[28] ), .C(\A_DOUT_TEMPR2[28] ), .D(
        \A_DOUT_TEMPR3[28] ), .Y(A_DOUT[28]));
    OR4 \OR4_B_DOUT[2]  (.A(\B_DOUT_TEMPR0[2] ), .B(\B_DOUT_TEMPR1[2] )
        , .C(\B_DOUT_TEMPR2[2] ), .D(\B_DOUT_TEMPR3[2] ), .Y(B_DOUT[2])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%61%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C61 (.A_DOUT({
        nc6270, nc6271, nc6272, nc6273, nc6274, nc6275, nc6276, nc6277, 
        nc6278, nc6279, nc6280, nc6281, nc6282, nc6283, nc6284, nc6285, 
        nc6286, nc6287, nc6288, \A_DOUT_TEMPR2[61] }), .B_DOUT({nc6289, 
        nc6290, nc6291, nc6292, nc6293, nc6294, nc6295, nc6296, nc6297, 
        nc6298, nc6299, nc6300, nc6301, nc6302, nc6303, nc6304, nc6305, 
        nc6306, nc6307, \B_DOUT_TEMPR2[61] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][61] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[61]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[61]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%49%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C49 (.A_DOUT({
        nc6308, nc6309, nc6310, nc6311, nc6312, nc6313, nc6314, nc6315, 
        nc6316, nc6317, nc6318, nc6319, nc6320, nc6321, nc6322, nc6323, 
        nc6324, nc6325, nc6326, \A_DOUT_TEMPR2[49] }), .B_DOUT({nc6327, 
        nc6328, nc6329, nc6330, nc6331, nc6332, nc6333, nc6334, nc6335, 
        nc6336, nc6337, nc6338, nc6339, nc6340, nc6341, nc6342, nc6343, 
        nc6344, nc6345, \B_DOUT_TEMPR2[49] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][49] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[49]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[49]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%53%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C53 (.A_DOUT({
        nc6346, nc6347, nc6348, nc6349, nc6350, nc6351, nc6352, nc6353, 
        nc6354, nc6355, nc6356, nc6357, nc6358, nc6359, nc6360, nc6361, 
        nc6362, nc6363, nc6364, \A_DOUT_TEMPR3[53] }), .B_DOUT({nc6365, 
        nc6366, nc6367, nc6368, nc6369, nc6370, nc6371, nc6372, nc6373, 
        nc6374, nc6375, nc6376, nc6377, nc6378, nc6379, nc6380, nc6381, 
        nc6382, nc6383, \B_DOUT_TEMPR3[53] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][53] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[53]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[53]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    INV \INVBLKY0[0]  (.A(B_ADDR[14]), .Y(\BLKY0[0] ));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%15%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C15 (.A_DOUT({
        nc6384, nc6385, nc6386, nc6387, nc6388, nc6389, nc6390, nc6391, 
        nc6392, nc6393, nc6394, nc6395, nc6396, nc6397, nc6398, nc6399, 
        nc6400, nc6401, nc6402, \A_DOUT_TEMPR3[15] }), .B_DOUT({nc6403, 
        nc6404, nc6405, nc6406, nc6407, nc6408, nc6409, nc6410, nc6411, 
        nc6412, nc6413, nc6414, nc6415, nc6416, nc6417, nc6418, nc6419, 
        nc6420, nc6421, \B_DOUT_TEMPR3[15] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][15] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[15]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[15]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[34]  (.A(\B_DOUT_TEMPR0[34] ), .B(
        \B_DOUT_TEMPR1[34] ), .C(\B_DOUT_TEMPR2[34] ), .D(
        \B_DOUT_TEMPR3[34] ), .Y(B_DOUT[34]));
    OR4 \OR4_A_DOUT[49]  (.A(\A_DOUT_TEMPR0[49] ), .B(
        \A_DOUT_TEMPR1[49] ), .C(\A_DOUT_TEMPR2[49] ), .D(
        \A_DOUT_TEMPR3[49] ), .Y(A_DOUT[49]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%29%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C29 (.A_DOUT({
        nc6422, nc6423, nc6424, nc6425, nc6426, nc6427, nc6428, nc6429, 
        nc6430, nc6431, nc6432, nc6433, nc6434, nc6435, nc6436, nc6437, 
        nc6438, nc6439, nc6440, \A_DOUT_TEMPR2[29] }), .B_DOUT({nc6441, 
        nc6442, nc6443, nc6444, nc6445, nc6446, nc6447, nc6448, nc6449, 
        nc6450, nc6451, nc6452, nc6453, nc6454, nc6455, nc6456, nc6457, 
        nc6458, nc6459, \B_DOUT_TEMPR2[29] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][29] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[29]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[29]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%16%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C16 (.A_DOUT({
        nc6460, nc6461, nc6462, nc6463, nc6464, nc6465, nc6466, nc6467, 
        nc6468, nc6469, nc6470, nc6471, nc6472, nc6473, nc6474, nc6475, 
        nc6476, nc6477, nc6478, \A_DOUT_TEMPR3[16] }), .B_DOUT({nc6479, 
        nc6480, nc6481, nc6482, nc6483, nc6484, nc6485, nc6486, nc6487, 
        nc6488, nc6489, nc6490, nc6491, nc6492, nc6493, nc6494, nc6495, 
        nc6496, nc6497, \B_DOUT_TEMPR3[16] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][16] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[16]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[16]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%41%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C41 (.A_DOUT({
        nc6498, nc6499, nc6500, nc6501, nc6502, nc6503, nc6504, nc6505, 
        nc6506, nc6507, nc6508, nc6509, nc6510, nc6511, nc6512, nc6513, 
        nc6514, nc6515, nc6516, \A_DOUT_TEMPR0[41] }), .B_DOUT({nc6517, 
        nc6518, nc6519, nc6520, nc6521, nc6522, nc6523, nc6524, nc6525, 
        nc6526, nc6527, nc6528, nc6529, nc6530, nc6531, nc6532, nc6533, 
        nc6534, nc6535, \B_DOUT_TEMPR0[41] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][41] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[41]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[41]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[47]  (.A(\A_DOUT_TEMPR0[47] ), .B(
        \A_DOUT_TEMPR1[47] ), .C(\A_DOUT_TEMPR2[47] ), .D(
        \A_DOUT_TEMPR3[47] ), .Y(A_DOUT[47]));
    OR4 \OR4_A_DOUT[46]  (.A(\A_DOUT_TEMPR0[46] ), .B(
        \A_DOUT_TEMPR1[46] ), .C(\A_DOUT_TEMPR2[46] ), .D(
        \A_DOUT_TEMPR3[46] ), .Y(A_DOUT[46]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%63%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C63 (.A_DOUT({
        nc6536, nc6537, nc6538, nc6539, nc6540, nc6541, nc6542, nc6543, 
        nc6544, nc6545, nc6546, nc6547, nc6548, nc6549, nc6550, nc6551, 
        nc6552, nc6553, nc6554, \A_DOUT_TEMPR0[63] }), .B_DOUT({nc6555, 
        nc6556, nc6557, nc6558, nc6559, nc6560, nc6561, nc6562, nc6563, 
        nc6564, nc6565, nc6566, nc6567, nc6568, nc6569, nc6570, nc6571, 
        nc6572, nc6573, \B_DOUT_TEMPR0[63] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][63] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[63]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[63]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%30%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C30 (.A_DOUT({
        nc6574, nc6575, nc6576, nc6577, nc6578, nc6579, nc6580, nc6581, 
        nc6582, nc6583, nc6584, nc6585, nc6586, nc6587, nc6588, nc6589, 
        nc6590, nc6591, nc6592, \A_DOUT_TEMPR3[30] }), .B_DOUT({nc6593, 
        nc6594, nc6595, nc6596, nc6597, nc6598, nc6599, nc6600, nc6601, 
        nc6602, nc6603, nc6604, nc6605, nc6606, nc6607, nc6608, nc6609, 
        nc6610, nc6611, \B_DOUT_TEMPR3[30] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][30] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[30]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[30]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%38%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C38 (.A_DOUT({
        nc6612, nc6613, nc6614, nc6615, nc6616, nc6617, nc6618, nc6619, 
        nc6620, nc6621, nc6622, nc6623, nc6624, nc6625, nc6626, nc6627, 
        nc6628, nc6629, nc6630, \A_DOUT_TEMPR3[38] }), .B_DOUT({nc6631, 
        nc6632, nc6633, nc6634, nc6635, nc6636, nc6637, nc6638, nc6639, 
        nc6640, nc6641, nc6642, nc6643, nc6644, nc6645, nc6646, nc6647, 
        nc6648, nc6649, \B_DOUT_TEMPR3[38] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][38] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[38]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[38]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%31%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C31 (.A_DOUT({
        nc6650, nc6651, nc6652, nc6653, nc6654, nc6655, nc6656, nc6657, 
        nc6658, nc6659, nc6660, nc6661, nc6662, nc6663, nc6664, nc6665, 
        nc6666, nc6667, nc6668, \A_DOUT_TEMPR1[31] }), .B_DOUT({nc6669, 
        nc6670, nc6671, nc6672, nc6673, nc6674, nc6675, nc6676, nc6677, 
        nc6678, nc6679, nc6680, nc6681, nc6682, nc6683, nc6684, nc6685, 
        nc6686, nc6687, \B_DOUT_TEMPR1[31] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][31] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[31]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[31]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[14]  (.A(\A_DOUT_TEMPR0[14] ), .B(
        \A_DOUT_TEMPR1[14] ), .C(\A_DOUT_TEMPR2[14] ), .D(
        \A_DOUT_TEMPR3[14] ), .Y(A_DOUT[14]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%1%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C1 (.A_DOUT({
        nc6688, nc6689, nc6690, nc6691, nc6692, nc6693, nc6694, nc6695, 
        nc6696, nc6697, nc6698, nc6699, nc6700, nc6701, nc6702, nc6703, 
        nc6704, nc6705, nc6706, \A_DOUT_TEMPR3[1] }), .B_DOUT({nc6707, 
        nc6708, nc6709, nc6710, nc6711, nc6712, nc6713, nc6714, nc6715, 
        nc6716, nc6717, nc6718, nc6719, nc6720, nc6721, nc6722, nc6723, 
        nc6724, nc6725, \B_DOUT_TEMPR3[1] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][1] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[1]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[1]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%12%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C12 (.A_DOUT({
        nc6726, nc6727, nc6728, nc6729, nc6730, nc6731, nc6732, nc6733, 
        nc6734, nc6735, nc6736, nc6737, nc6738, nc6739, nc6740, nc6741, 
        nc6742, nc6743, nc6744, \A_DOUT_TEMPR3[12] }), .B_DOUT({nc6745, 
        nc6746, nc6747, nc6748, nc6749, nc6750, nc6751, nc6752, nc6753, 
        nc6754, nc6755, nc6756, nc6757, nc6758, nc6759, nc6760, nc6761, 
        nc6762, nc6763, \B_DOUT_TEMPR3[12] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][12] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[12]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[12]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%54%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C54 (.A_DOUT({
        nc6764, nc6765, nc6766, nc6767, nc6768, nc6769, nc6770, nc6771, 
        nc6772, nc6773, nc6774, nc6775, nc6776, nc6777, nc6778, nc6779, 
        nc6780, nc6781, nc6782, \A_DOUT_TEMPR0[54] }), .B_DOUT({nc6783, 
        nc6784, nc6785, nc6786, nc6787, nc6788, nc6789, nc6790, nc6791, 
        nc6792, nc6793, nc6794, nc6795, nc6796, nc6797, nc6798, nc6799, 
        nc6800, nc6801, \B_DOUT_TEMPR0[54] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][54] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[54]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[54]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%31%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C31 (.A_DOUT({
        nc6802, nc6803, nc6804, nc6805, nc6806, nc6807, nc6808, nc6809, 
        nc6810, nc6811, nc6812, nc6813, nc6814, nc6815, nc6816, nc6817, 
        nc6818, nc6819, nc6820, \A_DOUT_TEMPR2[31] }), .B_DOUT({nc6821, 
        nc6822, nc6823, nc6824, nc6825, nc6826, nc6827, nc6828, nc6829, 
        nc6830, nc6831, nc6832, nc6833, nc6834, nc6835, nc6836, nc6837, 
        nc6838, nc6839, \B_DOUT_TEMPR2[31] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][31] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[31]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[31]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%7%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C7 (.A_DOUT({
        nc6840, nc6841, nc6842, nc6843, nc6844, nc6845, nc6846, nc6847, 
        nc6848, nc6849, nc6850, nc6851, nc6852, nc6853, nc6854, nc6855, 
        nc6856, nc6857, nc6858, \A_DOUT_TEMPR1[7] }), .B_DOUT({nc6859, 
        nc6860, nc6861, nc6862, nc6863, nc6864, nc6865, nc6866, nc6867, 
        nc6868, nc6869, nc6870, nc6871, nc6872, nc6873, nc6874, nc6875, 
        nc6876, nc6877, \B_DOUT_TEMPR1[7] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][7] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[7]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[7]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%45%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C45 (.A_DOUT({
        nc6878, nc6879, nc6880, nc6881, nc6882, nc6883, nc6884, nc6885, 
        nc6886, nc6887, nc6888, nc6889, nc6890, nc6891, nc6892, nc6893, 
        nc6894, nc6895, nc6896, \A_DOUT_TEMPR0[45] }), .B_DOUT({nc6897, 
        nc6898, nc6899, nc6900, nc6901, nc6902, nc6903, nc6904, nc6905, 
        nc6906, nc6907, nc6908, nc6909, nc6910, nc6911, nc6912, nc6913, 
        nc6914, nc6915, \B_DOUT_TEMPR0[45] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][45] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[45]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[45]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[31]  (.A(\B_DOUT_TEMPR0[31] ), .B(
        \B_DOUT_TEMPR1[31] ), .C(\B_DOUT_TEMPR2[31] ), .D(
        \B_DOUT_TEMPR3[31] ), .Y(B_DOUT[31]));
    INV \INVBLKY1[0]  (.A(B_ADDR[15]), .Y(\BLKY1[0] ));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%46%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C46 (.A_DOUT({
        nc6916, nc6917, nc6918, nc6919, nc6920, nc6921, nc6922, nc6923, 
        nc6924, nc6925, nc6926, nc6927, nc6928, nc6929, nc6930, nc6931, 
        nc6932, nc6933, nc6934, \A_DOUT_TEMPR0[46] }), .B_DOUT({nc6935, 
        nc6936, nc6937, nc6938, nc6939, nc6940, nc6941, nc6942, nc6943, 
        nc6944, nc6945, nc6946, nc6947, nc6948, nc6949, nc6950, nc6951, 
        nc6952, nc6953, \B_DOUT_TEMPR0[46] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][46] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[46]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[46]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[6]  (.A(\B_DOUT_TEMPR0[6] ), .B(\B_DOUT_TEMPR1[6] )
        , .C(\B_DOUT_TEMPR2[6] ), .D(\B_DOUT_TEMPR3[6] ), .Y(B_DOUT[6])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%6%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C6 (.A_DOUT({
        nc6954, nc6955, nc6956, nc6957, nc6958, nc6959, nc6960, nc6961, 
        nc6962, nc6963, nc6964, nc6965, nc6966, nc6967, nc6968, nc6969, 
        nc6970, nc6971, nc6972, \A_DOUT_TEMPR2[6] }), .B_DOUT({nc6973, 
        nc6974, nc6975, nc6976, nc6977, nc6978, nc6979, nc6980, nc6981, 
        nc6982, nc6983, nc6984, nc6985, nc6986, nc6987, nc6988, nc6989, 
        nc6990, nc6991, \B_DOUT_TEMPR2[6] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][6] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[6]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[6]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%61%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C61 (.A_DOUT({
        nc6992, nc6993, nc6994, nc6995, nc6996, nc6997, nc6998, nc6999, 
        nc7000, nc7001, nc7002, nc7003, nc7004, nc7005, nc7006, nc7007, 
        nc7008, nc7009, nc7010, \A_DOUT_TEMPR3[61] }), .B_DOUT({nc7011, 
        nc7012, nc7013, nc7014, nc7015, nc7016, nc7017, nc7018, nc7019, 
        nc7020, nc7021, nc7022, nc7023, nc7024, nc7025, nc7026, nc7027, 
        nc7028, nc7029, \B_DOUT_TEMPR3[61] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][61] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[61]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[61]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%35%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C35 (.A_DOUT({
        nc7030, nc7031, nc7032, nc7033, nc7034, nc7035, nc7036, nc7037, 
        nc7038, nc7039, nc7040, nc7041, nc7042, nc7043, nc7044, nc7045, 
        nc7046, nc7047, nc7048, \A_DOUT_TEMPR1[35] }), .B_DOUT({nc7049, 
        nc7050, nc7051, nc7052, nc7053, nc7054, nc7055, nc7056, nc7057, 
        nc7058, nc7059, nc7060, nc7061, nc7062, nc7063, nc7064, nc7065, 
        nc7066, nc7067, \B_DOUT_TEMPR1[35] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][35] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[35]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[35]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%62%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C62 (.A_DOUT({
        nc7068, nc7069, nc7070, nc7071, nc7072, nc7073, nc7074, nc7075, 
        nc7076, nc7077, nc7078, nc7079, nc7080, nc7081, nc7082, nc7083, 
        nc7084, nc7085, nc7086, \A_DOUT_TEMPR2[62] }), .B_DOUT({nc7087, 
        nc7088, nc7089, nc7090, nc7091, nc7092, nc7093, nc7094, nc7095, 
        nc7096, nc7097, nc7098, nc7099, nc7100, nc7101, nc7102, nc7103, 
        nc7104, nc7105, \B_DOUT_TEMPR2[62] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][62] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[62]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[62]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[32]  (.A(\B_DOUT_TEMPR0[32] ), .B(
        \B_DOUT_TEMPR1[32] ), .C(\B_DOUT_TEMPR2[32] ), .D(
        \B_DOUT_TEMPR3[32] ), .Y(B_DOUT[32]));
    OR4 \OR4_B_DOUT[14]  (.A(\B_DOUT_TEMPR0[14] ), .B(
        \B_DOUT_TEMPR1[14] ), .C(\B_DOUT_TEMPR2[14] ), .D(
        \B_DOUT_TEMPR3[14] ), .Y(B_DOUT[14]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%36%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C36 (.A_DOUT({
        nc7106, nc7107, nc7108, nc7109, nc7110, nc7111, nc7112, nc7113, 
        nc7114, nc7115, nc7116, nc7117, nc7118, nc7119, nc7120, nc7121, 
        nc7122, nc7123, nc7124, \A_DOUT_TEMPR1[36] }), .B_DOUT({nc7125, 
        nc7126, nc7127, nc7128, nc7129, nc7130, nc7131, nc7132, nc7133, 
        nc7134, nc7135, nc7136, nc7137, nc7138, nc7139, nc7140, nc7141, 
        nc7142, nc7143, \B_DOUT_TEMPR1[36] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][36] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[36]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[36]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%8%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C8 (.A_DOUT({
        nc7144, nc7145, nc7146, nc7147, nc7148, nc7149, nc7150, nc7151, 
        nc7152, nc7153, nc7154, nc7155, nc7156, nc7157, nc7158, nc7159, 
        nc7160, nc7161, nc7162, \A_DOUT_TEMPR0[8] }), .B_DOUT({nc7163, 
        nc7164, nc7165, nc7166, nc7167, nc7168, nc7169, nc7170, nc7171, 
        nc7172, nc7173, nc7174, nc7175, nc7176, nc7177, nc7178, nc7179, 
        nc7180, nc7181, \B_DOUT_TEMPR0[8] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[8]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[8]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%19%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C19 (.A_DOUT({
        nc7182, nc7183, nc7184, nc7185, nc7186, nc7187, nc7188, nc7189, 
        nc7190, nc7191, nc7192, nc7193, nc7194, nc7195, nc7196, nc7197, 
        nc7198, nc7199, nc7200, \A_DOUT_TEMPR0[19] }), .B_DOUT({nc7201, 
        nc7202, nc7203, nc7204, nc7205, nc7206, nc7207, nc7208, nc7209, 
        nc7210, nc7211, nc7212, nc7213, nc7214, nc7215, nc7216, nc7217, 
        nc7218, nc7219, \B_DOUT_TEMPR0[19] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][19] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[19]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[19]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%10%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C10 (.A_DOUT({
        nc7220, nc7221, nc7222, nc7223, nc7224, nc7225, nc7226, nc7227, 
        nc7228, nc7229, nc7230, nc7231, nc7232, nc7233, nc7234, nc7235, 
        nc7236, nc7237, nc7238, \A_DOUT_TEMPR2[10] }), .B_DOUT({nc7239, 
        nc7240, nc7241, nc7242, nc7243, nc7244, nc7245, nc7246, nc7247, 
        nc7248, nc7249, nc7250, nc7251, nc7252, nc7253, nc7254, nc7255, 
        nc7256, nc7257, \B_DOUT_TEMPR2[10] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][10] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[10]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[10]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%35%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C35 (.A_DOUT({
        nc7258, nc7259, nc7260, nc7261, nc7262, nc7263, nc7264, nc7265, 
        nc7266, nc7267, nc7268, nc7269, nc7270, nc7271, nc7272, nc7273, 
        nc7274, nc7275, nc7276, \A_DOUT_TEMPR2[35] }), .B_DOUT({nc7277, 
        nc7278, nc7279, nc7280, nc7281, nc7282, nc7283, nc7284, nc7285, 
        nc7286, nc7287, nc7288, nc7289, nc7290, nc7291, nc7292, nc7293, 
        nc7294, nc7295, \B_DOUT_TEMPR2[35] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][35] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[35]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[35]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%30%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C30 (.A_DOUT({
        nc7296, nc7297, nc7298, nc7299, nc7300, nc7301, nc7302, nc7303, 
        nc7304, nc7305, nc7306, nc7307, nc7308, nc7309, nc7310, nc7311, 
        nc7312, nc7313, nc7314, \A_DOUT_TEMPR0[30] }), .B_DOUT({nc7315, 
        nc7316, nc7317, nc7318, nc7319, nc7320, nc7321, nc7322, nc7323, 
        nc7324, nc7325, nc7326, nc7327, nc7328, nc7329, nc7330, nc7331, 
        nc7332, nc7333, \B_DOUT_TEMPR0[30] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][30] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[30]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[30]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%4%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C4 (.A_DOUT({
        nc7334, nc7335, nc7336, nc7337, nc7338, nc7339, nc7340, nc7341, 
        nc7342, nc7343, nc7344, nc7345, nc7346, nc7347, nc7348, nc7349, 
        nc7350, nc7351, nc7352, \A_DOUT_TEMPR0[4] }), .B_DOUT({nc7353, 
        nc7354, nc7355, nc7356, nc7357, nc7358, nc7359, nc7360, nc7361, 
        nc7362, nc7363, nc7364, nc7365, nc7366, nc7367, nc7368, nc7369, 
        nc7370, nc7371, \B_DOUT_TEMPR0[4] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[4]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[4]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%18%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C18 (.A_DOUT({
        nc7372, nc7373, nc7374, nc7375, nc7376, nc7377, nc7378, nc7379, 
        nc7380, nc7381, nc7382, nc7383, nc7384, nc7385, nc7386, nc7387, 
        nc7388, nc7389, nc7390, \A_DOUT_TEMPR2[18] }), .B_DOUT({nc7391, 
        nc7392, nc7393, nc7394, nc7395, nc7396, nc7397, nc7398, nc7399, 
        nc7400, nc7401, nc7402, nc7403, nc7404, nc7405, nc7406, nc7407, 
        nc7408, nc7409, \B_DOUT_TEMPR2[18] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][18] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[18]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[18]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%38%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C38 (.A_DOUT({
        nc7410, nc7411, nc7412, nc7413, nc7414, nc7415, nc7416, nc7417, 
        nc7418, nc7419, nc7420, nc7421, nc7422, nc7423, nc7424, nc7425, 
        nc7426, nc7427, nc7428, \A_DOUT_TEMPR0[38] }), .B_DOUT({nc7429, 
        nc7430, nc7431, nc7432, nc7433, nc7434, nc7435, nc7436, nc7437, 
        nc7438, nc7439, nc7440, nc7441, nc7442, nc7443, nc7444, nc7445, 
        nc7446, nc7447, \B_DOUT_TEMPR0[38] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][38] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[38]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[38]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%42%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C42 (.A_DOUT({
        nc7448, nc7449, nc7450, nc7451, nc7452, nc7453, nc7454, nc7455, 
        nc7456, nc7457, nc7458, nc7459, nc7460, nc7461, nc7462, nc7463, 
        nc7464, nc7465, nc7466, \A_DOUT_TEMPR0[42] }), .B_DOUT({nc7467, 
        nc7468, nc7469, nc7470, nc7471, nc7472, nc7473, nc7474, nc7475, 
        nc7476, nc7477, nc7478, nc7479, nc7480, nc7481, nc7482, nc7483, 
        nc7484, nc7485, \B_DOUT_TEMPR0[42] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][42] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[42]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[42]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%36%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C36 (.A_DOUT({
        nc7486, nc7487, nc7488, nc7489, nc7490, nc7491, nc7492, nc7493, 
        nc7494, nc7495, nc7496, nc7497, nc7498, nc7499, nc7500, nc7501, 
        nc7502, nc7503, nc7504, \A_DOUT_TEMPR2[36] }), .B_DOUT({nc7505, 
        nc7506, nc7507, nc7508, nc7509, nc7510, nc7511, nc7512, nc7513, 
        nc7514, nc7515, nc7516, nc7517, nc7518, nc7519, nc7520, nc7521, 
        nc7522, nc7523, \B_DOUT_TEMPR2[36] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][36] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[36]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[36]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[23]  (.A(\A_DOUT_TEMPR0[23] ), .B(
        \A_DOUT_TEMPR1[23] ), .C(\A_DOUT_TEMPR2[23] ), .D(
        \A_DOUT_TEMPR3[23] ), .Y(A_DOUT[23]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%54%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C54 (.A_DOUT({
        nc7524, nc7525, nc7526, nc7527, nc7528, nc7529, nc7530, nc7531, 
        nc7532, nc7533, nc7534, nc7535, nc7536, nc7537, nc7538, nc7539, 
        nc7540, nc7541, nc7542, \A_DOUT_TEMPR1[54] }), .B_DOUT({nc7543, 
        nc7544, nc7545, nc7546, nc7547, nc7548, nc7549, nc7550, nc7551, 
        nc7552, nc7553, nc7554, nc7555, nc7556, nc7557, nc7558, nc7559, 
        nc7560, nc7561, \B_DOUT_TEMPR1[54] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][54] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[54]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[54]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%3%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C3 (.A_DOUT({
        nc7562, nc7563, nc7564, nc7565, nc7566, nc7567, nc7568, nc7569, 
        nc7570, nc7571, nc7572, nc7573, nc7574, nc7575, nc7576, nc7577, 
        nc7578, nc7579, nc7580, \A_DOUT_TEMPR1[3] }), .B_DOUT({nc7581, 
        nc7582, nc7583, nc7584, nc7585, nc7586, nc7587, nc7588, nc7589, 
        nc7590, nc7591, nc7592, nc7593, nc7594, nc7595, nc7596, nc7597, 
        nc7598, nc7599, \B_DOUT_TEMPR1[3] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][3] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[3]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[3]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%32%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C32 (.A_DOUT({
        nc7600, nc7601, nc7602, nc7603, nc7604, nc7605, nc7606, nc7607, 
        nc7608, nc7609, nc7610, nc7611, nc7612, nc7613, nc7614, nc7615, 
        nc7616, nc7617, nc7618, \A_DOUT_TEMPR1[32] }), .B_DOUT({nc7619, 
        nc7620, nc7621, nc7622, nc7623, nc7624, nc7625, nc7626, nc7627, 
        nc7628, nc7629, nc7630, nc7631, nc7632, nc7633, nc7634, nc7635, 
        nc7636, nc7637, \B_DOUT_TEMPR1[32] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][32] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[32]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[32]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%21%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C21 (.A_DOUT({
        nc7638, nc7639, nc7640, nc7641, nc7642, nc7643, nc7644, nc7645, 
        nc7646, nc7647, nc7648, nc7649, nc7650, nc7651, nc7652, nc7653, 
        nc7654, nc7655, nc7656, \A_DOUT_TEMPR0[21] }), .B_DOUT({nc7657, 
        nc7658, nc7659, nc7660, nc7661, nc7662, nc7663, nc7664, nc7665, 
        nc7666, nc7667, nc7668, nc7669, nc7670, nc7671, nc7672, nc7673, 
        nc7674, nc7675, \B_DOUT_TEMPR0[21] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][21] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[21]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[21]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%13%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C13 (.A_DOUT({
        nc7676, nc7677, nc7678, nc7679, nc7680, nc7681, nc7682, nc7683, 
        nc7684, nc7685, nc7686, nc7687, nc7688, nc7689, nc7690, nc7691, 
        nc7692, nc7693, nc7694, \A_DOUT_TEMPR3[13] }), .B_DOUT({nc7695, 
        nc7696, nc7697, nc7698, nc7699, nc7700, nc7701, nc7702, nc7703, 
        nc7704, nc7705, nc7706, nc7707, nc7708, nc7709, nc7710, nc7711, 
        nc7712, nc7713, \B_DOUT_TEMPR3[13] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][13] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[13]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[13]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%3%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C3 (.A_DOUT({
        nc7714, nc7715, nc7716, nc7717, nc7718, nc7719, nc7720, nc7721, 
        nc7722, nc7723, nc7724, nc7725, nc7726, nc7727, nc7728, nc7729, 
        nc7730, nc7731, nc7732, \A_DOUT_TEMPR2[3] }), .B_DOUT({nc7733, 
        nc7734, nc7735, nc7736, nc7737, nc7738, nc7739, nc7740, nc7741, 
        nc7742, nc7743, nc7744, nc7745, nc7746, nc7747, nc7748, nc7749, 
        nc7750, nc7751, \B_DOUT_TEMPR2[3] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][3] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[3]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[3]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%54%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C54 (.A_DOUT({
        nc7752, nc7753, nc7754, nc7755, nc7756, nc7757, nc7758, nc7759, 
        nc7760, nc7761, nc7762, nc7763, nc7764, nc7765, nc7766, nc7767, 
        nc7768, nc7769, nc7770, \A_DOUT_TEMPR2[54] }), .B_DOUT({nc7771, 
        nc7772, nc7773, nc7774, nc7775, nc7776, nc7777, nc7778, nc7779, 
        nc7780, nc7781, nc7782, nc7783, nc7784, nc7785, nc7786, nc7787, 
        nc7788, nc7789, \B_DOUT_TEMPR2[54] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][54] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[54]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[54]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%32%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C32 (.A_DOUT({
        nc7790, nc7791, nc7792, nc7793, nc7794, nc7795, nc7796, nc7797, 
        nc7798, nc7799, nc7800, nc7801, nc7802, nc7803, nc7804, nc7805, 
        nc7806, nc7807, nc7808, \A_DOUT_TEMPR2[32] }), .B_DOUT({nc7809, 
        nc7810, nc7811, nc7812, nc7813, nc7814, nc7815, nc7816, nc7817, 
        nc7818, nc7819, nc7820, nc7821, nc7822, nc7823, nc7824, nc7825, 
        nc7826, nc7827, \B_DOUT_TEMPR2[32] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][32] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[32]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[32]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%11%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C11 (.A_DOUT({
        nc7828, nc7829, nc7830, nc7831, nc7832, nc7833, nc7834, nc7835, 
        nc7836, nc7837, nc7838, nc7839, nc7840, nc7841, nc7842, nc7843, 
        nc7844, nc7845, nc7846, \A_DOUT_TEMPR1[11] }), .B_DOUT({nc7847, 
        nc7848, nc7849, nc7850, nc7851, nc7852, nc7853, nc7854, nc7855, 
        nc7856, nc7857, nc7858, nc7859, nc7860, nc7861, nc7862, nc7863, 
        nc7864, nc7865, \B_DOUT_TEMPR1[11] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][11] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[11]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[11]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[11]  (.A(\B_DOUT_TEMPR0[11] ), .B(
        \B_DOUT_TEMPR1[11] ), .C(\B_DOUT_TEMPR2[11] ), .D(
        \B_DOUT_TEMPR3[11] ), .Y(B_DOUT[11]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%6%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C6 (.A_DOUT({
        nc7866, nc7867, nc7868, nc7869, nc7870, nc7871, nc7872, nc7873, 
        nc7874, nc7875, nc7876, nc7877, nc7878, nc7879, nc7880, nc7881, 
        nc7882, nc7883, nc7884, \A_DOUT_TEMPR3[6] }), .B_DOUT({nc7885, 
        nc7886, nc7887, nc7888, nc7889, nc7890, nc7891, nc7892, nc7893, 
        nc7894, nc7895, nc7896, nc7897, nc7898, nc7899, nc7900, nc7901, 
        nc7902, nc7903, \B_DOUT_TEMPR3[6] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][6] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[6]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[6]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%63%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C63 (.A_DOUT({
        nc7904, nc7905, nc7906, nc7907, nc7908, nc7909, nc7910, nc7911, 
        nc7912, nc7913, nc7914, nc7915, nc7916, nc7917, nc7918, nc7919, 
        nc7920, nc7921, nc7922, \A_DOUT_TEMPR2[63] }), .B_DOUT({nc7923, 
        nc7924, nc7925, nc7926, nc7927, nc7928, nc7929, nc7930, nc7931, 
        nc7932, nc7933, nc7934, nc7935, nc7936, nc7937, nc7938, nc7939, 
        nc7940, nc7941, \B_DOUT_TEMPR2[63] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][63] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[63]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[63]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%50%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C50 (.A_DOUT({
        nc7942, nc7943, nc7944, nc7945, nc7946, nc7947, nc7948, nc7949, 
        nc7950, nc7951, nc7952, nc7953, nc7954, nc7955, nc7956, nc7957, 
        nc7958, nc7959, nc7960, \A_DOUT_TEMPR3[50] }), .B_DOUT({nc7961, 
        nc7962, nc7963, nc7964, nc7965, nc7966, nc7967, nc7968, nc7969, 
        nc7970, nc7971, nc7972, nc7973, nc7974, nc7975, nc7976, nc7977, 
        nc7978, nc7979, \B_DOUT_TEMPR3[50] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][50] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[50]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[50]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%62%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C62 (.A_DOUT({
        nc7980, nc7981, nc7982, nc7983, nc7984, nc7985, nc7986, nc7987, 
        nc7988, nc7989, nc7990, nc7991, nc7992, nc7993, nc7994, nc7995, 
        nc7996, nc7997, nc7998, \A_DOUT_TEMPR3[62] }), .B_DOUT({nc7999, 
        nc8000, nc8001, nc8002, nc8003, nc8004, nc8005, nc8006, nc8007, 
        nc8008, nc8009, nc8010, nc8011, nc8012, nc8013, nc8014, nc8015, 
        nc8016, nc8017, \B_DOUT_TEMPR3[62] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][62] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[62]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[62]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[12]  (.A(\B_DOUT_TEMPR0[12] ), .B(
        \B_DOUT_TEMPR1[12] ), .C(\B_DOUT_TEMPR2[12] ), .D(
        \B_DOUT_TEMPR3[12] ), .Y(B_DOUT[12]));
    OR4 \OR4_A_DOUT[1]  (.A(\A_DOUT_TEMPR0[1] ), .B(\A_DOUT_TEMPR1[1] )
        , .C(\A_DOUT_TEMPR2[1] ), .D(\A_DOUT_TEMPR3[1] ), .Y(A_DOUT[1])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%58%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C58 (.A_DOUT({
        nc8018, nc8019, nc8020, nc8021, nc8022, nc8023, nc8024, nc8025, 
        nc8026, nc8027, nc8028, nc8029, nc8030, nc8031, nc8032, nc8033, 
        nc8034, nc8035, nc8036, \A_DOUT_TEMPR3[58] }), .B_DOUT({nc8037, 
        nc8038, nc8039, nc8040, nc8041, nc8042, nc8043, nc8044, nc8045, 
        nc8046, nc8047, nc8048, nc8049, nc8050, nc8051, nc8052, nc8053, 
        nc8054, nc8055, \B_DOUT_TEMPR3[58] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][58] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[58]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[58]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[38]  (.A(\A_DOUT_TEMPR0[38] ), .B(
        \A_DOUT_TEMPR1[38] ), .C(\A_DOUT_TEMPR2[38] ), .D(
        \A_DOUT_TEMPR3[38] ), .Y(A_DOUT[38]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%25%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C25 (.A_DOUT({
        nc8056, nc8057, nc8058, nc8059, nc8060, nc8061, nc8062, nc8063, 
        nc8064, nc8065, nc8066, nc8067, nc8068, nc8069, nc8070, nc8071, 
        nc8072, nc8073, nc8074, \A_DOUT_TEMPR0[25] }), .B_DOUT({nc8075, 
        nc8076, nc8077, nc8078, nc8079, nc8080, nc8081, nc8082, nc8083, 
        nc8084, nc8085, nc8086, nc8087, nc8088, nc8089, nc8090, nc8091, 
        nc8092, nc8093, \B_DOUT_TEMPR0[25] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][25] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[25]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[25]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[7]  (.A(\B_DOUT_TEMPR0[7] ), .B(\B_DOUT_TEMPR1[7] )
        , .C(\B_DOUT_TEMPR2[7] ), .D(\B_DOUT_TEMPR3[7] ), .Y(B_DOUT[7])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%26%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C26 (.A_DOUT({
        nc8094, nc8095, nc8096, nc8097, nc8098, nc8099, nc8100, nc8101, 
        nc8102, nc8103, nc8104, nc8105, nc8106, nc8107, nc8108, nc8109, 
        nc8110, nc8111, nc8112, \A_DOUT_TEMPR0[26] }), .B_DOUT({nc8113, 
        nc8114, nc8115, nc8116, nc8117, nc8118, nc8119, nc8120, nc8121, 
        nc8122, nc8123, nc8124, nc8125, nc8126, nc8127, nc8128, nc8129, 
        nc8130, nc8131, \B_DOUT_TEMPR0[26] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][26] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[26]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[26]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%43%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C43 (.A_DOUT({
        nc8132, nc8133, nc8134, nc8135, nc8136, nc8137, nc8138, nc8139, 
        nc8140, nc8141, nc8142, nc8143, nc8144, nc8145, nc8146, nc8147, 
        nc8148, nc8149, nc8150, \A_DOUT_TEMPR0[43] }), .B_DOUT({nc8151, 
        nc8152, nc8153, nc8154, nc8155, nc8156, nc8157, nc8158, nc8159, 
        nc8160, nc8161, nc8162, nc8163, nc8164, nc8165, nc8166, nc8167, 
        nc8168, nc8169, \B_DOUT_TEMPR0[43] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][43] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[43]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[43]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%59%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C59 (.A_DOUT({
        nc8170, nc8171, nc8172, nc8173, nc8174, nc8175, nc8176, nc8177, 
        nc8178, nc8179, nc8180, nc8181, nc8182, nc8183, nc8184, nc8185, 
        nc8186, nc8187, nc8188, \A_DOUT_TEMPR0[59] }), .B_DOUT({nc8189, 
        nc8190, nc8191, nc8192, nc8193, nc8194, nc8195, nc8196, nc8197, 
        nc8198, nc8199, nc8200, nc8201, nc8202, nc8203, nc8204, nc8205, 
        nc8206, nc8207, \B_DOUT_TEMPR0[59] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][59] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[59]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[59]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%15%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C15 (.A_DOUT({
        nc8208, nc8209, nc8210, nc8211, nc8212, nc8213, nc8214, nc8215, 
        nc8216, nc8217, nc8218, nc8219, nc8220, nc8221, nc8222, nc8223, 
        nc8224, nc8225, nc8226, \A_DOUT_TEMPR1[15] }), .B_DOUT({nc8227, 
        nc8228, nc8229, nc8230, nc8231, nc8232, nc8233, nc8234, nc8235, 
        nc8236, nc8237, nc8238, nc8239, nc8240, nc8241, nc8242, nc8243, 
        nc8244, nc8245, \B_DOUT_TEMPR1[15] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][15] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[15]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[15]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%60%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C60 (.A_DOUT({
        nc8246, nc8247, nc8248, nc8249, nc8250, nc8251, nc8252, nc8253, 
        nc8254, nc8255, nc8256, nc8257, nc8258, nc8259, nc8260, nc8261, 
        nc8262, nc8263, nc8264, \A_DOUT_TEMPR0[60] }), .B_DOUT({nc8265, 
        nc8266, nc8267, nc8268, nc8269, nc8270, nc8271, nc8272, nc8273, 
        nc8274, nc8275, nc8276, nc8277, nc8278, nc8279, nc8280, nc8281, 
        nc8282, nc8283, \B_DOUT_TEMPR0[60] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][60] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[60]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[60]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[59]  (.A(\B_DOUT_TEMPR0[59] ), .B(
        \B_DOUT_TEMPR1[59] ), .C(\B_DOUT_TEMPR2[59] ), .D(
        \B_DOUT_TEMPR3[59] ), .Y(B_DOUT[59]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%16%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C16 (.A_DOUT({
        nc8284, nc8285, nc8286, nc8287, nc8288, nc8289, nc8290, nc8291, 
        nc8292, nc8293, nc8294, nc8295, nc8296, nc8297, nc8298, nc8299, 
        nc8300, nc8301, nc8302, \A_DOUT_TEMPR1[16] }), .B_DOUT({nc8303, 
        nc8304, nc8305, nc8306, nc8307, nc8308, nc8309, nc8310, nc8311, 
        nc8312, nc8313, nc8314, nc8315, nc8316, nc8317, nc8318, nc8319, 
        nc8320, nc8321, \B_DOUT_TEMPR1[16] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][16] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[16]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[16]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%37%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C37 (.A_DOUT({
        nc8322, nc8323, nc8324, nc8325, nc8326, nc8327, nc8328, nc8329, 
        nc8330, nc8331, nc8332, nc8333, nc8334, nc8335, nc8336, nc8337, 
        nc8338, nc8339, nc8340, \A_DOUT_TEMPR3[37] }), .B_DOUT({nc8341, 
        nc8342, nc8343, nc8344, nc8345, nc8346, nc8347, nc8348, nc8349, 
        nc8350, nc8351, nc8352, nc8353, nc8354, nc8355, nc8356, nc8357, 
        nc8358, nc8359, \B_DOUT_TEMPR3[37] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][37] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[37]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[37]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%33%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C33 (.A_DOUT({
        nc8360, nc8361, nc8362, nc8363, nc8364, nc8365, nc8366, nc8367, 
        nc8368, nc8369, nc8370, nc8371, nc8372, nc8373, nc8374, nc8375, 
        nc8376, nc8377, nc8378, \A_DOUT_TEMPR1[33] }), .B_DOUT({nc8379, 
        nc8380, nc8381, nc8382, nc8383, nc8384, nc8385, nc8386, nc8387, 
        nc8388, nc8389, nc8390, nc8391, nc8392, nc8393, nc8394, nc8395, 
        nc8396, nc8397, \B_DOUT_TEMPR1[33] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][33] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[33]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[33]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[58]  (.A(\B_DOUT_TEMPR0[58] ), .B(
        \B_DOUT_TEMPR1[58] ), .C(\B_DOUT_TEMPR2[58] ), .D(
        \B_DOUT_TEMPR3[58] ), .Y(B_DOUT[58]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%2%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C2 (.A_DOUT({
        nc8398, nc8399, nc8400, nc8401, nc8402, nc8403, nc8404, nc8405, 
        nc8406, nc8407, nc8408, nc8409, nc8410, nc8411, nc8412, nc8413, 
        nc8414, nc8415, nc8416, \A_DOUT_TEMPR0[2] }), .B_DOUT({nc8417, 
        nc8418, nc8419, nc8420, nc8421, nc8422, nc8423, nc8424, nc8425, 
        nc8426, nc8427, nc8428, nc8429, nc8430, nc8431, nc8432, nc8433, 
        nc8434, nc8435, \B_DOUT_TEMPR0[2] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[2]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[2]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%22%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C22 (.A_DOUT({
        nc8436, nc8437, nc8438, nc8439, nc8440, nc8441, nc8442, nc8443, 
        nc8444, nc8445, nc8446, nc8447, nc8448, nc8449, nc8450, nc8451, 
        nc8452, nc8453, nc8454, \A_DOUT_TEMPR0[22] }), .B_DOUT({nc8455, 
        nc8456, nc8457, nc8458, nc8459, nc8460, nc8461, nc8462, nc8463, 
        nc8464, nc8465, nc8466, nc8467, nc8468, nc8469, nc8470, nc8471, 
        nc8472, nc8473, \B_DOUT_TEMPR0[22] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][22] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[22]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[22]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[5]  (.A(\A_DOUT_TEMPR0[5] ), .B(\A_DOUT_TEMPR1[5] )
        , .C(\A_DOUT_TEMPR2[5] ), .D(\A_DOUT_TEMPR3[5] ), .Y(A_DOUT[5])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%33%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C33 (.A_DOUT({
        nc8474, nc8475, nc8476, nc8477, nc8478, nc8479, nc8480, nc8481, 
        nc8482, nc8483, nc8484, nc8485, nc8486, nc8487, nc8488, nc8489, 
        nc8490, nc8491, nc8492, \A_DOUT_TEMPR2[33] }), .B_DOUT({nc8493, 
        nc8494, nc8495, nc8496, nc8497, nc8498, nc8499, nc8500, nc8501, 
        nc8502, nc8503, nc8504, nc8505, nc8506, nc8507, nc8508, nc8509, 
        nc8510, nc8511, \B_DOUT_TEMPR2[33] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][33] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[33]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[33]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[29]  (.A(\A_DOUT_TEMPR0[29] ), .B(
        \A_DOUT_TEMPR1[29] ), .C(\A_DOUT_TEMPR2[29] ), .D(
        \A_DOUT_TEMPR3[29] ), .Y(A_DOUT[29]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%1%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C1 (.A_DOUT({
        nc8512, nc8513, nc8514, nc8515, nc8516, nc8517, nc8518, nc8519, 
        nc8520, nc8521, nc8522, nc8523, nc8524, nc8525, nc8526, nc8527, 
        nc8528, nc8529, nc8530, \A_DOUT_TEMPR1[1] }), .B_DOUT({nc8531, 
        nc8532, nc8533, nc8534, nc8535, nc8536, nc8537, nc8538, nc8539, 
        nc8540, nc8541, nc8542, nc8543, nc8544, nc8545, nc8546, nc8547, 
        nc8548, nc8549, \B_DOUT_TEMPR1[1] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][1] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[1]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[1]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%8%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C8 (.A_DOUT({
        nc8550, nc8551, nc8552, nc8553, nc8554, nc8555, nc8556, nc8557, 
        nc8558, nc8559, nc8560, nc8561, nc8562, nc8563, nc8564, nc8565, 
        nc8566, nc8567, nc8568, \A_DOUT_TEMPR1[8] }), .B_DOUT({nc8569, 
        nc8570, nc8571, nc8572, nc8573, nc8574, nc8575, nc8576, nc8577, 
        nc8578, nc8579, nc8580, nc8581, nc8582, nc8583, nc8584, nc8585, 
        nc8586, nc8587, \B_DOUT_TEMPR1[8] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][8] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[8]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[8]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%41%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C41 (.A_DOUT({
        nc8588, nc8589, nc8590, nc8591, nc8592, nc8593, nc8594, nc8595, 
        nc8596, nc8597, nc8598, nc8599, nc8600, nc8601, nc8602, nc8603, 
        nc8604, nc8605, nc8606, \A_DOUT_TEMPR3[41] }), .B_DOUT({nc8607, 
        nc8608, nc8609, nc8610, nc8611, nc8612, nc8613, nc8614, nc8615, 
        nc8616, nc8617, nc8618, nc8619, nc8620, nc8621, nc8622, nc8623, 
        nc8624, nc8625, \B_DOUT_TEMPR3[41] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][41] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[41]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[41]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%12%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C12 (.A_DOUT({
        nc8626, nc8627, nc8628, nc8629, nc8630, nc8631, nc8632, nc8633, 
        nc8634, nc8635, nc8636, nc8637, nc8638, nc8639, nc8640, nc8641, 
        nc8642, nc8643, nc8644, \A_DOUT_TEMPR1[12] }), .B_DOUT({nc8645, 
        nc8646, nc8647, nc8648, nc8649, nc8650, nc8651, nc8652, nc8653, 
        nc8654, nc8655, nc8656, nc8657, nc8658, nc8659, nc8660, nc8661, 
        nc8662, nc8663, \B_DOUT_TEMPR1[12] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][12] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[12]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[12]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[57]  (.A(\B_DOUT_TEMPR0[57] ), .B(
        \B_DOUT_TEMPR1[57] ), .C(\B_DOUT_TEMPR2[57] ), .D(
        \B_DOUT_TEMPR3[57] ), .Y(B_DOUT[57]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%21%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C21 (.A_DOUT({
        nc8664, nc8665, nc8666, nc8667, nc8668, nc8669, nc8670, nc8671, 
        nc8672, nc8673, nc8674, nc8675, nc8676, nc8677, nc8678, nc8679, 
        nc8680, nc8681, nc8682, \A_DOUT_TEMPR1[21] }), .B_DOUT({nc8683, 
        nc8684, nc8685, nc8686, nc8687, nc8688, nc8689, nc8690, nc8691, 
        nc8692, nc8693, nc8694, nc8695, nc8696, nc8697, nc8698, nc8699, 
        nc8700, nc8701, \B_DOUT_TEMPR1[21] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][21] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[21]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[21]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[49]  (.A(\B_DOUT_TEMPR0[49] ), .B(
        \B_DOUT_TEMPR1[49] ), .C(\B_DOUT_TEMPR2[49] ), .D(
        \B_DOUT_TEMPR3[49] ), .Y(B_DOUT[49]));
    OR4 \OR4_A_DOUT[27]  (.A(\A_DOUT_TEMPR0[27] ), .B(
        \A_DOUT_TEMPR1[27] ), .C(\A_DOUT_TEMPR2[27] ), .D(
        \A_DOUT_TEMPR3[27] ), .Y(A_DOUT[27]));
    OR4 \OR4_A_DOUT[26]  (.A(\A_DOUT_TEMPR0[26] ), .B(
        \A_DOUT_TEMPR1[26] ), .C(\A_DOUT_TEMPR2[26] ), .D(
        \A_DOUT_TEMPR3[26] ), .Y(A_DOUT[26]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%59%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C59 (.A_DOUT({
        nc8702, nc8703, nc8704, nc8705, nc8706, nc8707, nc8708, nc8709, 
        nc8710, nc8711, nc8712, nc8713, nc8714, nc8715, nc8716, nc8717, 
        nc8718, nc8719, nc8720, \A_DOUT_TEMPR1[59] }), .B_DOUT({nc8721, 
        nc8722, nc8723, nc8724, nc8725, nc8726, nc8727, nc8728, nc8729, 
        nc8730, nc8731, nc8732, nc8733, nc8734, nc8735, nc8736, nc8737, 
        nc8738, nc8739, \B_DOUT_TEMPR1[59] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][59] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[59]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[59]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%63%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C63 (.A_DOUT({
        nc8740, nc8741, nc8742, nc8743, nc8744, nc8745, nc8746, nc8747, 
        nc8748, nc8749, nc8750, nc8751, nc8752, nc8753, nc8754, nc8755, 
        nc8756, nc8757, nc8758, \A_DOUT_TEMPR3[63] }), .B_DOUT({nc8759, 
        nc8760, nc8761, nc8762, nc8763, nc8764, nc8765, nc8766, nc8767, 
        nc8768, nc8769, nc8770, nc8771, nc8772, nc8773, nc8774, nc8775, 
        nc8776, nc8777, \B_DOUT_TEMPR3[63] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][63] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[63]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[63]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%21%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C21 (.A_DOUT({
        nc8778, nc8779, nc8780, nc8781, nc8782, nc8783, nc8784, nc8785, 
        nc8786, nc8787, nc8788, nc8789, nc8790, nc8791, nc8792, nc8793, 
        nc8794, nc8795, nc8796, \A_DOUT_TEMPR3[21] }), .B_DOUT({nc8797, 
        nc8798, nc8799, nc8800, nc8801, nc8802, nc8803, nc8804, nc8805, 
        nc8806, nc8807, nc8808, nc8809, nc8810, nc8811, nc8812, nc8813, 
        nc8814, nc8815, \B_DOUT_TEMPR3[21] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][21] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[21]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[21]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%7%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C7 (.A_DOUT({
        nc8816, nc8817, nc8818, nc8819, nc8820, nc8821, nc8822, nc8823, 
        nc8824, nc8825, nc8826, nc8827, nc8828, nc8829, nc8830, nc8831, 
        nc8832, nc8833, nc8834, \A_DOUT_TEMPR3[7] }), .B_DOUT({nc8835, 
        nc8836, nc8837, nc8838, nc8839, nc8840, nc8841, nc8842, nc8843, 
        nc8844, nc8845, nc8846, nc8847, nc8848, nc8849, nc8850, nc8851, 
        nc8852, nc8853, \B_DOUT_TEMPR3[7] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][7] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[7]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[7]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[48]  (.A(\B_DOUT_TEMPR0[48] ), .B(
        \B_DOUT_TEMPR1[48] ), .C(\B_DOUT_TEMPR2[48] ), .D(
        \B_DOUT_TEMPR3[48] ), .Y(B_DOUT[48]));
    OR4 \OR4_A_DOUT[18]  (.A(\A_DOUT_TEMPR0[18] ), .B(
        \A_DOUT_TEMPR1[18] ), .C(\A_DOUT_TEMPR2[18] ), .D(
        \A_DOUT_TEMPR3[18] ), .Y(A_DOUT[18]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%17%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C17 (.A_DOUT({
        nc8854, nc8855, nc8856, nc8857, nc8858, nc8859, nc8860, nc8861, 
        nc8862, nc8863, nc8864, nc8865, nc8866, nc8867, nc8868, nc8869, 
        nc8870, nc8871, nc8872, \A_DOUT_TEMPR2[17] }), .B_DOUT({nc8873, 
        nc8874, nc8875, nc8876, nc8877, nc8878, nc8879, nc8880, nc8881, 
        nc8882, nc8883, nc8884, nc8885, nc8886, nc8887, nc8888, nc8889, 
        nc8890, nc8891, \B_DOUT_TEMPR2[17] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][17] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[17]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[17]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%37%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C37 (.A_DOUT({
        nc8892, nc8893, nc8894, nc8895, nc8896, nc8897, nc8898, nc8899, 
        nc8900, nc8901, nc8902, nc8903, nc8904, nc8905, nc8906, nc8907, 
        nc8908, nc8909, nc8910, \A_DOUT_TEMPR0[37] }), .B_DOUT({nc8911, 
        nc8912, nc8913, nc8914, nc8915, nc8916, nc8917, nc8918, nc8919, 
        nc8920, nc8921, nc8922, nc8923, nc8924, nc8925, nc8926, nc8927, 
        nc8928, nc8929, \B_DOUT_TEMPR0[37] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][37] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[37]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[37]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%45%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C45 (.A_DOUT({
        nc8930, nc8931, nc8932, nc8933, nc8934, nc8935, nc8936, nc8937, 
        nc8938, nc8939, nc8940, nc8941, nc8942, nc8943, nc8944, nc8945, 
        nc8946, nc8947, nc8948, \A_DOUT_TEMPR3[45] }), .B_DOUT({nc8949, 
        nc8950, nc8951, nc8952, nc8953, nc8954, nc8955, nc8956, nc8957, 
        nc8958, nc8959, nc8960, nc8961, nc8962, nc8963, nc8964, nc8965, 
        nc8966, nc8967, \B_DOUT_TEMPR3[45] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][45] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[45]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[45]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[52]  (.A(\A_DOUT_TEMPR0[52] ), .B(
        \A_DOUT_TEMPR1[52] ), .C(\A_DOUT_TEMPR2[52] ), .D(
        \A_DOUT_TEMPR3[52] ), .Y(A_DOUT[52]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%59%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C59 (.A_DOUT({
        nc8968, nc8969, nc8970, nc8971, nc8972, nc8973, nc8974, nc8975, 
        nc8976, nc8977, nc8978, nc8979, nc8980, nc8981, nc8982, nc8983, 
        nc8984, nc8985, nc8986, \A_DOUT_TEMPR2[59] }), .B_DOUT({nc8987, 
        nc8988, nc8989, nc8990, nc8991, nc8992, nc8993, nc8994, nc8995, 
        nc8996, nc8997, nc8998, nc8999, nc9000, nc9001, nc9002, nc9003, 
        nc9004, nc9005, \B_DOUT_TEMPR2[59] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][59] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[59]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[59]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[47]  (.A(\B_DOUT_TEMPR0[47] ), .B(
        \B_DOUT_TEMPR1[47] ), .C(\B_DOUT_TEMPR2[47] ), .D(
        \B_DOUT_TEMPR3[47] ), .Y(B_DOUT[47]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%25%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C25 (.A_DOUT({
        nc9006, nc9007, nc9008, nc9009, nc9010, nc9011, nc9012, nc9013, 
        nc9014, nc9015, nc9016, nc9017, nc9018, nc9019, nc9020, nc9021, 
        nc9022, nc9023, nc9024, \A_DOUT_TEMPR1[25] }), .B_DOUT({nc9025, 
        nc9026, nc9027, nc9028, nc9029, nc9030, nc9031, nc9032, nc9033, 
        nc9034, nc9035, nc9036, nc9037, nc9038, nc9039, nc9040, nc9041, 
        nc9042, nc9043, \B_DOUT_TEMPR1[25] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][25] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[25]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[25]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%46%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C46 (.A_DOUT({
        nc9044, nc9045, nc9046, nc9047, nc9048, nc9049, nc9050, nc9051, 
        nc9052, nc9053, nc9054, nc9055, nc9056, nc9057, nc9058, nc9059, 
        nc9060, nc9061, nc9062, \A_DOUT_TEMPR3[46] }), .B_DOUT({nc9063, 
        nc9064, nc9065, nc9066, nc9067, nc9068, nc9069, nc9070, nc9071, 
        nc9072, nc9073, nc9074, nc9075, nc9076, nc9077, nc9078, nc9079, 
        nc9080, nc9081, \B_DOUT_TEMPR3[46] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][46] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[46]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[46]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%26%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C26 (.A_DOUT({
        nc9082, nc9083, nc9084, nc9085, nc9086, nc9087, nc9088, nc9089, 
        nc9090, nc9091, nc9092, nc9093, nc9094, nc9095, nc9096, nc9097, 
        nc9098, nc9099, nc9100, \A_DOUT_TEMPR1[26] }), .B_DOUT({nc9101, 
        nc9102, nc9103, nc9104, nc9105, nc9106, nc9107, nc9108, nc9109, 
        nc9110, nc9111, nc9112, nc9113, nc9114, nc9115, nc9116, nc9117, 
        nc9118, nc9119, \B_DOUT_TEMPR1[26] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][26] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[26]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[26]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[33]  (.A(\A_DOUT_TEMPR0[33] ), .B(
        \A_DOUT_TEMPR1[33] ), .C(\A_DOUT_TEMPR2[33] ), .D(
        \A_DOUT_TEMPR3[33] ), .Y(A_DOUT[33]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%10%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C10 (.A_DOUT({
        nc9120, nc9121, nc9122, nc9123, nc9124, nc9125, nc9126, nc9127, 
        nc9128, nc9129, nc9130, nc9131, nc9132, nc9133, nc9134, nc9135, 
        nc9136, nc9137, nc9138, \A_DOUT_TEMPR3[10] }), .B_DOUT({nc9139, 
        nc9140, nc9141, nc9142, nc9143, nc9144, nc9145, nc9146, nc9147, 
        nc9148, nc9149, nc9150, nc9151, nc9152, nc9153, nc9154, nc9155, 
        nc9156, nc9157, \B_DOUT_TEMPR3[10] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][10] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[10]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[10]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%25%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C25 (.A_DOUT({
        nc9158, nc9159, nc9160, nc9161, nc9162, nc9163, nc9164, nc9165, 
        nc9166, nc9167, nc9168, nc9169, nc9170, nc9171, nc9172, nc9173, 
        nc9174, nc9175, nc9176, \A_DOUT_TEMPR3[25] }), .B_DOUT({nc9177, 
        nc9178, nc9179, nc9180, nc9181, nc9182, nc9183, nc9184, nc9185, 
        nc9186, nc9187, nc9188, nc9189, nc9190, nc9191, nc9192, nc9193, 
        nc9194, nc9195, \B_DOUT_TEMPR3[25] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][25] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[25]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[25]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%0%23%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R0C23 (.A_DOUT({
        nc9196, nc9197, nc9198, nc9199, nc9200, nc9201, nc9202, nc9203, 
        nc9204, nc9205, nc9206, nc9207, nc9208, nc9209, nc9210, nc9211, 
        nc9212, nc9213, nc9214, \A_DOUT_TEMPR0[23] }), .B_DOUT({nc9215, 
        nc9216, nc9217, nc9218, nc9219, nc9220, nc9221, nc9222, nc9223, 
        nc9224, nc9225, nc9226, nc9227, nc9228, nc9229, nc9230, nc9231, 
        nc9232, nc9233, \B_DOUT_TEMPR0[23] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][23] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[23]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[23]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%18%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C18 (.A_DOUT({
        nc9234, nc9235, nc9236, nc9237, nc9238, nc9239, nc9240, nc9241, 
        nc9242, nc9243, nc9244, nc9245, nc9246, nc9247, nc9248, nc9249, 
        nc9250, nc9251, nc9252, \A_DOUT_TEMPR3[18] }), .B_DOUT({nc9253, 
        nc9254, nc9255, nc9256, nc9257, nc9258, nc9259, nc9260, nc9261, 
        nc9262, nc9263, nc9264, nc9265, nc9266, nc9267, nc9268, nc9269, 
        nc9270, nc9271, \B_DOUT_TEMPR3[18] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][18] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[18]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[18]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[3]  (.A(\A_DOUT_TEMPR0[3] ), .B(\A_DOUT_TEMPR1[3] )
        , .C(\A_DOUT_TEMPR2[3] ), .D(\A_DOUT_TEMPR3[3] ), .Y(A_DOUT[3])
        );
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%26%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C26 (.A_DOUT({
        nc9272, nc9273, nc9274, nc9275, nc9276, nc9277, nc9278, nc9279, 
        nc9280, nc9281, nc9282, nc9283, nc9284, nc9285, nc9286, nc9287, 
        nc9288, nc9289, nc9290, \A_DOUT_TEMPR3[26] }), .B_DOUT({nc9291, 
        nc9292, nc9293, nc9294, nc9295, nc9296, nc9297, nc9298, nc9299, 
        nc9300, nc9301, nc9302, nc9303, nc9304, nc9305, nc9306, nc9307, 
        nc9308, nc9309, \B_DOUT_TEMPR3[26] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][26] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[26]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[26]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%0%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C0 (.A_DOUT({
        nc9310, nc9311, nc9312, nc9313, nc9314, nc9315, nc9316, nc9317, 
        nc9318, nc9319, nc9320, nc9321, nc9322, nc9323, nc9324, nc9325, 
        nc9326, nc9327, nc9328, \A_DOUT_TEMPR1[0] }), .B_DOUT({nc9329, 
        nc9330, nc9331, nc9332, nc9333, nc9334, nc9335, nc9336, nc9337, 
        nc9338, nc9339, nc9340, nc9341, nc9342, nc9343, nc9344, nc9345, 
        nc9346, nc9347, \B_DOUT_TEMPR1[0] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][0] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[0]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[0]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%4%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C4 (.A_DOUT({
        nc9348, nc9349, nc9350, nc9351, nc9352, nc9353, nc9354, nc9355, 
        nc9356, nc9357, nc9358, nc9359, nc9360, nc9361, nc9362, nc9363, 
        nc9364, nc9365, nc9366, \A_DOUT_TEMPR3[4] }), .B_DOUT({nc9367, 
        nc9368, nc9369, nc9370, nc9371, nc9372, nc9373, nc9374, nc9375, 
        nc9376, nc9377, nc9378, nc9379, nc9380, nc9381, nc9382, nc9383, 
        nc9384, nc9385, \B_DOUT_TEMPR3[4] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][4] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[4]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[4]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_B_DOUT[63]  (.A(\B_DOUT_TEMPR0[63] ), .B(
        \B_DOUT_TEMPR1[63] ), .C(\B_DOUT_TEMPR2[63] ), .D(
        \B_DOUT_TEMPR3[63] ), .Y(B_DOUT[63]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%13%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C13 (.A_DOUT({
        nc9386, nc9387, nc9388, nc9389, nc9390, nc9391, nc9392, nc9393, 
        nc9394, nc9395, nc9396, nc9397, nc9398, nc9399, nc9400, nc9401, 
        nc9402, nc9403, nc9404, \A_DOUT_TEMPR1[13] }), .B_DOUT({nc9405, 
        nc9406, nc9407, nc9408, nc9409, nc9410, nc9411, nc9412, nc9413, 
        nc9414, nc9415, nc9416, nc9417, nc9418, nc9419, nc9420, nc9421, 
        nc9422, nc9423, \B_DOUT_TEMPR1[13] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][13] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[13]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[13]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%42%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C42 (.A_DOUT({
        nc9424, nc9425, nc9426, nc9427, nc9428, nc9429, nc9430, nc9431, 
        nc9432, nc9433, nc9434, nc9435, nc9436, nc9437, nc9438, nc9439, 
        nc9440, nc9441, nc9442, \A_DOUT_TEMPR3[42] }), .B_DOUT({nc9443, 
        nc9444, nc9445, nc9446, nc9447, nc9448, nc9449, nc9450, nc9451, 
        nc9452, nc9453, nc9454, nc9455, nc9456, nc9457, nc9458, nc9459, 
        nc9460, nc9461, \B_DOUT_TEMPR3[42] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][42] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[42]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[42]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4_A_DOUT[42]  (.A(\A_DOUT_TEMPR0[42] ), .B(
        \A_DOUT_TEMPR1[42] ), .C(\A_DOUT_TEMPR2[42] ), .D(
        \A_DOUT_TEMPR3[42] ), .Y(A_DOUT[42]));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%2%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C2 (.A_DOUT({
        nc9462, nc9463, nc9464, nc9465, nc9466, nc9467, nc9468, nc9469, 
        nc9470, nc9471, nc9472, nc9473, nc9474, nc9475, nc9476, nc9477, 
        nc9478, nc9479, nc9480, \A_DOUT_TEMPR1[2] }), .B_DOUT({nc9481, 
        nc9482, nc9483, nc9484, nc9485, nc9486, nc9487, nc9488, nc9489, 
        nc9490, nc9491, nc9492, nc9493, nc9494, nc9495, nc9496, nc9497, 
        nc9498, nc9499, \B_DOUT_TEMPR1[2] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][2] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[2]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[2]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%22%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C22 (.A_DOUT({
        nc9500, nc9501, nc9502, nc9503, nc9504, nc9505, nc9506, nc9507, 
        nc9508, nc9509, nc9510, nc9511, nc9512, nc9513, nc9514, nc9515, 
        nc9516, nc9517, nc9518, \A_DOUT_TEMPR1[22] }), .B_DOUT({nc9519, 
        nc9520, nc9521, nc9522, nc9523, nc9524, nc9525, nc9526, nc9527, 
        nc9528, nc9529, nc9530, nc9531, nc9532, nc9533, nc9534, nc9535, 
        nc9536, nc9537, \B_DOUT_TEMPR1[22] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][22] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[22]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[22]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%1%61%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R1C61 (.A_DOUT({
        nc9538, nc9539, nc9540, nc9541, nc9542, nc9543, nc9544, nc9545, 
        nc9546, nc9547, nc9548, nc9549, nc9550, nc9551, nc9552, nc9553, 
        nc9554, nc9555, nc9556, \A_DOUT_TEMPR1[61] }), .B_DOUT({nc9557, 
        nc9558, nc9559, nc9560, nc9561, nc9562, nc9563, nc9564, nc9565, 
        nc9566, nc9567, nc9568, nc9569, nc9570, nc9571, nc9572, nc9573, 
        nc9574, nc9575, \B_DOUT_TEMPR1[61] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[1][61] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, \BLKX1[0] , A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[61]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, \BLKY1[0] , 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[61]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%2%60%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R2C60 (.A_DOUT({
        nc9576, nc9577, nc9578, nc9579, nc9580, nc9581, nc9582, nc9583, 
        nc9584, nc9585, nc9586, nc9587, nc9588, nc9589, nc9590, nc9591, 
        nc9592, nc9593, nc9594, \A_DOUT_TEMPR2[60] }), .B_DOUT({nc9595, 
        nc9596, nc9597, nc9598, nc9599, nc9600, nc9601, nc9602, nc9603, 
        nc9604, nc9605, nc9606, nc9607, nc9608, nc9609, nc9610, nc9611, 
        nc9612, nc9613, \B_DOUT_TEMPR2[60] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[2][60] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], \BLKX0[0] }), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[60]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        \BLKY0[0] }), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[60]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%57%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C57 (.A_DOUT({
        nc9614, nc9615, nc9616, nc9617, nc9618, nc9619, nc9620, nc9621, 
        nc9622, nc9623, nc9624, nc9625, nc9626, nc9627, nc9628, nc9629, 
        nc9630, nc9631, nc9632, \A_DOUT_TEMPR3[57] }), .B_DOUT({nc9633, 
        nc9634, nc9635, nc9636, nc9637, nc9638, nc9639, nc9640, nc9641, 
        nc9642, nc9643, nc9644, nc9645, nc9646, nc9647, nc9648, nc9649, 
        nc9650, nc9651, \B_DOUT_TEMPR3[57] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][57] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[57]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[57]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%2%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C2 (.A_DOUT({
        nc9652, nc9653, nc9654, nc9655, nc9656, nc9657, nc9658, nc9659, 
        nc9660, nc9661, nc9662, nc9663, nc9664, nc9665, nc9666, nc9667, 
        nc9668, nc9669, nc9670, \A_DOUT_TEMPR3[2] }), .B_DOUT({nc9671, 
        nc9672, nc9673, nc9674, nc9675, nc9676, nc9677, nc9678, nc9679, 
        nc9680, nc9681, nc9682, nc9683, nc9684, nc9685, nc9686, nc9687, 
        nc9688, nc9689, \B_DOUT_TEMPR3[2] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][2] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[2]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[2]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C5_0%65536-65536%64-64%SPEED%3%22%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM_R3C22 (.A_DOUT({
        nc9690, nc9691, nc9692, nc9693, nc9694, nc9695, nc9696, nc9697, 
        nc9698, nc9699, nc9700, nc9701, nc9702, nc9703, nc9704, nc9705, 
        nc9706, nc9707, nc9708, \A_DOUT_TEMPR3[22] }), .B_DOUT({nc9709, 
        nc9710, nc9711, nc9712, nc9713, nc9714, nc9715, nc9716, nc9717, 
        nc9718, nc9719, nc9720, nc9721, nc9722, nc9723, nc9724, nc9725, 
        nc9726, nc9727, \B_DOUT_TEMPR3[22] }), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[3][22] ), .A_ADDR({
        A_ADDR[13], A_ADDR[12], A_ADDR[11], A_ADDR[10], A_ADDR[9], 
        A_ADDR[8], A_ADDR[7], A_ADDR[6], A_ADDR[5], A_ADDR[4], 
        A_ADDR[3], A_ADDR[2], A_ADDR[1], A_ADDR[0]}), .A_BLK_EN({
        A_BLK_EN, A_ADDR[15], A_ADDR[14]}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, A_DIN[22]}), .A_REN(VCC), .A_WEN({
        GND, A_WEN}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({B_ADDR[13], B_ADDR[12], 
        B_ADDR[11], B_ADDR[10], B_ADDR[9], B_ADDR[8], B_ADDR[7], 
        B_ADDR[6], B_ADDR[5], B_ADDR[4], B_ADDR[3], B_ADDR[2], 
        B_ADDR[1], B_ADDR[0]}), .B_BLK_EN({B_BLK_EN, B_ADDR[15], 
        B_ADDR[14]}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, B_DIN[22]}), .B_REN(VCC), .B_WEN({GND, B_WEN}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
