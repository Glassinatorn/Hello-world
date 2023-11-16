# Set terminal to PNG for output
set terminal pngcairo size 800,600 enhanced font "Arial,12"

# Set output filename
set output "nord_theme_plot.png"

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

# Apply the background color
set object 1 rectangle from screen 0,0 to screen 1,1 behind fillcolor rgb color_background fillstyle solid noborder

# Load and plot the data
#plot datafile using 1:2 with linespoints ls 1 title "Series 1", datafile using 1:3 with linespoints ls 2 title "Series 2"
