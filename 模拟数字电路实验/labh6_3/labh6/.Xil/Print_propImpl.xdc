set_property SRC_FILE_INFO {cfile:d:/moshushiyan/labh6_3/labh6/labh6.srcs/sources_1/ip/clk50/clk50.xdc rfile:../labh6.srcs/sources_1/ip/clk50/clk50.xdc id:1 order:EARLY scoped_inst:c1/inst} [current_design]
current_instance c1/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
