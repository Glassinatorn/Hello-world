# just a wrapper for real python script
cd $HOME/.config/awesome/scripts

# loading python enviroment
if [ -d env/ ]; then
    source env/bin/activate
else
    python3 -m venv env
    source env/bin/activate
    pip install lxml requests
fi

# running the actual script
python electricity_price.py

