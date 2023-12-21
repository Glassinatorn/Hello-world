list="SE US DE CN"
indicator="FP.CPI.TOTL.ZG"

for country_code in $list; do
    output_file="${country_code}.txt"
    response=$(curl -s "https://api.worldbank.org/v2/country/${country_code}/indicator/$indicator?date=1970:2030&format=json")

    echo "$response" | jq -r '.[1][] | "\(.value)"' > $output_file
done
