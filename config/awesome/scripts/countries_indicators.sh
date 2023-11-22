#!/bin/sh
country_codes="SE US EU CN"
width=$1
height=$2
indicator=$3
output_name=$4

for country_code in $country_codes; do
    output_file="${country_code}.txt"

    response=$(curl -s "https://api.worldbank.org/v2/country/${country_code}/indicator/$indicator?date=1970:2030&format=json")

    # Parse the JSON response and write the data to the output file
    echo "$response" | jq -r '.[1][] | "\(.date) \(.value)"' > "$output_file"
done

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
    set xtics textcolor rgb color_text
    set ytics textcolor rgb color_text
    set xlabel textcolor rgb color_text
    set ylabel textcolor rgb color_text
    set title textcolor rgb color_text

    set object 1 rectangle from screen 0,0 to screen 2,2 behind fillcolor rgb color_background fillstyle solid noborder

    set key textcolor rgb textcolor
    set style fill solid
    set terminal png size $width, $height
    set terminal png 
    set output "$output_name"

    plot 'SE.txt' using 1:2 with lines lw 3 lc rgb line1 title 'Sweden', \
        'US.txt' using 1:2 with lines lw 3 lc rgb line2 title 'USA', \
        'EU.txt' using 1:2 with lines lw 3 lc rgb line3 title 'EU', \
        'CN.txt' using 1:2 with lines lw 3 lc rgb line4 title 'China', \
        'DE.txt' using 1:2 with lines lw 3 lc rgb line5 title 'Germany'
EOF

rm SE.txt US.txt EU.txt CN.txt DE.txt
