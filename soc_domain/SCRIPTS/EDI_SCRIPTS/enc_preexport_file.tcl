#-----------------------------------------------
# ENC PRE EXPORT FILE
#-----------------------------------------------

#------------------------------------------------
set WORK_AREA [pwd]
source ${WORK_AREA}/EDI_TEMP.tcl
source ${RC_COMMON_INPUTS}/user_attr_file.tcl
set RC_COMMON_INPUTS ${WORK_AREA}/INPUTS
#set EDI_COMMON_SCRIPTS ${WORK_AREA}/EDI_SCRIPTS
set EDI_COMMON_SCRIPTS $EDI_COMMON_SCRIPTS
#------------------------------------------------

echo "OS_INFO: OptDesign setting from user..."

optDesign -preCTS -outDir ./RCP_TIMING_REPORTS 

saveDesign -absoluteLibPath ./EDI_DBS/${DESIGN}_preCTS_RCP.enc

#--------------------------------------

