project -load C:/VHDL_temp/Digitizer/Digitizer_vhdl/Digitizer/synthesis/identify_debug/scratchproject.prs
puts "Generating SRS instrumentation file: C:\VHDL_temp\Digitizer\Digitizer_vhdl\Digitizer\synthesis\identify_debug\instr_sources\syn_dics.v"
 if { [catch {write instrumentation} err] } {
    puts stderr "write instrumentation failed $err"
    exit 9
}
