set outfile ${REPORTS_PATH}/clock_uncertainty_file.tcl
echo "## Ucertainty used in SDC" > $outfile
# The below uncertainty is for Clock_skew and divergence
set_clock_uncertainty 0.570 [all_clocks]
echo "set_clock_uncertainty 0.570 \[all_clocks\]" >> $outfile

