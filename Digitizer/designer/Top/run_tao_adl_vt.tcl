set_device -family {PolarFire} -die {MPF300TS_ES} -speed {-1}
read_adl {C:\VHDL_temp\Digitizer\Digitizer_ver2\Digitizer\designer\Top\Top.adl}
read_afl {C:\VHDL_temp\Digitizer\Digitizer_ver2\Digitizer\designer\Top\Top.afl}
map_netlist
read_sdc {C:\VHDL_temp\Digitizer\Digitizer_ver2\Digitizer\constraint\Top_derived_constraints.sdc}
check_constraints {C:\VHDL_temp\Digitizer\Digitizer_ver2\Digitizer\constraint\timing_sdc_errors.log}
estimate_jitter -report {C:\VHDL_temp\Digitizer\Digitizer_ver2\Digitizer\designer\Top\timing_analysis_jitter_report.txt}
write_sdc -mode smarttime {C:\VHDL_temp\Digitizer\Digitizer_ver2\Digitizer\designer\Top\timing_analysis.sdc}
