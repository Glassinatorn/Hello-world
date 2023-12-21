width=$1
height=$2
output_file=$3

gnuplot -persist << EOF
    color_background = "#434C5E"
    color_text = "#D8DEE9"
    color_accent = "#8FBCBB"
    color_lines = "#88C0D0"

    line1 = "#BF616A"
    line2 = "#D08770"
    line3 = "#EBCB8B"
    line4 = "#A3BE8C"
    line5 = "#B48EAD"
    line6 = "#8FBCBB"

    set border linewidth 1.5 lc rgb color_text
    set tics tc rgb color_text
    set label tc rgb color_text
    set title tc rgb color_text

    set object 1 rectangle from screen 0,0 to screen 2,2 behind fillcolor rgb color_background fillstyle solid noborder

    set key textcolor rgb textcolor
    set style fill solid
    set terminal png size $width, $height
    set terminal png 
    set output "$output_file"

    plot 'SE.txt' using 1:2 with lines lw 3 lc rgb line1 title 'Sweden', \
        'US.txt' using 1:2 with lines lw 3 lc rgb line2 title 'USA', \
        'CN.txt' using 1:2 with lines lw 3 lc rgb line4 title 'China', \
        'DE.txt' using 1:2 with lines lw 3 lc rgb line5 title 'Germany'

        #rm SE.txt US.txt CN.txt DE.txt
EOF
