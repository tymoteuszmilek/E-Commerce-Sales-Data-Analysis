-- Amazon daily sales distribution query
SELECT
    order_date,
    SUM(quantity_ordered * order_amount) AS total_sales
FROM
    short_amazon_sale_report
WHERE
	order_date <> '2022-06-29'
	AND order_date <> '2022-04-30'
GROUP BY
    order_date
ORDER BY 
    order_date ASC;

-- Weekday sales distribution query using EXTRACT for day of week
WITH weekday_sales AS (
    SELECT
        EXTRACT(DOW FROM order_date) AS weekday_number,
        SUM(quantity_ordered * order_amount) AS total_sales
    FROM
        short_amazon_sale_report
    WHERE
        order_date <> '2022-06-29'
        AND order_date <> '2022-04-30'
    GROUP BY 
        EXTRACT(DOW FROM order_date)
),
weekday_names AS (
    SELECT
        weekday_number,
        CASE
            WHEN weekday_number = 0 THEN 'Sunday'
            WHEN weekday_number = 1 THEN 'Monday'
            WHEN weekday_number = 2 THEN 'Tuesday'
            WHEN weekday_number = 3 THEN 'Wednesday'
            WHEN weekday_number = 4 THEN 'Thursday'
            WHEN weekday_number = 5 THEN 'Friday'
            WHEN weekday_number = 6 THEN 'Saturday'
        END AS weekday_name
    FROM 
        weekday_sales
),
avg_sales AS (
    SELECT
        weekday_number,
        ROUND(AVG(total_sales), 2) AS avg_sales
    FROM
        weekday_sales
    GROUP BY
        weekday_number
)
SELECT
    weekday_names.weekday_name,
    avg_sales.avg_sales
FROM
    avg_sales
JOIN
    weekday_names
ON 
    avg_sales.weekday_number = weekday_names.weekday_number
ORDER BY
    CASE
        WHEN weekday_names.weekday_name = 'Monday' THEN 1
        WHEN weekday_names.weekday_name = 'Tuesday' THEN 2
        WHEN weekday_names.weekday_name = 'Wednesday' THEN 3
        WHEN weekday_names.weekday_name = 'Thursday' THEN 4
        WHEN weekday_names.weekday_name = 'Friday' THEN 5
        WHEN weekday_names.weekday_name = 'Saturday' THEN 6
        WHEN weekday_names.weekday_name = 'Sunday' THEN 7
    END;

        

