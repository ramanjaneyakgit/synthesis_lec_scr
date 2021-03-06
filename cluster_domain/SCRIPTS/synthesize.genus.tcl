#############################
# RC-Synthesis Script
#############################

echo "OS_INFO: Time(Start): [date]"
echo "OS_INFO: Sourcing Root-Level attributes"

set WORK_AREA [lpwd]
set RC_COMMON_INPUTS ${WORK_AREA}/INPUTS
set RC_COMMON_PLUGS ${WORK_AREA}/PLUGS
set OUTPUTS_PATH ${WORK_AREA}/${DESIGN}/${SYNTHESIS_FLOW}/OUTPUTS
set REPORTS_PATH ${WORK_AREA}/${DESIGN}/${SYNTHESIS_FLOW}/REPORTS
set EDI_COMMON_SCRIPTS ${RC_COMMON_SCRIPTS}/EDI_SCRIPTS 
source -v ${RC_COMMON_INPUTS}/user_attr_file.tcl
source -v ${RC_COMMON_SCRIPTS}/values_attributes_variables_physical.tcl

echo "OS_INFO: Sourcing attributes ..."
source -v ${RC_COMMON_SCRIPTS}/attributes.tcl


echo "OS_INFO: Sourcing Post-attributes script ..."
#### Sourcing Post-attribute PLUG script ###
source -v ${RC_COMMON_PLUGS}/POST_ATTRIBUTES.tcl

source -v ${RC_COMMON_SCRIPTS}/create_directory.tcl
source -v ${RC_COMMON_SCRIPTS}/report_generation.tcl		;# Customized Report Generation

echo "OS_INFO: Hostname : [info hostname]"

#================================
# User Variables Info
#================================

# Following settings are for debugging
applet load time_info
alias timestat $::ns(time_info)::time_info

# To report detail breakup for Mapper Runtime
set show_runtime_report 1

# For debugging Purpose
set map_fancy_names 1 
set iopt_stats 1 
set check_targets 1 

echo "OS_INFO: DESIGN NAME: $DESIGN"
echo "OS_INFO: SYNTHESIS FLOW: $SYNTHESIS_FLOW"
echo "OS_INFO: COMMON SCRIPTS AREA: $RC_COMMON_SCRIPTS"
echo "OS_INFO: SYN::GENERIC EFFORT: $GEN_EFF"
echo "OS_INFO: SYN::MAP EFFORT: $MAP_EFF"
echo "OS_INFO: SYN::INCREMENENT EFFORT: $INC_EFF"
echo "OS_INFO: NUM_CPUS: $NUM_CPUS"

#================================
# Reading Libraries
#================================
echo "OS_INFO: Reading Libraries"

source ${COMMON_LIB_SETUP}		
library_setup ${DEVICE_CORNER} 

if { [llength $LIB_OF_SUBBLOCKS] != 0 } {
        lappend all_libs ${LIB_OF_SUBBLOCKS}
}

set timing_libs $all_libs

if {[regexp "true" $WANT_POWER_LIB]} {

	create_library_domain {TIMING POWER}
	set_attribute library $timing_libs [find /libraries -library_domain TIMING]
	library_setup ${POWER_LIB_CORNER}
	set power_libs $all_libs
	set_attribute library $power_libs  [find /libraries -library_domain POWER]

	set_attribute power_library [find /libraries -library_domain POWER] [find /libraries -library_domain TIMING]
	set_attribute default true [find /libraries -library_domain TIMING]

} else {

	set_attribute library $timing_libs

}

check_library

global timing_libs
global power_libs

#====================================
# READING PHYSICAL LIBRARIES [LEF's]
#====================================

if {[regexp "RCP|GEN_PLE|PLE" $SYNTHESIS_FLOW]} {

	echo "OS_INFO: Reading Lef Files and Cap Tables and qrcTech files For $SYNTHESIS_FLOW FLOW"
	
	source ${COMMON_LEF_CAP_QRCTECH_SETUP}
	if { [llength $LEF_OF_SUBBLOCKS] != 0 } {
        	lappend lef_files ${LEF_OF_SUBBLOCKS}
	}

	set_attr lef_library $lef_files /
# RAMBABU 	set_attr cap_table_file $captables /
	set_attr qrc_tech_file $qrc_tech_file /

} 

# ---------------------
# Don't Use Cell List

