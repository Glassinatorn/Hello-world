color_background = "#2E3440"
color_text = "#E5E9F0"
color_accent = "#88C0D0"
color_lines = "#D8DEE9"
set border linewidth 1.5 lc rgb color_text
set xtics textcolor rgb color_text
set ytics textcolor rgb color_text
set xlabel textcolor rgb color_text
set ylabel textcolor rgb color_text
set title textcolor rgb color_text
set style line 1 lc rgb color_accent lt 1 lw 2 pt 7 ps 1.5
set style line 2 lc rgb color_lines lt 1 lw 2 pt 5 ps 1.5
set title "Swedish CPI"
set xlabel "Years"
set ylabel "CPI"
set style fill solid
set terminal png size 800, 410
set terminal png
set output "data/pictures/swedish_cpi.png"

# Set output filename
set output "nord_theme_graph.png"

# Nord theme colors
color_background = "#2E3440"
color_text = "#E5E9F0"
color_accent = "#88C0D0"
color_lines = "#D8DEE9"

# Set the colors of the plot elements
set border linewidth 1.5 lc rgb color_text
set xtics textcolor rgb color_text
set ytics textcolor rgb color_text
set xlabel textcolor rgb color_text
set ylabel textcolor rgb color_text
set title textcolor rgb color_text

set style line 1 lc rgb color_accent lt 1 lw 2 pt 7 ps 1.5
set style line 2 lc rgb color_lines lt 1 lw 2 pt 5 ps 1.5
set object 1 rectangle from screen 0,0 to screen 1,1 behind fillcolor rgb color_background fillstyle solid noborder
