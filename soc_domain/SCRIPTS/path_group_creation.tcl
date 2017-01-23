

################################
# PATH GROUP CREATION FILE
################################

# ------------------------------------------------
# CLOCK PATH GROUPS REMOVAL
# ------------------------------------------------

foreach clk [find / -clock *] {

	set clk_name [basename $clk]
	rm [find / -cost_group $clk_name]

} 


# ------------------------------------------------
# Path groups for Memories

if {![info exist MEM_CELL_NAME_PATTERN] | ([llength $MEM_CELL_NAME_PATTERN] == 0)} {
    echo "OSI_INFO: Not creating any cost/path groups for From_MEM or To_MEM..."
} else {
    set memories " "
    foreach my_mem $MEM_CELL_NAME_PATTERN {
        foreach mem [filter libcell ${my_mem} [find /designs/* -inst *] -regexp] {
            lappend memories $mem
        }
    }
    set num_of_memories [llength $memories]
    if {$num_of_memories != 0 } {
        puts "OS_INFO: created the Memory groupings..."
        define_cost_group -name FROM_MEM -design ${DESIGN}
        define_cost_group -name TO_MEM -design ${DESIGN}
        path_group -from $memories -group FROM_MEM -name FROM_MEM
        path_group -to $memories -group TO_MEM -name TO_MEM
    }
}

# ------------------------------------------------
# Path Group for 12R R2R R2O I2O

if {[llength [all::all_seqs]] > 0} {

	define_cost_group -name IN2REG  -design $DESIGN
	define_cost_group -name REG2REG -design $DESIGN
	define_cost_group -name REG2OUT -design $DESIGN
	define_cost_group -name IN2OUT  -design $DESIGN

	set ALL_SEQUENTIALS [all::all_seqs]

if {[llength $MEM_CELL_NAME_PATTERN] != 0} {
	set ONLY_REGS [remove_from_collection $ALL_SEQUENTIALS $memories]
	path_group -from $ONLY_REGS  	  -to $ONLY_REGS      -group REG2REG -name REG2REG
} else {
	path_group -from $ALL_SEQUENTIALS   -to $ALL_SEQUENTIALS  -group REG2REG -name REG2REG
}

	path_group -from [all::all_seqs]  -to [all::all_outs] -group REG2OUT -name REG2OUT
	path_group -from [all::all_inps]  -to [all::all_seqs] -group IN2REG  -name IN2REG
	path_group -from [all::all_inps]  -to [all::all_outs] -group IN2OUT  -name IN2OUT
}


