
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Mode2_8254 -dir "/home/Projects/Projects/fpga/Verilog/Mode2_8254/planAhead_run_1" -part xc6slx9csg324-2
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/Projects/Projects/fpga/Verilog/Mode2_8254/Mode2Counter.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/Projects/Projects/fpga/Verilog/Mode2_8254} }
set_property target_constrs_file "pinout.ucf" [current_fileset -constrset]
add_files [list {pinout.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/home/Projects/Projects/fpga/Verilog/Mode2_8254/Mode2Counter.ncd"
if {[catch {read_twx -name results_1 -file "/home/Projects/Projects/fpga/Verilog/Mode2_8254/Mode2Counter.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/Projects/Projects/fpga/Verilog/Mode2_8254/Mode2Counter.twx\": $eInfo"
}
