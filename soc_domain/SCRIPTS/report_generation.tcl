
#######################################
# PROCEDURE for Customized Reporting
#######################################

proc GEN_REPORTS { design_name stage } {

global OUTPUTS_PATH 
global REPORTS_PATH 
global SYNTHESIS_FLOW
# --------------------------------------------------
# WRITING DB/NETLIST/SDC/LEC_DO_FILE/EDI_SETUP_FILES
# --------------------------------------------------

	if { [regexp "GENERIC|MAPPED|INCREMENTAL|PHYSICAL" $stage] } {
 
		write_hdl ${design_name} > ${OUTPUTS_PATH}/${design_name}_${stage}.v.gz
		write_hdl -lec  ${design_name} > ${OUTPUTS_PATH}/${design_name}_${stage}_LEC.v.gz
		#write_do_lec -revised_design ${OUTPUTS_PATH}/${design_name}_${stage}_lec.v.gz -hier -logfile ./LEC_DO_FILE/${design_name}_${stage}_LEC.log > ./LEC_DO_FILE/${design_name}_${stage}_lec.dofile ;
		write_sdc -no_split ${design_name} > ${OUTPUTS_PATH}/${design_name}_${stage}.sdc
		write_db -all_root_attributes -script ${OUTPUTS_PATH}/${design_name}_${stage}_setup.tcl -to_file ${OUTPUTS_PATH}/${design_name}_${stage}.db
	}

	if { [regexp "MAPPED|INCREMENTAL|PHYSICAL" $stage] } { 
		if {$SYNTHESIS_FLOW == "RCP"} {
		write_design -gzip -encounter -basename ${OUTPUTS_PATH}/${stage}_EDI_SETUP/${design_name}_${stage}
		}
		write_do_lec -revised_design ${OUTPUTS_PATH}/${design_name}_${stage}_LEC.v.gz -hier -logfile ./LEC_DO_FILE/${design_name}_${stage}_LEC.log > ./LEC_DO_FILE/${design_name}_${stage}_LEC.dofile ;
	}

# --------------------------
# GENERATING REPORTS
# --------------------------

	if { [regexp "GENERIC|MAPPED|INCREMENTAL|PHYSICAL" $stage] } {

		generate_report -outdir ${REPORTS_PATH} -tag ${stage}
		report summary > ${REPORTS_PATH}/${design_name}_Timing_Summary_${stage}.rpt
	}

	if { [regexp "INITIAL|INCREMENTAL|PHYSICAL" $stage] } {

		check_design -all > ${REPORTS_PATH}/check_design_${stage}.rpt
		report timing -lint -verbose > ${REPORTS_PATH}/check_timing_${stage}.rpt
	}

	if { [regexp "INCREMENTAL|PHYSICAL" $stage] } {

		report timing -endpoint -slack_limit 0 -num_paths 10000 > ${REPORTS_PATH}/${design_name}_all_violator_summary_${stage}.rpt
		report clock_gating > ${REPORTS_PATH}/${design_name}_clockgating_${stage}.rpt
		report power -verbose -depth 0 > ${REPORTS_PATH}/${design_name}_power_${stage}.rpt
        report clocks > ${REPORTS_PATH}/${design_name}_${stage}_CLOCKS.rpt
        report clocks -generated >> ${REPORTS_PATH}/${design_name}_${stage}_CLOCKS.rpt
		#statistics report -run_id ${design_name} -ignore_user_defined > ${REPORTS_PATH}/QoR_Metrics_${stage}.rpt
		if {$SYNTHESIS_FLOW != "WLM"} {
		report ple > ${REPORTS_PATH}/PLE_${stage}.rpt
		}
		report messages -all > ${REPORTS_PATH}/${design_name}_${stage}_WARNING_INFO_ERROR.rpt
			
		###	
		foreach cg [find / -cost_group *] {
		    set slack [get_attr slack $cg]
		    if {$slack < 0} {
			set cgbase [basename $cg]
			report timing -cost_group [list $cg] -num_paths 1000  -slack_limit 0  >> ${REPORTS_PATH}/${design_name}_${cgbase}_${stage}.rpt
		    } else {
			set cgbase [basename $cg]
			report timing -cost_group $cg -num_paths 100  >> ${REPORTS_PATH}/${design_name}_${cgbase}_${stage}.rpt
		    }
		}
		###	
	}

	if { [regexp "PHYSICAL" $stage] } {
	
		report messages -all > ${REPORTS_PATH}/${design_name}_${stage}_WARNING_INFO_ERROR.rpt
		###	
		foreach cg [find / -cost_group *] {
		    set slack [get_attr slack $cg]
		    if {$slack < 0} {
			set cgbase [basename $cg]
			report timing -cost_group [list $cg] -num_paths 1000  -slack_limit 0  >> ${REPORTS_PATH}/${design_name}_${cgbase}_${stage}.rpt
		    } else {
			set cgbase [basename $cg]
			report timing -cost_group $cg -num_paths 100  >> ${REPORTS_PATH}/${design_name}_${cgbase}_${stage}.rpt
		    }
		}
		###	
	}
}

