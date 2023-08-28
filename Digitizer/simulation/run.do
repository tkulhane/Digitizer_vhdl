quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR "C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap PolarFire "C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/precompiled/vlog/PolarFire"
if {[file exists CORESPI_LIB/_info]} {
   echo "INFO: Simulation library CORESPI_LIB already exists"
} else {
   file delete -force CORESPI_LIB 
   vlib CORESPI_LIB
}
vmap CORESPI_LIB "CORESPI_LIB"

vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C2/CORERESET_PF_C2_0/core/corereset_pf.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C2/CORERESET_PF_C2.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C2/PF_CCC_C2_0/PF_CCC_C2_PF_CCC_C2_0_PF_CCC.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C2/PF_CCC_C2.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_CLK_DIV_C0/PF_CLK_DIV_C0_0/PF_CLK_DIV_C0_PF_CLK_DIV_C0_0_PF_CLK_DIV.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_CLK_DIV_C0/PF_CLK_DIV_C0.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MONITOR_C1/PF_INIT_MONITOR_C1_0/PF_INIT_MONITOR_C1_PF_INIT_MONITOR_C1_0_PF_INIT_MONITOR.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MONITOR_C1/PF_INIT_MONITOR_C1.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_OSC_C0/PF_OSC_C0_0/PF_OSC_C0_PF_OSC_C0_0_PF_OSC.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_OSC_C0/PF_OSC_C0.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_TX_PLL_C0/PF_TX_PLL_C0_0/PF_TX_PLL_C0_PF_TX_PLL_C0_0_PF_TX_PLL.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_TX_PLL_C0/PF_TX_PLL_C0.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORELCKMGT/2.0.100/rtl/vlog/core/CORELCKMGT.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDgrycnt.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDbincnt.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDsmplcnt.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDfrqerrarb.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDplsgen.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDshcnt.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDsyncen.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDsync.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFDsicr.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORERFD/2.1.100/rtl/vlog/core/CORERFD.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/SgCore/PF_XCVR_APBLINK_V/1.1.104/hdl/PF_XCVR_APBLINK_V.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core/CORELANEMSTRmode0.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core/CORELANEMSTRmode1.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core/CORELANEMSTRmode2.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core/CORELANEMSTR.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_ERM_C5/I_XCVR/PF_XCVR_ERM_C5_I_XCVR_PF_XCVR_sim.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_ERM_C5/PF_XCVR_ERM_C5.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SYNCinb_Handler.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Test_Generator_XCVR.vhd"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/Transceiver/Transceiver.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table_trigger.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/TB_Transceiver.vhd"

vsim -L PolarFire -L presynth -L CORESPI_LIB  -t 1ps -pli C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll -gSIM_PA5M300T=0 presynth.TB_Transceiver
add wave /TB_Transceiver/*
run 1000ns
