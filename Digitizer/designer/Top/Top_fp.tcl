new_project \
         -name {Top} \
         -location {C:\VHDL\Digitizer\Digitizer_ver1\Digitizer\designer\Top\Top_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {MPF300TS_ES} \
         -name {MPF300TS_ES}
enable_device \
         -name {MPF300TS_ES} \
         -enable {TRUE}
save_project
close_project
