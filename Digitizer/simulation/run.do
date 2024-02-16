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

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Communication_TX_Arbiter2.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table_trigger.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/corefifo_fwft.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/corefifo_sync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/corefifo_async.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/COREFIFO_C10_COREFIFO_C10_0_LSRAM_top.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/COREFIFO_C10_COREFIFO_C10_0_ram_wrapper.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10_0/rtl/vlog/core/COREFIFO.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C10/COREFIFO_C10.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Communication_Builder.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_DPSRAM_C7/PF_DPSRAM_C7_0/PF_DPSRAM_C7_PF_DPSRAM_C7_0_PF_DPSRAM.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_DPSRAM_C7/PF_DPSRAM_C7.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_DPSRAM_C8_Event_Status/PF_DPSRAM_C8_Event_Status_0/PF_DPSRAM_C8_Event_Status_PF_DPSRAM_C8_Event_Status_0_PF_DPSRAM.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_DPSRAM_C8_Event_Status/PF_DPSRAM_C8_Event_Status.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/Event_Info_RAM_Block/Event_Info_RAM_Block.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/FIFOs_Reader.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/corefifo_async.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/corefifo_sync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/corefifo_fwft.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/COREFIFO_C4_COREFIFO_C4_0_LSRAM_top.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/COREFIFO_C4_COREFIFO_C4_0_ram_wrapper.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4_0/rtl/vlog/core/COREFIFO.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C4/COREFIFO_C4.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Trigger_Unit.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/Input_Data_Part/Input_Data_Part.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_DPSRAM_C5/PF_DPSRAM_C5_0/PF_DPSRAM_C5_PF_DPSRAM_C5_0_PF_DPSRAM.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_DPSRAM_C5/PF_DPSRAM_C5.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Sample_RAM_Block_Decoder.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Sample_RAM_Block_MUX.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/Sample_RAM_Block/Sample_RAM_Block.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/corefifo_NstagesSync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/corefifo_grayToBinConv.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/corefifo_async.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/corefifo_sync.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/corefifo_fwft.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/corefifo_sync_scntr.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/COREFIFO_C5_COREFIFO_C5_0_LSRAM_top.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/COREFIFO_C5_COREFIFO_C5_0_ram_wrapper.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5_0/rtl/vlog/core/COREFIFO.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C5/COREFIFO_C5.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Trigger_Control.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Trigger_Main.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/Trigger_Top_Part/Trigger_Top_Part.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/Data_Block/Data_Block.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Test_Generator_for_Lanes.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/TB_Data_Block.vhd"

vsim -L PolarFire -L presynth -L CORESPI_LIB  -t 1ps -pli C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll -gSIM_PA5M300T=0 presynth.TB_Data_Block
add wave /TB_Data_Block/*
run 1000ns
