CREATE TABLE international_sale_report (
	index_id INTEGER PRIMARY KEY,
	date DATE,
	customer VARCHAR(50),
	style VARCHAR(50),
	sku VARCHAR(50),
	size VARCHAR(10),
	pcs DECIMAL(10,2),
	rate DECIMAL(10,2),
	gross_amt DECIMAL (10,2)
);

CREATE TABLE sale_report (
	index_id INTEGER PRIMARY KEY,
	sku VARCHAR(50),
	design_no VARCHAR(50),
	stock DECIMAL(10,2),
	category VARCHAR(50),
	size VARCHAR(10),
	color VARCHAR(50)	
);
	
CREATE TABLE amazon_sale_report (
	index_id INTEGER PRIMARY KEY,
	order_id VARCHAR(50),
	date DATE,
	status VARCHAR(100),
	fulfilment VARCHAR(50),
	sales_channel VARCHAR(50),
	ship_service_level VARCHAR(50),
	style VARCHAR(50),
	sku VARCHAR(50),
	category VARCHAR(50),
	size VARCHAR(10),
	asin VARCHAR(50),
	courier_status VARCHAR(30),
	qty INTEGER,
	currency VARCHAR(30),
	amount DECIMAL(10,2),
	ship_city VARCHAR(70),
	ship_state VARCHAR(50),
	ship_postal_code DECIMAL(10,2),
	ship_country VARCHAR(30),
	promotion_ids TEXT,
	b2b BOOLEAN,
	filfilled_by VARCHAR(50)
);
	
	
CREATE TABLE march_2021 (
	index_id INTEGER PRIMARY KEY,
	sku VARCHAR(50),
	style_id VARCHAR(50),
	catalog VARCHAR(50),
	category VARCHAR(50),
	weight DECIMAL (10,2),
	tp_1 INTEGER,
	tp_2 DECIMAL(10,2),
	mrp_old INTEGER,
	final_mrp_old INTEGER,
	ajo_mrp INTEGER,
	amazon_mrp INTEGER,
	amazon_fba_mrp INTEGER,
	flipkart_mrp INTEGER,
	limeroad_mrp INTEGER,
	myntra_mrp INTEGER,
	paytm_mrp INTEGER,
	snapdeal_mrp INTEGER
);