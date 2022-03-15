set projDir "C:/Users/polar/Downloads/16bitALU/work/vivado"
set projName "16bitALU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/polar/Downloads/16bitALU/work/verilog/au_top_0.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/value_store_1.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/edge_detector_2.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/button_conditioner_3.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/alu_4.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/auto_tester_5.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/reset_conditioner_6.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/multi_seven_seg_7.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/pipeline_8.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/adder_9.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/boolean_10.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/shifter_11.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/compare_12.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/counter_13.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/seven_seg_14.v" "C:/Users/polar/Downloads/16bitALU/work/verilog/decoder_15.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/polar/Downloads/16bitALU/work/constraint/alchitry.xdc" "C:/Users/polar/Downloads/16bitALU/work/constraint/io.xdc" "D:/Applications/Alchitry/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
