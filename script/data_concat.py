# import libraries
import pandas as pd
import glob
import os 

# assuming the download has been properly done there should be multiple files in the folder data

# Get the directory of the script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Construct paths relative to the script directory
data_path = os.path.join(script_dir, '..', 'data')
output_path = os.path.join(script_dir, '..', 'output')
file_name = "all_years.csv"
data_files = glob.glob(os.path.join(data_path, "*.csv"))

files = []

for file in data_files:
    df = pd.read_csv(file, index_col=None, header=0)
    files.append(df)
    print(f'{file} read')

df_concat = pd.concat(files, axis=0, ignore_index=True)

df_concat.to_csv(output_path+"/"+file_name)
