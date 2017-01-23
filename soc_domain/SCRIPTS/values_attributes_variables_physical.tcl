set PARAMETERIZED_ELABORATE "false"                     ;#{true | false}, To do Parameterised Elaborate set variable true & also edit plug script PRE_ELOB.tcl accordingly
set INSERT_CLOCK_GATING "true"                          ;#{true | false}, Controls insertion of clock-gating logic during synthesis.
set MIN_FLOPS_4_ICG "4"                                 ;#Minimum number of flops which ICG will drive
set MAX_FLOPS_4_ICG "1024"                                ;#Maximum number of flops which ICG will drive
set LP_CLK_GATING_AUTO_COST_GROUPING "true"             ;#{true | false},Controls whether to automatically create a cost group for   							     ;the paths going through clock gate enable pins.

#set LP_CLK_GATING_AUTO_PATH_ADJUST "none"              ;#{none|fixed|variable}, Controls the automatic timing adjustment on the 							     ;clock gate enable paths in the design
#set LP_CLK_GATING_AUTO_PATH_ADJUST_FIXED_DELAY "150"    ;#Provide Fixed delay value, to Over-contrain 'Enable" pin of ICG, only if 							     ;"LP_CLK_GATING_AUTO_PATH_ADJUST" value is set to fixed. Delay value is      							  ;technology dependent. "150" is for "40nm" technology.
set LP_CLK_GATING_INFER_ENABLE "false"                   ;#{true | false | set_reset_flops_only},To avoid complex implementation of 							     ;clock gate, plz set false for attribute
set RES_SCALE_FACTOR_4_PLE "1.10"                       ;#1.10 for 10% scaling of Res value
set CAP_SCALE_FACTOR_4_PLE "1.10"                       ;#1.10 for 10% scaling of Cap value
set STATISTICS_LOG_DATA "false"                         ;#{false | true}, Controls tracking and generation of the QoR metrics at each							     ;predefined (elaborate and synthesize) stage.
set HDL_UNDRIVEN_SIGNAL_VALUE "0"                       ;#{none | 0 | 1 | X}
set HDL_UNDRIVEN_OUTPUT_PORT_VALUE "0"                  ;#{none | 0 | 1 | X}
set HDL_UNCONNECTED_INPUT_PORT_VALUE "0"                ;#{none | 0 | 1 | X}
set HDL_PRESERVE_UNUSED_REGISTERS "false"               ;#{false | true}
set HDL_USE_TECHELT_FIRST "true"                        ;#{false | true} ,To use the .libs first rather than verilog
set HDL_TRACK_FILENAME_ROW_COL "false"                  ;#{false | true},Enables or disables file, row, column information tracking 							     ;while reading RTL, help for debug RTL errors, but impact on run time
set PRINT_ERROR_INFO "true"                             ;#{true|false}
set GENERATE_MODULE_PREFIX "RC_CW_"                    ;#Module Prefix for Non-user defined subdesign names
set CONSTANT_PROP_THROUGH_ISO_CELL "true"               ;#{false | true},Enables propagation of constants through isolation cells
set DELETE_UNLOADED_INSTS "true"                        ;#{false | true}
set DELETE_UNLOADED_SEQS "true"                         ;#{false | true}
set EXACT_MATCH_SEQ_ASYNC_CTRLS "true"                  ;#{false | true},If set to true, RTL Compiler tries to avoid tying off the; asynchronous control inputs of a flop to constants during technology mapping
set EXACT_MATCH_SEQ_SYNC_CTRLS "true"                   ;#{false | true},If set to true, RTL Compiler will try to force map the synchronous flops inferred from RTL to complex library flip-flops with corresponding synchronous inputs regardless of QoR
set DP_SPECULATION "none"                               ;#{ none | basic},Controls RTL speculation (unsharing) transformations in 							     ;datapath synthesis.
set DP_POSTMAP_UPSIZE "true"                            ;#{false | true},When set to true, allows upsizing of critical datapath 							     ;components after mapping.
set DP_AREA_MODE "false"                                ;#{false | true},When set to true, enables datapath optimizations that focus 							     ;on improving area results
set DP_REWRITING "basic"                                ;#{basic |advanced |none}
set DP_CSA "basic"                                      ;#{basic |advanced |none |inherited}
set DP_SHARING "advanced"                               ;#{basic |advanced |none |inherited}
set DRC_MAX_FANOUT_FIRST "false"                        ;#{false | true}
set TIME_RECOVERY_ARCS "true"                           ;#{false | true}
set TNS_OPTO "true"                                     ;#{false | true}
set OPTIMIZE_CONSTANT_0_FLOPS "true"                    ;#{false | true}
set OPTIMIZE_CONSTANT_1_FLOPS "true"                    ;#{false | true}
set OPTIMIZE_CONSTANT_LATCHES "true"                    ;#{false | true}
set OPTIMIZE_MERGE_FLOPS "false"                        ;#{false | true}
set OPTIMIZE_MERGE_LATCHES "false"                      ;#{false | true}
set MAX_LEAKAGE_POWER "100.0"                             ;# Provide the leakage power upto which power optimization to be done
set AUTO_UNGROUP "none"                                 ;#{none|both}
set DP_DISABLE_UNGROUP "false"                          ;#{true|false}
set VLOG_TOP_MODULE_FIRST "false"                       ;#{true|false}
set HDL_ERROR_ON_BLACKBOX "true"                        ;#{true|false}
set HDL_ERROR_ON_LATCH "true"                           ;#{true|false}
set HDL_REPORT_CASE_INFO "true"                         ;#{true|false}

