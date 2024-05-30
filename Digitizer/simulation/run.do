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

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Synchronizer.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/CtrlBus_HandShake.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SampleCompose.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SampleTxDeCompose.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Test_Generator_for_Lanes.vhd"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_sync.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_async.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_fwft.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/COREFIFO_C12_COREFIFO_C12_0_LSRAM_top.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/COREFIFO_C12_COREFIFO_C12_0_ram_wrapper.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/COREFIFO.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_sync.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_async.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_fwft.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/COREFIFO_C13_COREFIFO_C13_0_LSRAM_top.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/COREFIFO_C13_COREFIFO_C13_0_ram_wrapper.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/COREFIFO.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_TX_PLL_C1/PF_TX_PLL_C1_0/PF_TX_PLL_C1_PF_TX_PLL_C1_0_PF_TX_PLL.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_TX_PLL_C1/PF_TX_PLL_C1.v"
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
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_ERM_C8/I_XCVR/PF_XCVR_ERM_C8_I_XCVR_PF_XCVR_sim.v"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/PF_XCVR_ERM_C8/PF_XCVR_ERM_C8.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Transceiver_LaneStatus.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/AlignmentLane_Fifo.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RxLaneControl.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TxLaneControl.vhd"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/Transciever_OneLane/Transciever_OneLane.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RxMainLinkController.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TxMainLinkController.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Transceiver_LanesConnection.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Transceiver_Controller.vhd"
vlog "+incdir+${PROJECT_DIR}/component/Actel/DirectCore/CORELANEMSTR/2.1.100/rtl/vlog/core" -sv -work presynth "${PROJECT_DIR}/component/work/Transceiver_Main/Transceiver_Main.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table_trigger.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/TB_Transceiver_Main.vhd"

vsim -L PolarFire -L presynth -L CORESPI_LIB  -t 1ps -pli C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll -gSIM_PA5M300T=0 presynth.TB_Transceiver_Main
add wave /TB_Transceiver_Main/*
run 1000ns
