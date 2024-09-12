-- Distribution of total spending per order
WITH order_data AS (
    SELECT
        date,
        customer,
        gross_amt,
        CASE
            WHEN LAG(customer) OVER(ORDER BY date ASC) = customer THEN 0
            ELSE 1
        END AS customer_change
    FROM
        international_sale_report
),
indexed_orders AS (
    SELECT
        customer,
        gross_amt,
        SUM(customer_change) OVER(ORDER BY date ASC) AS order_index
    FROM
        order_data
),
total_gross_amt_per_order AS (
    SELECT
        customer,
        SUM(gross_amt) AS total_gross_amt,
        order_index
    FROM
        indexed_orders
    GROUP BY
        customer, order_index
)
SELECT 
    total_gross_amt
FROM
    total_gross_amt_per_order;
    
-- Distribution of total amount per order
WITH order_data AS (
    SELECT
        date,
        customer,
        pcs,
        CASE
            WHEN LAG(customer) OVER(ORDER BY date ASC) = customer THEN 0
            ELSE 1
        END AS customer_change
    FROM
        international_sale_report
),
indexed_orders AS (
    SELECT
        customer,
        pcs,
        SUM(customer_change) OVER(ORDER BY date ASC) AS order_index
    FROM
        order_data
),
total_pcs_per_order AS (
    SELECT
        customer,
        SUM(pcs) AS total_amount,
        order_index
    FROM
        indexed_orders
    GROUP BY
        customer, order_index
)
SELECT 
    CAST(total_amount AS INTEGER)
FROM
    total_pcs_per_order;