-- Top 10 SKUs by quantity sold
SELECT
    product_sku,
    SUM(quantity_ordered) AS total_quantity_sold
FROM
    short_amazon_sale_report
GROUP BY 
    product_sku
ORDER BY 
    total_quantity_sold DESC
LIMIT 10;

-- International sales with top 10 SKUs
SELECT
    sku,
    CAST(SUM(pcs) AS INTEGER) AS total_sales
FROM
    international_sale_report
GROUP BY
    sku
ORDER BY
    total_sales DESC
LIMIT 10;