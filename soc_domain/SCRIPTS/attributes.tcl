
#------------------------------------------
# Variables 1 -- Tool Usage related variables
#------------------------------------------
#set_attribute source_suspend_on_error true /
set_attr info 9 /
set_attr source_verbose true /
set_attr source_verbose_proc true /
set_attr fail_on_error_mesg true /
set_attr print_error_info $PRINT_ERROR_INFO /
set_attr show_report_options true /
if {$STATISTICS_LOG_DATA == "true"} {
    set_attr statistics_log_data $STATISTICS_LOG_DATA /
    set_attr statistics_run_id $DESIGN /
}

if {![info exists NUM_CPUS] | ($NUM_CPUS == 1)} {
  puts "OSI_INFO: super_thread_servers not set";
} elseif {$NUM_CPUS <= 4} {
  set_attribute super_thread_servers {localhost localhost localhost localhost} /
  set_attr iopt_enable_parallelization $IOPT_ENABLE_PARALLELIZATION /
} elseif {$NUM_CPUS <= 8} {
  set_attribute super_thread_servers {localhost localhost localhost localhost localhost localhost localhost localhost} /
  set_attr iopt_enable_parallelization $IOPT_ENABLE_PARALLELIZATION /
} elseif {$NUM_CPUS <= 12} {
  set_attribute super_thread_servers {localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost} /
  set_attr iopt_enable_parallelization $IOPT_ENABLE_PARALLELIZATION /
} else {
  set_attribute super_thread_servers {localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost localhost} /
  set_attr iopt_enable_parallelization $IOPT_ENABLE_PARALLELIZATION /
}

#------------------------------------------
# Variables 2 -- HDL Variables
#------------------------------------------
set_attr hdl_undriven_signal_value $HDL_UNDRIVEN_SIGNAL_VALUE /
set_attr hdl_undriven_output_port_value $HDL_UNDRIVEN_OUTPUT_PORT_VALUE /
set_attr constant_prop_through_iso_cell $CONSTANT_PROP_THROUGH_ISO_CELL /
set_attr write_vlog_top_module_first $VLOG_TOP_MODULE_FIRST /
set_attr hdl_error_on_blackbox $HDL_ERROR_ON_BLACKBOX /
set_attr hdl_generate_separator "_"
set_attr hdl_preserve_unused_register $HDL_PRESERVE_UNUSED_REGISTERS /
set_attr hdl_unconnected_input_port_value $HDL_UNCONNECTED_INPUT_PORT_VALUE /
set_attr hdl_error_on_latch $HDL_ERROR_ON_LATCH /
set_attr hdl_report_case_info $HDL_REPORT_CASE_INFO /
#set_attr hdl_array_naming_style %s_%d_ /
#set_attr bus_naming_style %s_%d_ /
#set_attr hdl_bus_wire_naming_style %s_%d_ /
#set_attr hdl_instance_array_naming_style %s_%d_ /
#set_attr hdl_generate_index_style %s_%d /
set_attr gen_module_prefix $GENERATE_MODULE_PREFIX /
set_attr hdl_use_techelt_first $HDL_USE_TECHELT_FIRST /   
set_attr write_vlog_wor_wand $WRITE_VLOG_WOR_WAND / 
set_attribute hdl_track_filename_row_col $HDL_TRACK_FILENAME_ROW_COL /


#------------------------------------------
# Variables 3 -- Design Elaboration
#------------------------------------------
set_attribute exact_match_seq_async_ctrls $EXACT_MATCH_SEQ_ASYNC_CTRLS /
set_attribute exact_match_seq_sync_ctrls $EXACT_MATCH_SEQ_SYNC_CTRLS /
set_attr auto_ungroup $AUTO_UNGROUP /
set_attr dp_disable_ungroup $DP_DISABLE_UNGROUP /

# >>> To ungroup specific modules, plz follow the below settings
#set_attribute auto_ungroup false [find / -design -subdesign *]
#set_attribute ungroup_ok true [find /designs/* -subdesign *add*]

#------------------------------------------
# Variables 4 -- Wireload Settings
# RAMBABU Not required defult wireload ; If you read LEF tool automatically sets the interconnect_mode to ple
#set_attribute interconnect_mode $INTERCONNECT_MODE /

#----------------------------------------
# Others
if {[regexp "RCP|GEN_PLE|PLE" $SYNTHESIS_FLOW]} {
	set_attr lib_lef_consistency_check_enable true /
} else {
        set_attr lib_lef_consistency_check_enable false /
}

# Below variable prevents the Breaking of timing path.
set_attribute timing_no_path_segmentation {set_max_delay set_data_check clock_gating} ; # Prevents breaking of the timing path at the -to pin of the specified timing checks

if {![info exists INSERT_CLOCK_GATING] | ($INSERT_CLOCK_GATING == "false") } {
    puts "OS_INFO: Insert Clock gating variable is not set. So clock gating insertion will not happen";
        set_attr lp_insert_clock_gating $INSERT_CLOCK_GATING /
} else {
         puts "OS_INFO: Insert Clock gating variable is set to yes . So clock gating insertion related variables are Set";
          set_attr lp_insert_clock_gating $INSERT_CLOCK_GATING /
}
