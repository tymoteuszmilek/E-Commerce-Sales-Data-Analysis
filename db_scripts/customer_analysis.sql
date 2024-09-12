-- Customer type (B2B) and total sales query
SELECT 
    CASE
        WHEN is_b2b_customer = 't' THEN 'Business'
        WHEN is_b2b_customer = 'f' THEN 'Customer'
    END AS customer_type,
    SUM(quantity_ordered * order_amount) AS total_sales
FROM
    short_amazon_sale_report
GROUP BY
    is_b2b_customer;