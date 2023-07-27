///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: xcvr_apb_link_v_wrap.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module PF_XCVR_APBLINK_V(
  RQR,
  GRANT,
  CTRL_CLK,
  CTRL_SRST_N,
  ARST_N,
  REQUEST,
  RQI,
  LINK_CLK,
  LINK_ADDR,
  LINK_EN,
  LINK_ARST_N,
  LINK_WDATA,
  LINK_RDATA );

/* Output Ports */
output [1:0] RQR;
output GRANT;

/* Input Ports */
input  CTRL_CLK;
input  CTRL_SRST_N;
input  ARST_N;
input  REQUEST;
input  [5:0] RQI;

/* Static Input Ports */

/* Hardwired Ports */
output LINK_CLK;
output [2:0] LINK_ADDR;
output LINK_EN;
output LINK_ARST_N;
output [3:0] LINK_WDATA;
input [3:0] LINK_RDATA;

XCVR_APB_LINK_V2 u0 (
.RQR( RQR ),
.GRANT( GRANT ),
.CTRL_CLK( CTRL_CLK ),
.CTRL_SRST_N( CTRL_SRST_N ),
.ARST_N( ARST_N ),
.REQUEST( REQUEST ),
.RQI( RQI ),
.LINK_CLK( LINK_CLK ),
.LINK_ADDR( LINK_ADDR ),
.LINK_EN( LINK_EN ),
.LINK_ARST_N( LINK_ARST_N ),
.LINK_WDATA( LINK_WDATA ),
.LINK_RDATA( LINK_RDATA )
);


endmodule
