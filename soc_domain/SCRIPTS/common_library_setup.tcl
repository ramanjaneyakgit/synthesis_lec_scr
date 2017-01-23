################################################
## Description :   
##   Below file is common library setup template. User can edit accordingly. 
##
##  Input: Input to proc is device corner. Device_corner list :  SS,TIV,FF,ML,TT
##	 SS means ss125c, TIV means ssm40c, FF means ffm40c, ML means ff125c, TT means typical25c
##
## Output: Output of this proc is "all_libs" variable which contains list of libraries 
## 
######################
proc library_setup { corner } {
 global libpath
 global search_path
 global all_libs
 global TIMING_MODE
 global DESIGN
 global TOP_MODULE
 set all_libs ""

if {[info exist TOP_MODULE]} {
	set DESIGN $TOP_MODULE
} 

switch -exact $corner {

	"SS" {
	      set std_cell_pattern "_ss_typical_max_0p99v_125c"
	      set ddr3_io_pattern "wc_0p99_1p283_125C"
	      set ddr3_itm_dll_pattern "wc_0p99_125C"
	      set mem1_pattern "ss_0p99v_0p99v_125c"
	      set mem2_pattern "ss_0p99v_0p99v_125c"

	}

	"TIV" {
	      set std_cell_pattern "_ss_typical_max_0p99v_m40c"
	      set ddr3_io_pattern "wc_0p99_1p283_m40C"
	      set ddr3_itm_dll_pattern "wc_0p99_m40C"
	      set mem1_pattern "ss_0p99v_0p99v_m40c"
	      set mem2_pattern "ss_0p99v_0p99v_m40c"
	      
	}
	
	"FF" {
	     set std_cell_pattern "_ff_typical_min_1p21v_m40c"
	     set ddr3_io_pattern "bc_1p21_1p45_m40C"
	     set ddr3_itm_dll_pattern "bc_1p21_m40C"
	     set mem1_pattern "ff_1p21v_1p21v_m40c"
	     set mem2_pattern "ff_1p21v_1p21v_m40c"

	}
	
	"ML" {
	     set std_cell_pattern "_ff_typical_min_1p21v_125c"
	     set ddr3_io_pattern "bc_1p21_1p45_125C"
	     set ddr3_itm_dll_pattern "bc_1p21_125C"
	     set mem1_pattern "ff_1p21v_1p21v_125c"
	     set mem2_pattern "ff_1p21v_1p21v_125c"

	}
	
	"TT" {
	     set std_cell_pattern "_tt_typical_max_1p10v_25c"
	     set ddr3_io_pattern "tc_1p1_1p35_25C"
	     set ddr3_itm_dll_pattern "tc_1p1_25C"
	     set mem1_pattern "tt_1p1v_1p1v_25c"
	     set mem2_pattern "tt_1p10v_1p10v_25c"

	}
}

#Read in the libraries
set STD_CELL_9T_RVT [list /india/proj_amstel/amstel/IP/IP_FILES/std_cells/arm/9_track/C40/rvt/base_library/ccs_library_1.1V/TS28LB500-FX-00006-r1p0-00eac0/arm/tsmc/cln40lp/sc9mc_base_rvt_c40/r1p0/lib-ccs-tn/sc9mc_cln40lp_base_rvt_c40${std_cell_pattern}.lib_ccs_tn]
set STD_CELL_9T_LVT [list /india/proj_amstel/amstel/IP/IP_FILES/std_cells/arm/9_track/C40/lvt/base_library/ccs_library_1.1V/arm/tsmc/cln40lp/sc9mc_base_lvt_c40/r1p0/lib-ccs-tn/sc9mc_cln40lp_base_lvt_c40${std_cell_pattern}.lib_ccs_tn]


set libs_ddr_hm [list  \
/india/proj_amstel/amstel/IP/IP_FILES/DDR/dwc_ddr2_3l_mddr_phy_tsmc40lp25_2.10a/synopsys/ddr2_sdram/sstl/current/synopsys/ddr3l_1p35v/msd_d3r_io_ddr3l_40_60_${ddr3_io_pattern}.lib \
/india/proj_amstel/amstel/IP/IP_FILES/DDR/dwc_ddr2_3l_mddr_phy_tsmc40lp25_2.10a/synopsys/ddr2_sdram/itm/current/synopsys/msd_itm_${ddr3_itm_dll_pattern}.lib \
/india/proj_amstel/amstel/IP/IP_FILES/DDR/dwc_ddr2_3l_mddr_phy_tsmc40lp25_2.10a/synopsys/ddr2_sdram/dll/current/synopsys/400_MHz/msd_dll_400_${ddr3_itm_dll_pattern}.lib ]

set libs_top_mem [list /india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/crypto_ram_64x32_sram_dp_hde/crypto_ram_64x32_sram_dp_hde_nldm_${mem1_pattern}_syn.lib \
/india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/m2_sram_8192x64_redundant_sram_sp_hde/m2_sram_8192x64_redundant_sram_sp_hde_nldm_${mem1_pattern}_syn.lib \
/india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/pcm_sram_256x32_sram_sp_hse/pcm_sram_256x32_sram_sp_hse_${mem2_pattern}.lib \
/india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/eu_dtbuf_1024x32_rf_2p_hde/eu_dtbuf_1024x32_rf_2p_hde_nldm_${mem1_pattern}_syn.lib]

set libs_R4_mem "/india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/sram_sp_hs128x12/sram_sp_hs128x12_${mem2_pattern}.lib \
/india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/sram_sp_hs128x22/sram_sp_hs128x22_${mem2_pattern}.lib \
/india/proj_amstel/amstel/IP/IP_FILES/memories/arm_memories_02092014/sram_sp_hs512x36/sram_sp_hs512x36_${mem2_pattern}.lib"

if { ${DESIGN} == "precomp_filter"} {
	set all_libs [concat $STD_CELL_9T_RVT $libs_R4_mem]
 } elseif {  ${DESIGN} == "ddr_top"}  {
	set all_libs [concat $STD_CELL_9T_RVT $STD_CELL_9T_LVT $libs_top_mem $libs_ddr_hm]
 } else {
    set all_libs [concat $STD_CELL_9T_RVT $STD_CELL_9T_LVT ]
}



}
################################################################
