# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/moshushiyan/labh6_3/lab7_1/lab7.cache/wt [current_project]
set_property parent.project_path D:/moshushiyan/labh6_3/lab7_1/lab7.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/moshushiyan/labh6_3/lab7_1/lab7.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/coe1.coe
add_files D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/coe2.coe
add_files D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/coe3.coe
add_files D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/coe4.coe
add_files D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/coe5.coe
read_verilog -library xil_defaultlib {
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/Bpmusic.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/Bpmusic2.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/Bpmusic3.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/Bpmusic4.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/DIS.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/VDS.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/VDT.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/allrom.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/counter.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/counter2.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/decoder7.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/decodercnt.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/flag_change.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/fpq.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/mux.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/mux_music.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/p_move.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/rand.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/w_move.v
  D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/new/all.v
}
read_ip -quiet D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

read_ip -quiet D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom2/rom2.xci
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom2/rom2_ooc.xdc]

read_ip -quiet D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom3/rom3.xci
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom3/rom3_ooc.xdc]

read_ip -quiet D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom4/rom4.xci
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom4/rom4_ooc.xdc]

read_ip -quiet D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom5/rom5.xci
set_property used_in_implementation false [get_files -all d:/moshushiyan/labh6_3/lab7_1/lab7.srcs/sources_1/ip/rom5/rom5_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/constrs_1/new/allS.xdc
set_property used_in_implementation false [get_files D:/moshushiyan/labh6_3/lab7_1/lab7.srcs/constrs_1/new/allS.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top project_all -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef project_all.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file project_all_utilization_synth.rpt -pb project_all_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
