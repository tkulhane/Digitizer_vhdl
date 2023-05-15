set_device -family {PolarFire} -die {MPF300TS_ES} -speed {-1}
read_adl {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\Top.adl}
read_afl {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\Top.afl}
map_netlist
read_sdc {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\constraint\Top_derived_constraints.sdc}
check_constraints {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\constraint\placer_sdc_errors.log}
estimate_jitter -report {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\place_and_route_jitter_report.txt}
write_sdc -mode layout {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\place_route.sdc}
