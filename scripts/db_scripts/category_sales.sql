-- Amazon sales by category
SELECT
    product_category,
    SUM(quantity_ordered * order_amount) AS total_sales
FROM
    short_amazon_sale_report
GROUP BY     
    product_category
ORDER BY
    total_sales DESC;