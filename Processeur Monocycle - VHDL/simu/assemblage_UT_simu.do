vlib work

vcom -93 ../src/assemblage_UT.vhd
vcom -93 assemblage_UT_tb.vhd

vsim -novopt assemblage_UT_tb(TB)

view signals
add wave *

run -all