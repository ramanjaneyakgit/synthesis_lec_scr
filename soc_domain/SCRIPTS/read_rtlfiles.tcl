
#------------------------------
# Design VHDL files
#------------------------------
#foreach myfile $rtl_filelist_vhdl {
#    read_hdl -vhdl -library WORK $myfile
#}

if {[llength $rtl_filelist_vhdl]  != 0 } {
    read_hdl -vhdl -library WORK_vhdl $rtl_filelist_vhdl
}

#------------------------------
# Design Verilog files
#------------------------------
#foreach myfile $rtl_filelist_verilog {
#    read_hdl -v2001 -library WORK $myfile
#}

if {[llength $rtl_filelist_verilog] != 0} {
    read_hdl -v2001 -library WORK_verilog $rtl_filelist_verilog
}


#------------------------------
# Design System verilog files
#------------------------------
#foreach myfile $rtl_filelist_sv_verilog {
#    read_hdl -sv -library WORK $myfile
#}
if {[llength $rtl_filelist_sv] != 0} {
    read_hdl -sv -library WORK_sv $rtl_filelist_sv
}

#------------------------------
#For stuctured verilog files (Netlists)
#------------------------------
if {[llength $rtl_filelist_netlist] != 0 } {
    read_hdl -netlist $rtl_filelist_netlist
}

#------------------------------

