# -----------------------------------
# Dont use cell list
# -----------------------------------

#set_attr avoid true [find /libraries/ -libcell <lib cell name>]
set_attr avoid true [find /libraries/ -libcell *_X0*]
set_attr avoid true [find /libraries/ -libcell *POSTICG*]
set_attr avoid true [find /libraries/ -libcell *FRICG*]


## flop whos scanble flop is not available
#set_attr avoid true [find /libraries/ -libcell SEH_FDPHRBSBQ_*]

## complex flops
set_attr avoid true [find /libraries/ -libcell *A2D*]
set_attr avoid true [find /libraries/ -libcell *A2S*]
set_attr avoid true [find /libraries/ -libcell *M2D*]
set_attr avoid true [find /libraries/ -libcell *M2S*]

## flops with enable
set_attr avoid true [find /libraries/ -libcell *EDFF*]
set_attr avoid true [find /libraries/ -libcell *ESDFF*]

## register file
## set_attr avoid true [find /libraries/ -libcell *RF* ]

## flops with SO output
#set_attr avoid true [find /libraries/ -libcell ]

## flops with both set and reset
#set_attr avoid true [find /libraries/ -libcell ]


## flops with only QN
set_attr avoid true [find /libraries/ -libcell *FFQN*]
set_attr avoid true [find /libraries/ -libcell *FFSQN*]
set_attr avoid true [find /libraries/ -libcell *FFRPQN*]

## delay cells
set_attr avoid true [find /libraries/ -libcell *DLY*]

### high drive as per GF recommendation
### /india/proj_shubham/shubham/TECH/GF55LPe/55LPe_DesignGuidelines
set_attr avoid true [find /libraries/ -libcell *_X16*]

## high dynamic power cells  
## set_attr avoid true [find /libraries/ -libcell *DG*]

## more than 4 input lib cells
set_attr avoid true [find /libraries/ -libcell *AOI221_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI221_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI221_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI221_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI221_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI221_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI221_X4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI222_X4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *AOI32_X6M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXIT_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXIT_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXIT_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXIT_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXT_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXT_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXT_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *BMXT_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *CMPR42_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *CMPR42_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *CMPR42_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXIT4_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXIT4_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXIT4_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXIT4_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXIT4_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXIT4_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXT4_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXT4_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXT4_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXT4_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXT4_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *MXT4_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI221_X4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OAI222_X4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X0P5M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X0P7M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X1M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X1P4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X2M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X3M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X4M_A9T*]
set_attr avoid true [find /libraries/ -libcell *OR6_X6M_A9T*]
