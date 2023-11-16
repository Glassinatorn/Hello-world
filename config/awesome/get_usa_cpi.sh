#!/bin/sh

# Set the indicator code for USA CPI
indicator_code='FP.CPI.TOTL.ZG'

# Set the country code for USA
country_code='US'

# Set the date range for data retrieval 
start_date='1974'
current_year=$(date +%Y)
end_date=$(date -d "$current_year - 1 year" +%Y)

# World Bank API URL
api_url="https://api.worldbank.org/v2/country/${country_code}/indicator/${indicator_code}?date=${start_date}:${end_date}&format=json"

# Fetch the data using curl and process the JSON response
curl_response=$(curl -s "$api_url")

# Extract the CPI values from the JSON response
cpi_values=$(echo "$curl_response" | jq -r '.[1][] | .value' | tac)

# Create a temporary file to store the data
tmp_file=$(mktemp)

# Calculate the number of years to go back
num_years=$((end_date - start_date))  
years=$(seq $((end_date - num_years)) "$end_date")

years=$(echo "$years" | tr ' ' '\n')
cpi_values=$(echo "$cpi_values" | tr ' ' '\n')

# Get the count of elements in the lists
num_elements=$(echo "$years" | wc -l)

# Iterate through the lists using a counter
counter=1
while [ "$counter" -le "$num_elements" ]; do
    year=$(echo "$years" | sed -n "${counter}p")
    value=$(echo "$cpi_values" | sed -n "${counter}p")
    
    echo "$year $value"
    
    counter=$((counter + 1))
done > "$tmp_file"

# Use gnuplot to create the graph
gnuplot -persist << EOF
color_background = "#434C5E"
color_text = "#D8DEE9"
color_accent = "#8FBCBB"
color_lines = "#88C0D0"

set border linewidth 1.5 lc rgb color_text
set xtics textcolor rgb color_text
set ytics textcolor rgb color_text
set xlabel textcolor rgb color_text
set ylabel textcolor rgb color_text
set title textcolor rgb color_text

set object 1 rectangle from screen 0,0 to screen 2,2 behind fillcolor rgb color_background fillstyle solid noborder

set title "USA CPI"
set xlabel "Years"
set ylabel "CPI"

set style fill solid
set terminal png size 800, 410
set terminal png
set output "data/pictures/usa_cpi.png"

plot "$tmp_file" with lines lc rgb color_lines title "CPI Values"
EOF

# Clean up the temporary file
rm "$tmp_file"
