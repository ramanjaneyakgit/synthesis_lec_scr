
##################################
# DIRECTORY STRUCTURE CREATION
##################################

if { [file isdirectory ./${DESIGN} ] } {
        echo "Directory ./${DESIGN} exists"
} else {
        shell mkdir ./${DESIGN}
}

if { [file isdirectory ./${DESIGN}/${SYNTHESIS_FLOW} ] } {
        echo "Directory ./${DESIGN}/${SYNTHESIS_FLOW} exists"
} else {
        shell mkdir ./${DESIGN}/${SYNTHESIS_FLOW}
}


if { [file isdirectory ./${DESIGN}/${SYNTHESIS_FLOW}/OUTPUTS ] } {
        echo "Directory ./${DESIGN}/${SYNTHESIS_FLOW}/OUTPUTS exists"
} else {
        shell mkdir ./${DESIGN}/${SYNTHESIS_FLOW}/OUTPUTS
}
if { [file isdirectory ./${DESIGN}/${SYNTHESIS_FLOW}/REPORTS ] } {
        echo "Directory ./${DESIGN}/${SYNTHESIS_FLOW}/REPORTS exists" 
} else { 
        shell mkdir ./${DESIGN}/${SYNTHESIS_FLOW}/REPORTS
}

##################################

