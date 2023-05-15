read_sdc -scenario "place_and_route" -netlist "optimized" -pin_separator "/" -ignore_errors {C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/designer/Top/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\Top_layout_combinational_loops.xml}
report -type slack {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\pinslacks.txt}
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\Top_place_and_route_constraint_coverage.xml}]
set reportfile {C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\designer\Top\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp