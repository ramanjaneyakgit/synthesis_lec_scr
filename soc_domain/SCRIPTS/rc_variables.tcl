####################################################################
# RC Variables -- Applied after Reading the Design
####################################################################

# --------------------------------------------------------
# Variables 1 -- Boundary Optimization Variables
# --------------------------------------------------------
set_attribute boundary_opto $BOUNDARY_OPTO [find / -design -subdesign *]

# --------------------------------------------------------
# Variables 2 -- Sequential Logic Optimization Variables
# --------------------------------------------------------
set_attribute delete_unloaded_seqs $DELETE_UNLOADED_SEQS /
set_attribute optimize_constant_0_flops $OPTIMIZE_CONSTANT_0_FLOPS /
set_attribute optimize_constant_1_flops $OPTIMIZE_CONSTANT_1_FLOPS /
set_attribute delete_unloaded_insts $DELETE_UNLOADED_INSTS /
set_attribute optimize_constant_latches $OPTIMIZE_CONSTANT_LATCHES /

# --------------------------------------------------------
# Variables 3 -- Sequential Merging Variables
# --------------------------------------------------------
set_attribute optimize_merge_flops $OPTIMIZE_MERGE_FLOPS /
set_attribute optimize_merge_latches $OPTIMIZE_MERGE_LATCHES /
# >>> To disable sequential merge for any instances, plz use the below attribute
#set_attr optimize_merge_seq false [find / -inst *phase0_clone*]

# --------------------------------------------------------
# Variables 4 -- Clock Gating Insertion variables
# --------------------------------------------------------
if {[info exists INSERT_CLOCK_GATING] && ($INSERT_CLOCK_GATING == "true") } {
	puts "OS_INFO: Insert Clock gating variable is set to yes . So clock gating insertion related variables are Set";
	set_attr lp_clock_gating_prefix ${DESIGN}_RC_CG /
	set_attr lp_clock_gating_min_flops $MIN_FLOPS_4_ICG /designs/${DESIGN}
	set_attr lp_clock_gating_max_flops $MAX_FLOPS_4_ICG /designs/${DESIGN}
	set_attr lp_clock_gating_auto_cost_grouping $LP_CLK_GATING_AUTO_COST_GROUPING /designs/${DESIGN}
#	set_attr lp_clock_gating_auto_path_adjust $LP_CLK_GATING_AUTO_PATH_ADJUST /designs/${DESIGN}
#	set_attr lp_clock_gating_auto_path_adjust_fixed_delay $LP_CLK_GATING_AUTO_PATH_ADJUST_FIXED_DELAY /designs/${DESIGN}
	set_attr lp_clock_gating_infer_enable $LP_CLK_GATING_INFER_ENABLE / 

	if {[info exists CLOCK_GATING_CELL] & ($CLOCK_GATING_CELL != "")} {
		set_attr lp_clock_gating_cell [find /libraries/ -libcell ${CLOCK_GATING_CELL}] /designs/${DESIGN}
	}
}

# --------------------------------------------------------
# Variables 5 -- Datapath Optimization variables
# --------------------------------------------------------
set_attr dp_sharing $DP_SHARING /    
set_attr dp_speculation $DP_SPECULATION /
set_attr dp_csa $DP_CSA /
set_attr dp_postmap_upsize $DP_POSTMAP_UPSIZE /
set_attr dp_area_mode $DP_AREA_MODE /
set_attr dp_rewriting $DP_REWRITING /

# --------------------------------------------------------
# Variables 6 -- Power Optimization attributes 
# --------------------------------------------------------
set_attribute leakage_power_effort $LEAKAGE_POWER_EFFORT /
set_attribute max_leakage_power $MAX_LEAKAGE_POWER /designs/${DESIGN}
set_attribute lp_power_analysis_effort $LP_POWER_ANALYSIS_EFFORT /
set_attribute lp_power_unit mW /

# >>> Use the below dynamic power settings, only if VCD/TCF is used for Synthesis. Weitage is given to optimize both leakage/dynamic power
#set_attribute max_dynamic_power 0.0 /designs/${DESIGN}
#set_attribute lp_power_optimization_weight 1 /designs/${DESIGN}

# --------------------------------------------------------
# Variables 7 -- Timing Optimization Variables -- These variables effects the timings.
# --------------------------------------------------------
set_attr tns_opto $TNS_OPTO /
set_attr ideal_seq_async_pins  $IDEAL_SEQ_ASYNC_PINS /designs/$DESIGN
set_attr scale_of_cap_per_unit_length $CAP_SCALE_FACTOR_4_PLE /
set_attr scale_of_res_per_unit_length $RES_SCALE_FACTOR_4_PLE /
set_attr drc_max_fanout_first $DRC_MAX_FANOUT_FIRST /
set_attr time_recovery_arcs $TIME_RECOVERY_ARCS /
# >>> The below ultra opt may increase runtime; can be enabled for critical timing blocks
set_attr iopt_ultra_optimization $IOPT_ULTRA_OPTIMIZATION /
# >>> The below Ultra global mapping attr is used during mapping phase
set_attr ultra_global_mapping $ULTRA_GLOBAL_MAPPING /
# >>> If Libraries doesnt have Area Info, use the below settings to use Area Info from LEF files
set_attr use_area_from_lef $USE_AREA_FROM_LEF /

# --------------------------------------------------------
# Variables 8 -- DFT Specific variables
# --------------------------------------------------------
set_attr dft_scan_map_mode $DFT_SCAN_MAP_MODE  "/designs/${DESIGN}"
set_attr dft_connect_shift_enable_during_mapping $DFT_CONNECT_SHIFT_ENABLE_DURING_MAPPING "/designs/${DESIGN}"
set_attr dft_connect_scan_data_pins_during_mapping $DFT_CONNECT_SCAN_DATA_PINS_DURING_MAPPING "/designs/${DESIGN}" 
set_attr use_scan_seqs_for_non_dft $USE_SCAN_SEQS_FOR_NON_DFT / 

# --------------------------------------------------------
# Variables 9 -- Misc Variables
# --------------------------------------------------------
set_attribute remove_assigns $REMOVE_ASSIGNS /
set_remove_assign_options -verbose -dont_skip_unconstrained_paths -ignore_preserve_setting -no_buffers_use_inverters -ignore_preserve_map_size_ok 

# --------------------------------------------------------

