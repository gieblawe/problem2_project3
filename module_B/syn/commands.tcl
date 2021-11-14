lappend search_path /u/shnebli/Desktop/Karem/problem2/Hot_coding
	set target_library /u/shnebli/Desktop/Karem/problem2/Hot_coding/osu05_stdcells.db
	set link_library [concat "*" $target_library]
	link
	read_file -format sverilog /u/shnebli/Desktop/Karem/problem2/Hot_coding/HotCoding_regular.sv
	current_design HotCoding_regular
	compile -exact_map
	report_cell
	report_area
	report_power
	write -format Verilog -hierarchy -output HotCoding_regular.netlist
	link
	quit
