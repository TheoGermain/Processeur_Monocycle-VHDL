vlib work

vcom -93 ../src/processeur_monocycle.vhd
vcom -93 processeur_monocycle_tb.vhd

vsim -novopt processeur_monocycle_tb(TB)

view signals
add wave *

run 1200 ns