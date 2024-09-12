# E-Commerce Sales Data Analysis

## Project Overview

This project analyzes and visualizes e-commerce sales data using PostgreSQL, Pandas, and Matplotlib. The aim is to provide insights into sales trends, distribution by categories, and other key metrics through various visualizations.

## Table of Contents

- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Data Description](#data-description)
- [Usage](#usage)
- [License](#license)

## Project Structure

- `data/`: Contains the raw and cleaned datasets used in the analysis.
- `scripts/`: Contains SQL and Python scripts for data processing and visualization.
  - `db_scripts/`: SQL scripts for database initialization, data insertion, and exporting data.
  - `python_scripts/`: Python scripts for data cleaning and visualization.
- `visualizations/`: Contains generated visualizations in PNG format.

## Setup Instructions

1. **Create Database**:
   - Create a new PostgreSQL database.

2. **Data Cleaning**:
   - Navigate to the `python_scripts` folder.
   - Run `python3 clean_data.py` to clean the dataset.

3. **Database Initialization**:
   - Navigate to the `db_scripts` folder.
   - Log in to PostgreSQL using `psql -U [username] [database_name]`.
   - Execute `\i run_initializer.sql` to create tables, insert data, and create indexes and views.

4. **Extract Data**:
   - Run `\i csv_extractor.sql` to export queried data into CSV files.

5. **Generate Visualizations**:
   - Navigate to the `python_scripts` folder.
   - Run `python3 visualization.py` to generate visualizations.

6. **Check the `visualizations` folder** for the saved charts.

## Data Description

The datasets used are from [Unlock Profits with E-Commerce Sales Data](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data/data) on Kaggle. The data includes various aspects of e-commerce sales, including:

- Sales by Category
- Daily and Weekly Sales Distribution
- Customer Types
- Order Status
- Top SKUs
- Sales by Product Size
- Spending per Order

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/tymoteuszmilek/E-Commerce-Sales-Data-Visualization/blob/main/LICENSE.md) file for details.
