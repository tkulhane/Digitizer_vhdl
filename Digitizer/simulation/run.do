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

vlog -sv -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0_0/core/corereset_pf.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Clock_Controller.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Synchronizer.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Clock_Switch.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C0/PF_CCC_C0_0/PF_CCC_C0_PF_CCC_C0_0_PF_CCC.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C0/PF_CCC_C0.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C3/PF_CCC_C3_0/PF_CCC_C3_PF_CCC_C3_0_PF_CCC.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C3/PF_CCC_C3.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C7/PF_CCC_C7_0/PF_CCC_C7_PF_CCC_C7_0_PF_CCC.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C7/PF_CCC_C7.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C8/PF_CCC_C8_0/PF_CCC_C8_PF_CCC_C8_0_PF_CCC.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CCC_C8/PF_CCC_C8.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CLK_DIV_C2/PF_CLK_DIV_C2_0/PF_CLK_DIV_C2_PF_CLK_DIV_C2_0_PF_CLK_DIV.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CLK_DIV_C2/PF_CLK_DIV_C2.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CLK_DIV_C3/PF_CLK_DIV_C3_0/PF_CLK_DIV_C3_PF_CLK_DIV_C3_0_PF_CLK_DIV.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_CLK_DIV_C3/PF_CLK_DIV_C3.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MONITOR_C0/PF_INIT_MONITOR_C0_0/PF_INIT_MONITOR_C0_PF_INIT_MONITOR_C0_0_PF_INIT_MONITOR.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MONITOR_C0/PF_INIT_MONITOR_C0.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_OSC_C0/PF_OSC_C0_0/PF_OSC_C0_PF_OSC_C0_0_PF_OSC.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_OSC_C0/PF_OSC_C0.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/Clock_Reset/Clock_Reset.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table_trigger.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/TB_ClockReset.vhd"

vsim -L PolarFire -L presynth -L CORESPI_LIB  -t 1ps -pli C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll -gSIM_PA5M300T=0 presynth.TB_ClockReset
add wave /TB_ClockReset/*
run 1000ns
