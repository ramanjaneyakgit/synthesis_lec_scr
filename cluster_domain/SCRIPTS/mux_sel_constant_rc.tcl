## Script to find constant mux select pin after "Generic stage" but before "Mapped stage"
###Author : Richa Goel
## output : ./${TOP_MODULE}_mux_sel_constant.rpt


set TOP_MODULE [file tail [current_design]]

set flag 0
echo "####Mux Select Pin .............Constant Value##" > ${TOP_MODULE}_mux_sel_constant.rpt
set pins [find [find / -instance mux*] -pin sel*]
foreach_in_collection pin $pins {
  set constant [get_attribute constant $pin]
  if {$constant == "0" || $constant == "1"} {
    set flag 1
    echo " [get_object_name $pin] .......$constant" >> ${TOP_MODULE}_mux_sel_constant.rpt
   }
}
if {$flag != "1"} {
  echo " No Constant On MUX Select Pin" >> ${TOP_MODULE}_mux_sel_constant.rpt
}
