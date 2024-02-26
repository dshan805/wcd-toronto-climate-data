# Mini Project--Toronto Climate Data
## Data Engineering Diploma

### 1. Business Scenario
We are going to process Canadian Climate data.

Usually, when we want to download the weather data manually, we go to https://climate.weather.gc.ca/historical_data/search_historic_data_e.html.

But this time, you are going to use a data engineer way to download some data from Canada Climate website, and output one file.

### 2. Business Requirements
Please download the data from Canadian Climate.
Please concatenate the downloaded files into one final csv file, called all_years.csv. This is the output of the lab.
Please upload your scripts and final csv file all_years.csv to the repository you created in the Github.

### 3. Deliverable
You need to submit a shell script, a python script and all_years.csv to the github repository you created for the lab.

Shell script: You will use the shell script to control every operation, including data downloading, log setting, python script running.
Python script: While the Python script is used to concatenate all the data into one file.
all_years.csv: This is the output file you concatenate all the downloads.

### 4. Program Procedure
download data with shell command
concatenate data to one file with the python script
save output file in the python script
print out SUCCESS with shell command.
create a repository in github, and upload your file to the repo with git.
The Shell script will call the Python Script to finish the Python work.

### 5. Specification Detail
We only need the data of Station ID = 48549.
The year range of the data we want is from 2020 to 2022.
We only want the data in February.
The data will be downloaded in hourly format.
The output file will be named as all_years.csv.

### 6. Technical Instruction
1. How to download data?

Use the following utility to download data:
• wget (GNU / Linux Operating systems)
• Homebrew (OS X - Apple) http://brew.sh/

Example to download all available hourly data for Yellowknife A, from 1998 to 2008, in .csv format.

for year in {1998..2008}; 
do wget  --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=1706&Year=${year}&Month=2&Day=14&timeframe=1&submit= Download+Data";
done;
WHERE:
• year = change values in command line {1998..2008}
• month = 2
• format= [csv|xml]: the format output
• timeframe = 1: for hourly data
• timeframe = 2: for daily data
• timeframe = 3 for monthly data
• Day: the value of the "day" variable is not used and can be an arbitrary value
• For another station, change the value of the variable stationID
• For the data in XML format, change the value of the variable format to xml in the URL.

2. How to compose the shell script?
The shell need to include the following specifications:

Must be run in bash or zsh shell (not sh, not dash)
Must define the various directories.
Must generate logs.
Can print error when there is a programming error.
Must have a mechanism to exit the program safely.
In the Exercise File, you will find a example how to compose a shell script.

3. How to concatenate data into one file with python?
You can use your own way, but use glob and pandas can finish the job.