if {[llength $DONT_USE_CELL_FILE] != 0} {
echo "OS_INFO: Sourcing Dont Use list"
source ${DONT_USE_CELL_FILE}
if {[llength $CLOCK_GATING_CELL] != 0} {
set_attr avoid false [find /libraries/ -libcell $CLOCK_GATING_CELL]
}
}

timestat RC_SETUP_DONE



#================================
# DESIGN ELABORATION
#================================
echo "OS_INFO: Reading RTL files and Elaborations"

source ./scripts/analyze/analyze.tcl

#source ${RC_COMMON_INPUTS}/rtl_filelist.tcl

#set_attr hdl_search_path $hdl_search_path
#source ${RC_COMMON_SCRIPTS}/read_rtlfiles.tcl

timestat RTL_READ

echo "OS_INFO: Sourcing Pre-elobrate PLUG script script ..."
#### Sourcing Pre-elobrate PLUG script ###
source ${RC_COMMON_PLUGS}/PRE_ELAB.tcl

if {[regexp "false" $PARAMETERIZED_ELABORATE]} {

elaborate $DESIGN

}
timestat ELABORATED
##suspend

#================================
# ZWLM Variable Settings
#================================

if {$SYNTHESIS_FLOW == "WLM"} {
set_attribute wireload_mode $WIRELOAD_MODE /
# To choose Zero Wireload, use below settings
if {$WIRELOAD_TYPE == "none"} {
set_attribute force_wireload none "/designs/$DESIGN"
} else {
set_attribute force_wireload [lindex [find / -wireload ${WIRELOAD_TYPE}] 1] "/designs/$DESIGN"
}
}


###  set BLOCKS_TO_BE_PRESERVED "module_name "

if {${BLOCKS_TO_BE_PRESERVED} != ""} {
        foreach subdesign ${BLOCKS_TO_BE_PRESERVED} {
                set subdesign_path [ find /designs/${DESIGN} -subdesign ${subdesign} ]
                if { ${subdesign_path} != ""} {
                        set_attribute preserve true [ find /designs/${DESIGN} -subdesign ${subdesign} ]
                       # set_attribute boundary_opto false [ find /designs/${TOP_MODULE} -subdesign ${subdesign} ]
                }
	}
}

###  set INSTANCES_TO_BE_PRESERVED "instance_name"

if {${INSTANCES_TO_BE_PRESERVED} != ""} {
        foreach instance ${INSTANCES_TO_BE_PRESERVED} {
                set instance_path [ find /designs/${DESIGN} -inst ${instance} ]
                if { ${instance_path} != ""} {
                        set_attribute preserve true [ find /designs/${DESIGN} -inst ${instance} ]
                        #set_attribute boundary_opto false [ get_attribute subdesign ${instance_path} ]
                }
        }
}


#---------------
# RC Variables 

echo "OS_INFO: Sourcing RC Variables..."
source -v ${RC_COMMON_SCRIPTS}/rc_variables.tcl

echo "OS_INFO: Sourcing Post-RC variables PLUG script script ..."
#### Sourcing Post-RC variables PLUG script ###
source -v ${RC_COMMON_PLUGS}/POST_RC_VARIABLES.tcl

#=====================================
# Timing Constraints
#=====================================
echo "OS_INFO: Reading Timing Constraints"

foreach sdc $SDC {
set ext [lindex [split $sdc .] end]
if { $ext == "sdc" || $ext == "SDC" } {
	read_sdc $sdc
} elseif { $ext == "tcl" || $ext == "TCL" } {
	source $sdc
} else {
echo "OS_INFO: Give proper SDC extension : .tcl or .sdc"
echo "RC is exiting"
exit
}
}


timestat SDC_READ

#=======================================================
# Reading DEF and Decrypting PLE model
#=======================================================
if {([regexp "RCP|GEN_PLE|PLE" $SYNTHESIS_FLOW]) && ([llength $DEF] != 0)} {

        echo "OS_INFO: Reading floorplan def of ${DESIGN}..."

        read_def $DEF

        timestat READ_DEF
} else {
	echo "OS_INFO: No def is defined for Synthesis flow $SYNTHESIS_FLOW..."
}


