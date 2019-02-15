vlib work

vcom -93 ../src/PC_EXTENDER.vhd
vcom -93 ../src/majCPT.vhd
vcom -93 ../src/PC.vhd
vcom -93 ../src/Instruction_memory.vhd

vcom -93 ../src/register_bank.vhd
vcom -93 ../src/MUX21.vhd
vcom -93 ../src/imm_extender.vhd
vcom -93 ../src/ALU.vhd
vcom -93 ../src/data_memory.vhd

vcom -93 ../src/psr.vhd
vcom -93 ../src/decodeur_instruction.vhd

vcom -93 ../src/unite_de_gestion.vhd
vcom -93 ../src/assemblage_UT.vhd
vcom -93 ../src/unite_de_controle.vhd

vcom -93 ../src/processeur_monocycle.vhd
vcom -93 processeur_monocycle_tb.vhd

vsim -novopt processeur_monocycle_tb(TB)

view signals
add wave *

run 1200 ns