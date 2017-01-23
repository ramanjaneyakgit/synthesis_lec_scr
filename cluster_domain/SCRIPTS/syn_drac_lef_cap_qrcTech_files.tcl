####################################################################
# List of Lef Files and Cap Tables
####################################################################

# LEF FILES
set std_lef_files "/india/proj_drac/drac/pre_analyze/pnr/base_flow/mod_lefs/tcbn55lp_9lmT2.lef \
/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/lvt/be_library/arm/tsmc/cln55lp/sc9_base_lvt/r0p0/lef/sc9_cln55lp_base_lvt.lef \
/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/rvt/be_library/arm/tsmc/cln55lp/sc9_base_rvt/r0p0/lef/sc9_cln55lp_base_rvt.lef \
/india/proj_drac/drac/ip/std_cells/arm/9_track/base_library/hvt/be_library/arm/tsmc/cln55lp/sc9_base_hvt/r0p0/lef/sc9_cln55lp_base_hvt.lef"

set pmk_lef_files "/india/proj_drac/drac/pre_analyze/pnr/base_flow/mod_lefs/SESAME-CLICK_TSMC_55nm_LP_HVT.lef \
/india/proj_drac/drac/pre_analyze/pnr/base_flow/mod_lefs/SESAME-CLICK_TSMC_55nm_LP_SVT.lef \
/india/proj_drac/drac/pre_analyze/pnr/base_flow/mod_lefs/SESAME-ICK-9T-eLV_TSMC_55nm_LP_SVT.lef\
/india/proj_drac/drac/ip/std_cells/arm/9_track/pmk/rvt-hvt/be_library/arm/tsmc/cln55lp/sc9_pmk_rvt_hvt/r0p0/lef/sc9_cln55lp_pmk_rvt_hvt.lef"

set mem_lef "/india/proj_drac/drac/ip/memories/dolphin/30sep16/DOLPHIN_SRAM/TCDM_1024_32_BE_M8_S2/TCDM_1024_32_BE.lef \
/india/proj_drac/drac/ip/memories/dolphin/30sep16/DOLPHIN_SRAM/TCDM_2048_32_BE_M8_S2/TCDM_2048_32_BE.lef \
/india/proj_drac/drac/ip/dual_rail_Dolphin_memory/20oct16/home/techlibs/tsmc/cln55lp/IPS/DOLPHIN_SRAM/L2_4096_64_BE_RR/L2_4096_64_BE_RR.lef \
/india/proj_drac/drac/ip/memories/tsmc/11aug16/ts3n55lplla1024x64m8_200a/LEF/ts3n55lplla1024x64m8_200a_5m.lef"

set io_lef "/india/proj_drac/drac/ip/gpio/tphn55lpnv2od3_sl_200a/TSMCHOME/digital/Back_End/lef/tphn55lpnv2od3_sl_200a/mt_2/9lm/lef/tphn55lpnv2od3_sl_9lm.lef \
/india/proj_drac/drac/ip/lvds_io/22nov16/rgo_tsmc55_25v25_lp_uc_lvds_rev_1_0/lef/rgo_tsmc55_25v25_lp_uc_lvds_9M_6X2Z.lef"


set ip_lef "/india/proj_drac/drac/din/fromCustomer/GAP_GIT_V2_17OCT16/GAP/fe/ips/fll/LEF/tsmc55lp_FLL.lef \
/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/OSCILLATORS/qOSC-XTAL/footprint/qOSC_XTAL_LP_32k_co_01.lef \
/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/REGULATORS/RAR-eSR-qLR-ref-1.62-3.63-0.55-2.5.02/footprint/RAR_eSR_qLR_ref_162_363_055_25_Iq150_I100HDO_02.lef \
/india/proj_drac/drac/din/fromCustomer/pre_analyze/Dolphin_Delivery_20161214/REGULATORS/POR-BOR-AON.01/footprint/POR_BOR_AON_01.lef"

set lef_files "$std_lef_files $mem_lef $io_lef $ip_lef $pmk_lef_files"
# CAP TABLE
set captables ""

# QRC TECH FILE
set qrc_tech_file "/india/proj_drac/drac/tech/QRC/cln55lp_1p9m_6x2z_alrdl_5corners_1.0a/6x2z_cworst/qrcTechFile"