if {[regexp "GEN_PLE" $SYNTHESIS_FLOW]} {

	echo "OS_INFO: Sourcing Physical attributes ..."
	# ---------------------------------
	# Sourcing RC Physical Attributes
	
	source -v ${RC_COMMON_SCRIPTS}/attributes_physical.tcl

        echo "OS_INFO: Sourcing Post-Physical attributes PLUG script ..."
	#### Sourcing Post-Physical attribute PLUG script ###
	source -v ${RC_COMMON_PLUGS}/POST_ATTRIBUTES_PHYSICAL.tcl
	
	timestat SOURCED_RC_PHYSICAL_ATTRIBUTES
	# ----------------------------------
	
	set ::phys::edi_mode_settings 1
        echo "OS_INFO: Generating PLE model file..."
	echo "PLE file name & path: ${OUTPUTS_PATH}/${DESIGN}_PLE_MODEL_FILE.etf"
        generate_ple_model $DESIGN -outfile ${OUTPUTS_PATH}/${DESIGN}_PLE_MODEL_FILE.etf
        report ple
        timestat GENERATED_PLE_MODEL_FILE
	quit
}


if {[regexp "RCP|PLE" $SYNTHESIS_FLOW]} {

	if {$SYNTHESIS_FLOW == "RCP"} {
		echo "OS_INFO: Sourcing Physical attributes ..."
		# ---------------------------------
		# Sourcing RC Physical Attributes
		
		source -v ${RC_COMMON_SCRIPTS}/attributes_physical.tcl
		echo "OS_INFO: Sourcing Post-Physical attributes PLUG script ..."
        	#### Sourcing Post-Physical attribute PLUG script ###
		source -v ${RC_COMMON_PLUGS}/POST_ATTRIBUTES_PHYSICAL.tcl
		
		
		timestat SOURCED_RC_PHYSICAL_ATTRIBUTES
		# ----------------------------------
	}

	if {($USER_HAS_GENERATED_PLE_MODEL_FILE == "yes") && ([llength $USER_GENERATED_PLE_FILE] != 0)} {

                        echo "OS_INFO: Decrypting PLE model file..."
                        decrypt $USER_GENERATED_PLE_FILE
                        report ple
                        timestat READ_USER_GENERATED_PLE_MODEL_FILE

	} else {

			echo "OS_INFO: No PLE model file used for Synthesis flow $SYNTHESIS_FLOW"
	                report ple
	                timestat GLOBAL_PLE_MODEL

	}			
}		

#=============================================================
# Path Group Creation - 12R R2R R2O I2O TO_MEM FROM_MEM 
#=============================================================
echo "OS_INFO: Creating path groups "

source ${RC_COMMON_SCRIPTS}/path_group_creation.tcl

timestat PATH_GROUPS_CREATED


echo "OS_INFO: Sourcing Pre-Generic PLUG script ..."
#### Sourcing Pre-Generic PLUG script ###
source ${RC_COMMON_PLUGS}/PRE_GEN.tcl


#=======================================
# To Report Initial Timing Reports
#=======================================

GEN_REPORTS $DESIGN INITIAL

timestat INITIAL


#=======================
# Synthesis - Generic
#=======================
echo "OS_INFO: Starting Synthesis - Generic Step"

# RAMBABU synthesize -to_generic -eff $GEN_EFF
if {$SYNTHESIS_FLOW == "RCP"} {
syn_gen -phys
} else {
### LOGICAL
syn_gen
}

GEN_REPORTS $DESIGN GENERIC

timestat GENERIC

echo "OS_INFO: Sourcing Pre-Map PLUG script ..."
#### Sourcing Pre-Map PLUG script ###
source ${RC_COMMON_PLUGS}/PRE_MAP.tcl

#=========================
# Synthesis - To Mapped
#=========================

### If lp_clock_gating_infer_enable is true set the below varibale, other wise tool throws error.
if {[info exists LP_CLK_GATING_INFER_ENABLE] && ($LP_CLK_GATING_INFER_ENABLE == true)} {
set lp_clock_gate_infer_nets 0
}

echo "OS_INFO: Starting Synthesis - Mapped Step"

# RAMBABU synthesize -to_mapped -eff $MAP_EFF -no_incr
if {$SYNTHESIS_FLOW == "RCP"} {
syn_map -phys
} else {
### LOGICAL
syn_map
}


## To identify shift register & prevent them to covert into SCANABLE flops, use below settings
#check_dft_rules
#synthesize -to_mapped -eff $MAP_EFF -no_incr -auto_identify_shift_register -shift_register_max_length 5 ;## DFT team asked for max length 5 as shift reg

GEN_REPORTS $DESIGN MAPPED

timestat MAPPED