#-------------------------------------------

proc UNREG_I_O { design_name stage } { 

global OUTPUTS_PATH 
global REPORTS_PATH 

set inputs {};
set outputs {};
set fanout_non_buf {};
set fanin_non_buf {};
set inputs [all_inputs] ;
set outputs [all_outputs] ;

echo " LIST OF UNREGISTERED INPUTS FOR BLOCK $design_name " > ${REPORTS_PATH}/${design_name}_unregistered_inputs.rpt ;
echo " LIST OF UNREGISTERED OUTPUTS FOR BLOCK $design_name " > ${REPORTS_PATH}/${design_name}_unregistered_outputs.rpt ;



foreach inp $inputs { 
		set fanout_non_buf {};
		set port_name [basename $inp ] ;
		set fanout [fanout -structural $port_name ] ;
		if { $stage == "SYN" } { 
			if { [llength $fanout ] <  2 } { 
			echo " port $port_name is already registered " ;
			} else {
					set buf_inv_clk 0; 
				  		 if { [regexp clk $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				    		     }
				  		 if { [regexp rst $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				    		     }
				  		 if { [regexp reset $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		 if { [regexp scan $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		 if { [regexp mbist $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		 if { [regexp rf_ $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		  if { [regexp sram_ $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		  if { [regexp shift_latch_enable  $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
					
					if { $buf_inv_clk == 0 } { 		
						echo " $port_name " >> ${REPORTS_PATH}/${design_name}_unregistered_inputs.rpt ;
				  		}
					}

		} else {		
			if { [llength $fanout ] < 2 } { 
			echo " port $port_name is already registered " ;
			} else {
				foreach f $fanout {
					set buf_inv_clk 0 ;
					set lib_pin [get_attr libpin $f ] ;
				  		if { [regexp INV $lib_pin ] == 1 } {
							set buf_inv_clk  1 ;
				      		    }
				 		 if { [regexp BUF $lib_pin ] == 1 } { 
							set buf_inv_clk  1 ;
				     		     }	
				  		 if { [regexp clk $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				    		     }
				  		 if { [regexp rst $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				    		     }
				  		 if { [regexp reset $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		 if { [regexp scan $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		 if { [regexp mbist $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		 if { [regexp rf_ $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		  if { [regexp sram_ $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
				  		  if { [regexp shift_latch_enable  $port_name] == 1 } { 
							set buf_inv_clk  1 ;
				   		     }
					
					if { $buf_inv_clk == 0 } { 		
				   		set fanout_non_buf [ concat $fanout_non_buf $f ] ;
				  		}
					}

				if { [llength $fanout_non_buf] > 1 } { 
				   echo " $port_name , [llength $fanout_non_buf] " >> ${REPORTS_PATH}/${design_name}_unregistered_inputs.rpt ;
				}
		}
	}	

}
	 	


foreach out $outputs { 
		set fanin_non_buf {};
		set port_name [basename $out ] ;
		set fanin [fanin -structural $port_name ] ;
		if { $stage == "SYN" } { 
			if { [llength $fanin ] <  3 } { 
			echo " port $port_name is already registered " ;
			} else {
			echo " $port_name  " >> ${REPORTS_PATH}/${design_name}_unregistered_inputs.rpt ;
			}
		} else {		
			if { [llength $fanin ] < 3 } { 
				echo " output port $port_name is already registered " 
				} else {
					foreach f $fanin {
						set buf_inv_clk 0 ;
						set lib_pin [get_attr libpin $f ] ;
				  			if { [regexp INV $lib_pin ] != 1 } {
							set buf_inv_clk 1 ;
				   			}
 				 			if { [regexp BUF $lib_pin ] != 1 } {
							set buf_inv_clk 1 ;
				   			}
							if { $buf_inv_clk == 0  } {
				 			set fanin_non_buf [ concat $fanin_non_buf $f ] ;
			          			}
						}	

				if { [llength $fanin_non_buf] > 2 } { 
					echo " $port_name , [llength $fanin_non_buf] " >> ${REPORTS_PATH}/${design_name}_unregistered_outputs.rpt ;
				}

		}

}

}
}
	 	



				
		

				
		





