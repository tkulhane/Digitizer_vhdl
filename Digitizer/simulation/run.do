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

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Alignment_Fifo.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_fwft.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_sync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/corefifo_async.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/COREFIFO_C12_COREFIFO_C12_0_LSRAM_top.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/COREFIFO_C12_COREFIFO_C12_0_ram_wrapper.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12_0/rtl/vlog/core/COREFIFO.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C12/COREFIFO_C12.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_fwft.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_sync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/corefifo_async.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/COREFIFO_C13_COREFIFO_C13_0_LSRAM_top.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/COREFIFO_C13_COREFIFO_C13_0_ram_wrapper.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13_0/rtl/vlog/core/COREFIFO.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C13/COREFIFO_C13.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/LaneOutExtender.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RxLaneControl.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/RxMainLinkController.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Test_Generator_for_Lanes.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TxLaneControl.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TxMainLinkController.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/DataSource_Transcievers/DataSource_Transcievers.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table_trigger.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/TB_DataSource_Transciever.vhd"

vsim -L PolarFire -L presynth -L CORESPI_LIB  -t 1ps -pli C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll -gSIM_PA5M300T=0 presynth.TB_DataSource_Transciever
add wave /TB_DataSource_Transciever/*
run 1000ns
