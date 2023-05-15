open_project -project {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\Top_fp\Top.pro}
enable_device -name {MPF300TS_ES} -enable 1
set_programming_file -name {MPF300TS_ES} -file {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\Top.ppd}
set_programming_action -action {PROGRAM} -name {MPF300TS_ES} 
run_selected_actions
save_project
close_project