set DFT_SCAN_MAP_MODE "force_all"                               ;#{tdrc_pass | preserve | force_all}
set DFT_CONNECT_SHIFT_ENABLE_DURING_MAPPING "tie_off"           ;#{tie_off | floating}
set DFT_CONNECT_SCAN_DATA_PINS_DURING_MAPPING "loopback"        ;#{loopback | floating | ground}
set USE_SCAN_SEQS_FOR_NON_DFT "false"                           ;#{true |false | degenerated_only} ,Controls the mapping of registers to scan flops for functional purposes

set BOUNDARY_OPTO "true"                                ;#{false | true}
set IDEAL_SEQ_ASYNC_PINS "false"                        ;#{false | true}
set REMOVE_ASSIGNS "true"                               ;#{false | true}
set WRITE_VLOG_WOR_WAND "true"				;#{false | true},When set to false, a wor (wand) wire is declared as a wire rather than a wor (wand).
set IOPT_ENABLE_PARALLELIZATION "true"                  ;#{false | true}
set IOPT_ULTRA_OPTIMIZATION "true"                      ;#{false | true}
set ULTRA_GLOBAL_MAPPING "false"                        ;#{false | true}
set LEAKAGE_POWER_EFFORT "low"                          ;#{ none |low | medium | high }
set LP_POWER_ANALYSIS_EFFORT "medium"                   ;#{medium | low | high}

# ------------------------
# Physical Attributes
# ------------------------

set CONGESTION_EFFORT "low" 				;#{off | low | medium | high}.This attributes specifies congestion effort during incremental optimization.
set PQOS_PLACEMENT_EFFORT "high" 			;#{no_value | low | medium | high}. This attributes specifies congestion effort during EDI placement.
#set ENC_IN_PLACE_OPT "false" 				;#{false | true}
set ENC_PRE_PLACE_OPT "true" 				;#{false | true}
set ENC_TIMING_DRIVEN_PLACE "true" 			;#{false | true}
#set ENC_OPT_DRV "true" 				;#{false | true}
set USE_AREA_FROM_LEF "true" 				;#{false | true | auto}
set PQOS_IGNORE_SCAN_CHAINS "false" 			;#{false | true}

set ENC_PHY_FLOW_EFFORT "high"				;#{high | none}

#---------------------------------
