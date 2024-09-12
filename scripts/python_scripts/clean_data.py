import pandas as pd
import os

# Get the directory where the script is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Define input and output folders relative to the script's location
input_folder = os.path.join(script_dir, '../../data/uncleaned_data/')
output_folder = os.path.join(script_dir, '../../data/cleaned_data/')

# Make sure output folder exists
os.makedirs(output_folder, exist_ok=True)

def clean_csv(file_name):
    # Load the CSV file
    df = pd.read_csv(os.path.join(input_folder, file_name))

    # Remove rows with missing values and duplicates
    df_cleaned = df.dropna().drop_duplicates()

    # Cleaning data specific to each file
    match file_name:
        case 'international_sale_report.csv':
            df_cleaned = df_cleaned[df_cleaned['index'] <= 17234]
            if 'Months' in df_cleaned.columns:
                df_cleaned.drop(columns=['Months'], inplace=True)
        case 'amazon_sale_report.csv':
            if 'Unnamed: 22' in df_cleaned.columns:
                df_cleaned.drop(columns=['Unnamed: 22'], inplace=True)
        case 'march_2021.csv':
            df_cleaned = df_cleaned[df_cleaned['Catalog'] != 'Nill']
            df_cleaned = df_cleaned[df_cleaned['MRP Old'] != 'Nill']

    # Save cleaned CSV to output folder
    output_path = os.path.join(output_folder, 'cleaned_' + file_name)
    df_cleaned.to_csv(output_path, index=False)

csv_files = ['international_sale_report.csv', 'amazon_sale_report.csv', 'sale_report.csv',
             'march_2021.csv']

for file in csv_files:
    clean_csv(file)

print('Data cleaning completed.')
