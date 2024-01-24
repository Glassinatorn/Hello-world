# repositioning
start_dir=$PWD
cd $HOME/.config/awesome/scripts

width=1190
height=500
countries="SE US DE CN"
set -- "young_ratio.png" "working_ratio.png" "old_ratio.png"
economical_indicators="SP.POP.DPND.YG SP.POP.DPND SP.POP.DPND.OL"
   

for indicator in $economical_indicators; do
    for country_code in $countries; do
        curl -s "https://api.worldbank.org/v2/country/$country_code/indicator/$indicator?date=1970:2030&format=json" | jq -r '.[1][] | "\(.date) \(.value)"' > $country_code".txt"
    done

    ./graph.sh $width $height ../pictures/$1
    shift 1
done

cd $start_dir
