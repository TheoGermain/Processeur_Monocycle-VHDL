vlib work

vcom -93 ../src/ALU.vhd
vcom -93 ALU_tb.vhd

vsim -novopt ALU_tb(TB)

view signals
add wave *

run -all