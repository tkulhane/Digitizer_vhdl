// ********************************************************************
// Microsemi Corporation Proprietary and Confidential 
//  Copyright 2018 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description:  request_code.sv Definition of atomic requests
//    initiated by CoreLaneMstr, carried out by CoreLnkMstr
//    This file contains code which must be included at module scope.
// Revision Information:
// Date     Description
// 23Sep18 Initial Release 
//
// SVN Revision Information:
// SVN $Revision: 8751 $
// SVN $Date: 2018-10-09 07:23:49 -0700 (Tue, 09 Oct 2018) $
//
// Resolved SARs
// SAR      Date     Who   Description
//          7sep20   preethi	added additional codes needed for
//                              Incremental DFE and Data clock Eye 
//                              centering
// Notes: 
//        
// *********************************************************************/ 
// Symbolic names for system reg field location information
localparam integer      SZ_RQCODE = 5;
localparam logic [SZ_RQCODE-1:0]
                        RQC_L2D = 'd0,
                        // lock-to-data request
                        RQC_L2R = 'd1,
                        // lock-to-reference request
                        RQC_PCSRST0 = 'd2,
                        // deassert soft pcs rx reset request
                        RQC_PCSRST1 = 'd3,
                        // assert soft pcs rx reset request
                        RQC_TGLCALRST = 'd4,
                        // toggle DFE_CAL_RESET (r->w1->w0) request
                        RQC_TGLRUNCAL = 'd5,
                        // toggle RUN_FULL_CAL_USER (r->w0->w1->w0) request
                        RQC_READDFC = 'd6,
                        // read DONE_FULL_CAL request
                        RQC_READ_DC = 'd7, //Read & write DC Calibration Offset to registers
                        RQC_SET_H0DFE1 = 'd9, //Set SEL_H0DFE = '1'
                        RQC_SET_H0DFE0 = 'd10, // set SEL_H0DFE = '0'
                        RQC_SET_DFE_CAL_EM1 = 'd11, // Set DFE_CAL_EM_ONLY  = '1'
                        RQC_SET_DFE_CAL_EM0 = 'd12, //Set DFE_CAL_EM_ONLY  = '0'
                        RQC_TGLRUN_AREA_COMP = 'd13, //Toggle RUN_AREA_COMPUTE_USER bit
                        RQC_READ_AREA_COMP = 'd14, //Read DONE_AREA_COMPUTE bit 
                        RQC_READ_MAX_DFE = 'd15, // Read MAX_DFE_CYCLES bits 
                        RQC_WRITE_MAX_DFE ='d16, // Write MAX_DFE_CYCLES bits 
                        RQC_READ_CALIB_CODE = 'd17, //Read & write DFE Calibration code bits
                        RQC_SET_DFE_COEFFS_USER = 'd19, //Set SET_DFE_COEFFS_USER = '1'
                        RQC_READ_DFE_CAL_FORCEH ='d20, // Read DFE_CAL_FORCEH bit
                        RQC_WRITE_DFE_CAL_FORCEH = 'd21, // Write DFE_CAL_FORCEH  bit
                        RQC_TGL_RUN_DFECAL_USER = 'd22, //Toggle RUN_DFECAL_USER bit
                        RQC_DONE_DFECAL ='d23; //Read  DONE_DFECAL bit
                        
