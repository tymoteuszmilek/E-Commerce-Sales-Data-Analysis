-- Amazon size-wise sales analysis
SELECT
    product_size, 
    SUM(quantity_ordered * order_amount) AS total_sales
FROM
    short_amazon_sale_report
GROUP BY     
    product_size 
ORDER BY
    total_sales DESC;