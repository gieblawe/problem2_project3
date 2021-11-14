lappend search_path /u/shnebli/Desktop/Karem/problem2/Hot_coding_reversed
	set target_library /u/shnebli/Desktop/Karem/problem2/Hot_coding_reversed/osu05_stdcells.db
	set link_library [concat "*" $target_library]
	link
	read_file -format sverilog /u/shnebli/Desktop/Karem/problem2/Hot_coding_reversed/Reversed_HotCoding.sv
	current_design Reversed_HotCoding
	compile -exact_map
	report_cell
	report_area
	report_power
	write -format Verilog -hierarchy -output Reversed_HotCoding.netlist
	link
	quit
