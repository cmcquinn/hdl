
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project ad77684_snickerdoodle_black
adi_project_files ad77684_snickerdoodle_black [list \
  "../common/ad77684_if.v" \
  "system_top.v" \
  "system_constr.xdc" \
  "$ad_hdl_dir/projects/common/snickerdoodle_black/snickerdoodle_black_system_constr.xdc" \
  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v" ]

adi_project_run ad77684_snickerdoodle_black

