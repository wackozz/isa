set entity iir_filter

set IN_DIR "../netlist"
set TopLevelDesign ${entity}
set LIB_DIR /software/dk/nandgate45/liberty
set MyTimingLib ${LIB_DIR}/NangateOpenCellLibrary_typical_ecsm_nowlm.lib
set LEF_DIR /software/dk/nandgate45/lef
set LEF_list [list ${LEF_DIR}/NangateOpenCellLibrary.lef]