#============================
# DFT RULE CHECK
#============================

check_dft_rules -max_print_violations -1 > ${REPORTS_PATH}/${DESIGN}_MAPPED_DFT_RULE_CHECK.rpt

identify_shift_register_scan_segments		;# To Report Functional Shift Registers

report dft_registers -shift_reg > ${REPORTS_PATH}/${DESIGN}_shift_reg.rpt

echo "OS_INFO: Sourcing Pre-Incremental PLUG script ..."
#### Sourcing Pre-Incremental PLUG script ###
source ${RC_COMMON_PLUGS}/PRE_INC.tcl

#==============================
# Synthesis - Incremental
#==============================

#RAMBABU echo "OS_INFO: Starting Synthesis - Incremental Step"
#RAMBABU 
#RAMBABU synthesize -to_mapped -eff $INC_EFF -incr
if {$SYNTHESIS_FLOW != "RCP"} {
syn_opt
}
#RAMBABU 
timestat INCREMENTAL

#============================
# Uniquifying the design
#============================

echo "OS_INFO: Uniquifying the design ..."

edit_netlist uniquify "/designs/$DESIGN" 

timestat UNIQUIFIED

#==============================================
# To Change Names of Sub-designs
#==============================================

echo "OS_INFO: Changing the subdesign name"
# To Change the SubDesign name, use below
change_names -subdesign -prefix "${DESIGN}_" -log_changes ${REPORTS_PATH}/Changed_Names_SubDesign.rpt

timestat CHANGED_NAMES_INSTANCES

##################################################################
# Assigning Clock cells to clock tree
##################################################################

if {[llength $CLOCK_CELL_PATTERN] != 0} then {
	set_attribute find_takes_multiple_names true /
        set_attribute avoid false [find /libraries/ -libcell $CLOCK_CELL_PATTERN]
        set_attribute clock_library_cells [ find / -libcell $CLOCK_CELL_PATTERN ] [ find / -clock * ]
        remap_to_dedicated_clock_library
        set_attribute avoid true [find /libraries/ -libcell $CLOCK_CELL_PATTERN]
        set_attribute find_takes_multiple_names false /

	echo "#### Attribute for DFT team, DFT team should use it just before dumping final DFT netlist  ####" > ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
	echo "set CLOCK_CELL_PATTERN \"$CLOCK_CELL_PATTERN\"" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
	echo "set_attribute find_takes_multiple_names true /" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
	echo "set_attribute clock_library_cells \[ find / -libcell \$CLOCK_CELL_PATTERN \] \[ find / -clock * \]" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
	echo "remap_to_dedicated_clock_library" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
        echo "set_attribute find_takes_multiple_names false /" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
        if {[info exists CLOCK_GATING_CELL] & ($CLOCK_GATING_CELL != "")} {
        echo "" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
        echo "#### Source the below command in the starting of the run ; Clock_gating cell to be used for Insertion" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
        echo "" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
         echo "set_attribute avoid false \[find /libraries/ -libcell \*${CLOCK_GATING_CELL}*\]" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
         echo "set_attr lp_clock_gating_cell \[find /libraries/ -libcell \*${CLOCK_GATING_CELL}*\] /designs/${DESIGN}" >> ${OUTPUTS_PATH}/${DESIGN}_pass_to_DFT.tcl
}

}

echo "OS_INFO: Sourcing Pre-RCP PLUG script ..."
#### Sourcing Pre-RCP PLUG script ###
source ${RC_COMMON_PLUGS}/PRE_RCP.tcl


#===================================
# Generating Incremental Reports
#===================================

GEN_REPORTS $DESIGN INCREMENTAL

timestat DONE_GENERATING_INCR_REPORTS


#===================================
# Physical Synthesis
#===================================

if {$SYNTHESIS_FLOW == "RCP"} {


#####

redirect EDI_TEMP.tcl "echo set DESIGN $DESIGN"

echo "OS_INFO: Starting Physical Synthesis..."

# RAMBABU synthesize -to_placed -effort $PHY_EFFORT
syn_opt -physical                                                                   


timestat PHYSICAL_SYNTHESIS

GEN_REPORTS $DESIGN PHYSICAL

}

echo "OS_INFO: Sourcing Post-Synthesis PLUG script ..."
#### Sourcing Post-Synthesis PLUG script ###
source ${RC_COMMON_PLUGS}/POST_SYN.tcl

timestat EXIT

exit

#===============================


