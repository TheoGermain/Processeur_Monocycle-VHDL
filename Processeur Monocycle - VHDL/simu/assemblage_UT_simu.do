vlib work

vcom -93 ../src/register_bank.vhd
vcom -93 ../src/MUX21.vhd
vcom -93 ../src/imm_extender.vhd
vcom -93 ../src/ALU.vhd
vcom -93 ../src/data_memory.vhd

vcom -93 ../src/assemblage_UT.vhd
vcom -93 assemblage_UT_tb.vhd

vsim -novopt assemblage_UT_tb(TB)

view signals
add wave *

run -all