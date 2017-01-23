#############################
# RC Physical Attributes
#############################

# --------------------------------------------------------
#Variables 1 -- Removing assign statements 
set_attr enc_assign_removal $ENC_ASSIGN_REMOVAL /
if {$ENC_ASSIGN_REMOVAL == "true"} {
    set_attr enc_assign_buffer [find / -libcell $ASSIGN_BUF] /
}

# --------------------------------------------------------
#Variables 2 -- Congestion and Placement Effort             
set_attr congestion_effort $CONGESTION_EFFORT /
set_attr pqos_placement_effort $PQOS_PLACEMENT_EFFORT /

# --------------------------------------------------------
#Variables 3 -- Optimization in EDI 
#set_attr enc_in_place_opt $ENC_IN_PLACE_OPT /            ;# In-place optimization flow is obsolete in encounter. Latest flow recommendations have been turned on by default in this build
set_attr enc_pre_place_opt $ENC_PRE_PLACE_OPT /          

set_attr enc_timing_driven_place $ENC_TIMING_DRIVEN_PLACE /
#set_attr enc_opt_drv $ENC_OPT_DRV /

# --------------------------------------------------------
#Variables 4 -- To reorder the Scan Chain in EDI ( Through RC-P)
set_attr pqos_ignore_scan_chains $PQOS_IGNORE_SCAN_CHAINS /

# --------------------------------------------------------
#Variables 5 -- RC scaling, to resolve minor discrepancies between the default, detail, and sign-off extractors 
#set_attr scale_of_res_per_unit_length $RES_scale_factor_4_PLE /
#set_attr scale_of_cap_per_unit_length $CAP_scale_factor_4_PLE /
set phys::edi_correlation 1 				;# To auto-generate EDI correlation as part of RCP flow.

# --------------------------------------------------------
#Variables 6 -- Tool Version Attributes
set_attr enc_gzip_interface_files true /
set_attr encounter_executable $EDI_EXECUTE
regexp \[0-9\]+(\.\[0-9\]+) [get_attribute program_version /] exe_ver exe_sub_ver
puts "OS_INFO : Executable Version: $exe_ver"

# --------------------------------------------------------
#Variables 7 -- Other variables
set_attr number_of_routing_layers $NUMBER_OF_ROUTING_LAYERS /designs/${DESIGN}
set_attr enc_temp_dir $ENC_TEMP_DIR /
set_attr enc_postload_script  ${EDI_COMMON_SCRIPTS}/enc_postload_script.tcl

if {$ENC_PHY_FLOW_EFFORT == "none"} {
set_attr enc_preexport_script ${EDI_COMMON_SCRIPTS}/enc_preexport_file.tcl
}

# --------------------------------------------------------
#Variable 8 -- RCP Dexter Flow
set_attr phys_flow_effort $ENC_PHY_FLOW_EFFORT /
#set_attr iopt_enable_parallelization $IOPT_ENABLE_PARALLELIZATION /
