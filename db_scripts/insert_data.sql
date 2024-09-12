\copy international_sale_report FROM '../../data/cleaned_data/cleaned_international_sale_report.csv' DELIMITER ',' CSV HEADER;
\copy sale_report FROM '../../data/cleaned_data/cleaned_sale_report.csv' DELIMITER ',' CSV HEADER;
\copy amazon_sale_report FROM '../../data/cleaned_data/cleaned_amazon_sale_report.csv' DELIMITER ',' CSV HEADER;
\copy march_2021 FROM '../../data/cleaned_data/cleaned_march_2021.csv' DELIMITER ',' CSV HEADER;
