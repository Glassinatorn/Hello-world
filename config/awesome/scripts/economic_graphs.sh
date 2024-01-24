# repositioning
start_dir=$PWD
cd $HOME/.config/awesome/scripts

width=1650
height=500
countries="SE US DE CN"
set -- "inflation.png" "gdp.png" "gdp_per_capita.png" "foreign_investments.png" "education_expenditure.png" "interest_rates.png" "cpi.png" "unemployment_rate.png" "gini_coefficient.png" "poverty.png" "population.png" "net_migration.png"
economical_indicators="FP.CPI.TOTL.ZG NY.GDP.MKTP.CD NY.GDP.PCAP.CD BX.KLT.DINV.WD.GD.ZS SE.XPD.TOTL.GD.ZS FR.INR.LEND FP.CPI.TOTL SL.UEM.TOTL.ZS SI.POV.GINI SI.POV.DDAY SP.POP.TOTL SM.POP.NETM"
   

for indicator in $economical_indicators; do
    for country_code in $countries; do
        curl -s "https://api.worldbank.org/v2/country/$country_code/indicator/$indicator?date=1970:2030&format=json" | jq -r '.[1][] | "\(.date) \(.value)"' > $country_code".txt"
    done

    ./graph.sh $width $height ../pictures/$1
    shift 1

done

cd $start_dir
