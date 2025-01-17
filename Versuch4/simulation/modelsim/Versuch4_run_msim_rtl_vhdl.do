transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/i2c_master.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/Versuch4.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/edge_detect.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/timer.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/temp_reader_logic.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/temp_to_bcd.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_logic.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_i2c_writer.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_memory.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_mem_mux.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_init_rom.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_temp_reg.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd_char_reg.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/temp_reader.vhd}
vcom -93 -work work {E:/uni/FaPraFPGA/share/vm/work/Versuch4/lcd.vhd}

