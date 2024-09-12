-- Order status distribution showing percentage of each status
WITH total_orders AS (
    SELECT 
        COUNT(*) AS total_orders
    FROM
        short_amazon_sale_report
),
status_distribution AS (
    SELECT
        order_status,
        ROUND(CAST(COUNT(*) AS DECIMAL) * 100 / total_orders.total_orders, 3) AS percentage_of_orders
    FROM
        short_amazon_sale_report
    CROSS JOIN
        total_orders
    GROUP BY
        order_status, total_orders.total_orders
)
SELECT *
FROM
    status_distribution
ORDER BY
    percentage_of_orders DESC;