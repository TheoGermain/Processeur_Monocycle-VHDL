vlib work

vcom -93 ../src/unite_de_gestion.vhd
vcom -93 unite_de_gestion_tb.vhd

vsim -novopt unite_de_gestion_tb(TB)

view signals
add wave *

run -all