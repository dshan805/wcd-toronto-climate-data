# shebang, script to be excuted using bash shell
# run from main folder not from script folder
#!/bin/bash

##################################
# Set time stamp for log file 
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

##################################
# Set variables 
export scripts_folder='script'
export data_folder='data'
export output_folder='output'
export log_dir='logs'
export log_file="${log_dir}/logfile_${timestamp}.log"

##################################
# Set log rules 
exec > >(tee -a ${log_file}) 2>&1

# redirects standard output to tee and appends it to log file
# redirects standard error to same destination

##################################
# Download data
echo "Start downloading data"

for year in {2020..2022}; 
do wget  --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=48549&Year=${year}&Month=2&timeframe=1&submit= Download+Data" -O ${data_folder}/${year}.csv;
done;

# content-disposition: tells wget to use the file name suggested by the server
# -o ${data_folder}/${year}.csv: This option specifies the output file where the downloaded content will be saved. The -o option is used to specify the output file.  

RC1=$? 
# store exit status

if [ ${RC1} != 0 ]; then
    echo "Download failed!"
    echo "[Error: ] Return Code: ${RC1}"
    echo "[Error: ] Refer to log file"
    exit 1
fi

echo "Download successful" 

##################################
# run python script that takes individual excel file and concatenates into 1

echo "Running Python script" 
python ./${scripts_folder}/data_concat.py


RC1=$? 
if [ ${RC1} != 0 ]; then
    echo "Python script failed!"
    echo "[Error: ] Return Code: ${RC1}"
    echo "[Error: ] Refer to log file"
    exit 1
fi

echo "Concat successful"

exit 0 # exit with code 0

