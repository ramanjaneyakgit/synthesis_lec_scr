################################################################################################################
### Common Library information which needs to be used across all blocks and TOP
# Also common for STA, PD and DFT
# 
################################################################################################################

## Library information

proc library_setup { TIMING_CORNER } {
        global all_libs
        set all_libs [ list ]
        if { ${TIMING_CORNER} == "WC" } then {
                global WC_LIB_FILE_LIST
                set WC_LIB_FILE_LIST [ list ]
        } elseif { ${TIMING_CORNER} == "WCL" } then {
                global WCL_LIB_FILE_LIST
                set WCL_LIB_FILE_LIST [ list ]
        } elseif { ${TIMING_CORNER} == "BC" } then {
                global BC_LIB_FILE_LIST
                set BC_LIB_FILE_LIST [ list ]
        } elseif { ${TIMING_CORNER} == "ML" } then {
                global ML_LIB_FILE_LIST
                set ML_LIB_FILE_LIST [ list ]
        } elseif { ${TIMING_CORNER} == "TYP" } then {
                global TYP_LIB_FILE_LIST
                set TYP_LIB_FILE_LIST [ list ]
        }

## STD cells Library addition section

        if { ${TIMING_CORNER} == "WC" } then {
                puts "ARGUMENT GIVEN TO THE LIBRARY_SETUP PROC IS WC"
                puts "WC TIMING CORNER MEANS SS_0p90v_125"
	
	lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/lvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_lvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_lvt_ss_typical_max_0p90v_125c.lib_ccs_tn"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_hvt_ss_typical_max_0p90v_125c.lib_ccs_tn"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/rvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_rvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_rvt_ss_typical_max_0p90v_125c.lib_ccs_tn"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/memories/tsmc/11aug16/ts3n55lplla1024x64m8_200a/NLDM/ts3n55lplla1024x64m8_200a_ss1p08v125c.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_1kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_1024_32_BE_WC_SS_0V9_125c.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_2kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_2048_32_BE_WC_SS_0V9_125c.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_4kx64m8s2/FrontEnd/LIBERTY_v1/L2_4096_64_BE_RR_WC_SS_0V9_125c.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/gpio/tphn55lpnv2od3_sl_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tphn55lpnv2od3_sl_200a/tphn55lpnv2od3_slwc3.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/lvds_io/22nov16/rgo_tsmc55_25v25_lp_uc_lvds_rev_1_0/synopsys/1_00_2_50/rgo_tsmc55_25v25_lp_uc_lvds_ss_090_225_125.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/GAP_GIT_V2_17OCT16/GAP/fe/ips/fll/LIB/tsmc55lp_FLL_ss_typical_max_0p90v_125c.lib"
#        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161115/REGULATORS/RAR-eSR-qLR-ref-1.62-3.63-0.55-2.5.02/timing_socket/RAR_eSR_qLR_ref_162_363_055_25_Iq150_I100HDO_02_SS_2V25_125C_0V90.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/OSCILLATORS/qOSC-XTAL/timing_socket/qOSC_XTAL_LP_32k_co_01_SS_0V9_125C.lib"
        lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_HVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_HVT_SS_0V9_125C_nlm.lib"
       lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_SVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_SVT_SS_0V9_125C_nlm.lib"
       lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_SS_2V97_0V9_125C_nlm.lib"
       lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_SS_0V9_2V97_125C_nlm.lib"
	lappend WC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/pmk/rvt-hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_pmk_rvt_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_pmk_rvt_hvt_ss_typical_max_0p90v_125c.lib_ccs_tn"

                set all_libs $WC_LIB_FILE_LIST
        }

        if { ${TIMING_CORNER} == "WCL" } then {
                puts "ARGUMENT GIVEN TO THE LIBRARY_SETUP PROC IS WCL"
                puts "WCL TIMING CORNER MEANS SS_0p90v_m40"
 
	lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/lvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_lvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_lvt_ss_typical_max_0p90v_m40c.lib_ccs_tn"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_hvt_ss_typical_max_0p90v_m40c.lib_ccs_tn"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/rvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_rvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_rvt_ss_typical_max_0p90v_m40c.lib_ccs_tn"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/memories/tsmc/11aug16/ts3n55lplla1024x64m8_200a/NLDM/ts3n55lplla1024x64m8_200a_ss1p08vm40c.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_1kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_1024_32_BE_WCL_SS_0V9_m40c.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_2kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_2048_32_BE_WCL_SS_0V9_m40c.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_4kx64m8s2/FrontEnd/LIBERTY_v1/L2_4096_64_BE_RR_WCL_SS_0V9_m40c.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/gpio/tphn55lpnv2od3_sl_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tphn55lpnv2od3_sl_200a/tphn55lpnv2od3_slwcl3.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/lvds_io/22nov16/rgo_tsmc55_25v25_lp_uc_lvds_rev_1_0/synopsys/1_00_2_50/rgo_tsmc55_25v25_lp_uc_lvds_ss_090_225_m40.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/GAP_GIT_V2_17OCT16/GAP/fe/ips/fll/LIB/tsmc55lp_FLL_ss_typical_max_0p90v_m40c.lib"
#        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161115/REGULATORS/RAR-eSR-qLR-ref-1.62-3.63-0.55-2.5.02/timing_socket/RAR_eSR_qLR_ref_162_363_055_25_Iq150_I100HDO_02_SS_2V25_m40C_0V90.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/OSCILLATORS/qOSC-XTAL/timing_socket/qOSC_XTAL_LP_32k_co_01_SS_0V9_m40C.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_HVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_HVT_SS_0V9_m40C_nlm.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_SVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_SVT_SS_0V9_m40C_nlm.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_SS_2V97_0V9_m40C_nlm.lib"
        lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_SS_0V9_2V97_m40C_nlm.lib"
	lappend WCL_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/pmk/rvt-hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_pmk_rvt_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_pmk_rvt_hvt_ss_typical_max_0p90v_m40c.lib_ccs_tn"

                set all_libs $WCL_LIB_FILE_LIST
        }

        if { ${TIMING_CORNER} == "BC" } then {
                puts "ARGUMENT GIVEN TO THE LIBRARY_SETUP PROC IS BC"
                puts "BC TIMING CORNER MEANS FF_1p10v_m40"

        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/lvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_lvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_lvt_ff_typical_min_1p10v_m40c.lib_ccs_tn"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_hvt_ff_typical_min_1p10v_m40c.lib_ccs_tn"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/rvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_rvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_rvt_ff_typical_min_1p10v_m40c.lib_ccs_tn"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/memories/tsmc/11aug16/ts3n55lplla1024x64m8_200a/NLDM/ts3n55lplla1024x64m8_200a_ff1p32vm40c.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_1kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_1024_32_BE_LT_FF_1V1_m40c.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_2kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_2048_32_BE_LT_FF_1V1_m40c.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_4kx64m8s2/FrontEnd/LIBERTY_v1/L2_4096_64_BE_ERS_LT_FF_1V1_m40c.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/gpio/tphn55lpnv2od3_sl_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tphn55lpnv2od3_sl_200a/tphn55lpnv2od3_slbc3.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/lvds_io/22nov16/rgo_tsmc55_25v25_lp_uc_lvds_rev_1_0/synopsys/1_00_2_50/rgo_tsmc55_25v25_lp_uc_lvds_ff_110_275_m40.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/GAP_GIT_V2_17OCT16/GAP/fe/ips/fll/LIB/tsmc55lp_FLL_ff_typical_min_1p10v_m40c.lib"
	lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_4kx64m8s2/FrontEnd/LIBERTY_v1/L2_4096_64_BE_RR_LT_FF_1V1_m40c.lib"
#        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161115/REGULATORS/RAR-eSR-qLR-ref-1.62-3.63-0.55-2.5.02/timing_socket/RAR_eSR_qLR_ref_162_363_055_25_Iq150_I100HDO_02_FF_3V63_m40C_1V1.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/OSCILLATORS/qOSC-XTAL/timing_socket/qOSC_XTAL_LP_32k_co_01_FF_1V1_m40C.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_HVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_HVT_FF_1V1_m40C_nlm.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_SVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_SVT_FF_1V1_m40C_nlm.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_FF_3V63_1V10_m40C_nlm.lib"
        lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_FF_1V10_3V63_m40C_nlm.lib"
	lappend BC_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/pmk/rvt-hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_pmk_rvt_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_pmk_rvt_hvt_ff_typical_min_1p10v_m40c.lib_ccs_tn"
                set all_libs $BC_LIB_FILE_LIST
        }


        if { ${TIMING_CORNER} == "ML" } then {
                puts "ARGUMENT GIVEN TO THE LIBRARY_SETUP PROC IS ML"
                puts "ML TIMING CORNER MEANS FF_1p10v_125"

        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/lvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_lvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_lvt_ff_typical_min_1p10v_125c.lib_ccs_tn"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_hvt_ff_typical_min_1p10v_125c.lib_ccs_tn"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/rvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_rvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_rvt_ff_typical_min_1p10v_125c.lib_ccs_tn"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/memories/tsmc/11aug16/ts3n55lplla1024x64m8_200a/NLDM/ts3n55lplla1024x64m8_200a_ff1p32v125c.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_1kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_1024_32_BE_ML_FF_1V1_125c.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_2kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_2048_32_BE_ML_FF_1V1_125c.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_4kx64m8s2/FrontEnd/LIBERTY_v1/L2_4096_64_BE_RR_ML_FF_1V1_125c.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/gpio/tphn55lpnv2od3_sl_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tphn55lpnv2od3_sl_200a/tphn55lpnv2od3_slml3.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/lvds_io/22nov16/rgo_tsmc55_25v25_lp_uc_lvds_rev_1_0/synopsys/1_00_2_50/rgo_tsmc55_25v25_lp_uc_lvds_ff_110_275_125.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/GAP_GIT_V2_17OCT16/GAP/fe/ips/fll/LIB/tsmc55lp_FLL_ff_typical_min_1p10v_125c.lib"
 #       lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161115/REGULATORS/RAR-eSR-qLR-ref-1.62-3.63-0.55-2.5.02/timing_socket/RAR_eSR_qLR_ref_162_363_055_25_Iq150_I100HDO_02_FF_3V63_125C_1V1.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/OSCILLATORS/qOSC-XTAL/timing_socket/qOSC_XTAL_LP_32k_co_01_FF_1V1_125C.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_HVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_HVT_FF_1V1_125C_nlm.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_SVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_SVT_FF_1V1_125C_nlm.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_FF_1V10_3V63_125C_nlm.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_FF_3V63_1V10_125C_nlm.lib"
        lappend ML_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/pmk/rvt-hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_pmk_rvt_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_pmk_rvt_hvt_ff_typical_min_1p10v_m40c.lib_ccs_tn"


                set all_libs $ML_LIB_FILE_LIST
        }
        if { ${TIMING_CORNER} == "TYP" } then {
                puts "ARGUMENT GIVEN TO THE LIBRARY_SETUP PROC IS TYP"
                puts "TYP TIMING CORNER MEANS TT_1p00v_25"

        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/lvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_lvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_lvt_tt_typical_max_1p00v_25c.lib_ccs_tn"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_hvt_tt_typical_max_1p00v_25c.lib_ccs_tn"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/rvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_base_rvt/r0p0/lib-ccs-tn/sc9_cln55lp_base_rvt_tt_typical_max_1p00v_25c.lib_ccs_tn"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/memories/tsmc/11aug16/ts3n55lplla1024x64m8_200a/NLDM/ts3n55lplla1024x64m8_200a_tt1p2v25c.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_1kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_1024_32_BE_TC_TT_1V0_25c.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_2kx32m8s2/FrontEnd/LIBERTY_v1/TCDM_2048_32_BE_TC_TT_1V0_25c.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/RHEA-ERS/20161118_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/Generator_v1/OUT/20161228_SpRAM-RHEA-HD-RR-NV_TSMC_55nm_LP_R2-1-2-B/SpRAM_4kx64m8s2/FrontEnd/LIBERTY_v1/L2_4096_64_BE_RR_TC_TT_1V0_25c.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/gpio/tphn55lpnv2od3_sl_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tphn55lpnv2od3_sl_200a/tphn55lpnv2od3_sltc3.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/lvds_io/22nov16/rgo_tsmc55_25v25_lp_uc_lvds_rev_1_0/synopsys/1_00_2_50/rgo_tsmc55_25v25_lp_uc_lvds_tt_100_250_025.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/GAP_GIT_V2_17OCT16/GAP/fe/ips/fll/LIB/tsmc55lp_FLL_tt_typical_max_1p00v_25c.lib"
#        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161115/REGULATORS/RAR-eSR-qLR-ref-1.62-3.63-0.55-2.5.02/timing_socket/RAR_eSR_qLR_ref_162_363_055_25_Iq150_I100HDO_02_TT_3V3_25C_1V0.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/OSCILLATORS/qOSC-XTAL/timing_socket/qOSC_XTAL_LP_32k_co_01_TT_1V0_25C.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_HVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_HVT_TT_1V0_25C_nlm.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-CLICK_TSMC_55nm_LP_SVT_v4.0.0_FINAL_DELIVERY-2/SESAME-CLICK_FrontEnd/SESAME-CLICK_LIB/NLM/SESAME-CLICK_TSMC_55nm_LP_SVT_TT_1V0_25C_nlm.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_TT_1V0_3V3_25C_nlm.lib"
        lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161129/CLICK/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_v1.0.0_FINAL_DELIVERY-2/SESAME-ICK-9T-eLV_FrontEnd/SESAME-ICK-9T-eLV_LIB/NLM/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT_TT_3V3_1V0_25C_nlm.lib"
	lappend TYP_LIB_FILE_LIST "/india/proj_drac/drac/ip/std_cells/arm/9_track/pmk/rvt-hvt/ccs_library_1.0V/arm/tsmc/cln55lp/sc9_pmk_rvt_hvt/r0p0/lib-ccs-tn/sc9_cln55lp_pmk_rvt_hvt_tt_typical_max_1p00v_25c.lib_ccs_tn"
                set all_libs $TYP_LIB_FILE_LIST
        }
}

















