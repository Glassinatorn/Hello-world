# repositioning
start_dir=$PWD
cd $HOME/.config/awesome/scripts

countries="SE US DE CN"
set -- "inflation" "gdp" "gdp_capita" "foreign_investments" "education_expenditure" "interest_rates" "cpi" "unemployment_rate" "gini" "poverty" "population" "net_migration"
economical_indicators="FP.CPI.TOTL.ZG NY.GDP.MKTP.CD NY.GDP.PCAP.CD BX.KLT.DINV.WD.GD.ZS SE.XPD.TOTL.GD.ZS FR.INR.LEND FP.CPI.TOTL SL.UEM.TOTL.ZS SI.POV.GINI SI.POV.DDAY SP.POP.TOTL SM.POP.NETM"
   

for indicator in $economical_indicators; do
    for country_code in $countries; do
        curl -s "https://api.worldbank.org/v2/country/$country_code/indicator/$indicator?date=2000:2050&format=json" | jq -r '.[1][] | "\(.date) \(.value)"' | grep -v "null" | head -n 1 > "../data/"$country_code"_"$1".txt"
    done
    
    shift 1
done

cd $start_dir
