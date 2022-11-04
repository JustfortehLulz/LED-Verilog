onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /binaryDisplay_tb/clk
add wave -noupdate /binaryDisplay_tb/reset
add wave -noupdate /binaryDisplay_tb/SW
add wave -noupdate /binaryDisplay_tb/segmentDisplay
add wave -noupdate /binaryDisplay_tb/an
add wave -noupdate /binaryDisplay_tb/dp
add wave -noupdate -expand -group Variables /binaryDisplay_tb/UUT/totalVal
add wave -noupdate -expand -group Variables /binaryDisplay_tb/UUT/CurrentState
add wave -noupdate -expand -group Variables /binaryDisplay_tb/UUT/NextState
add wave -noupdate -expand -group Prescaler /binaryDisplay_tb/UUT/PRESCALER/clk
add wave -noupdate -expand -group Prescaler /binaryDisplay_tb/UUT/PRESCALER/rst
add wave -noupdate -expand -group Prescaler /binaryDisplay_tb/UUT/PRESCALER/clk_out
add wave -noupdate -expand -group Prescaler /binaryDisplay_tb/UUT/PRESCALER/clk_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28369 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits sec
update
WaveRestoreZoom {0 ps} {78928 ps}
