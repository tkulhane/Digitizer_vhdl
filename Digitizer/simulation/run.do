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

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/EXT_Signals_Controller.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/EXT_Signals_OutputSwitch.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/Actel/SgCore/PF_IO/2.0.104/core/vlog/PF_IO.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/PF_IO_C0/PF_IO_C0.v"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/EXT_Signals/EXT_Signals.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmd_table_trigger.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/TB_EXT_Signals.vhd"

vsim -L PolarFire -L presynth -L CORESPI_LIB  -t 1ps -pli C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll -gSIM_PA5M300T=0 presynth.TB_EXT_Signals
add wave /TB_EXT_Signals/*
run 1000ns
