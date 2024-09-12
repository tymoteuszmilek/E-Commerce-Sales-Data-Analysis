-- Comparison of average prices across platforms for March 2021
WITH avg_price_per_category AS (
    SELECT
        product_category,
        ROUND(AVG(ajo_mrp), 2) AS avg_ajo_mrp,
        ROUND(AVG(amazon_mrp), 2) AS avg_amazon_mrp,
        ROUND(AVG(flipkart_mrp), 2) AS avg_flipkart_mrp,
        ROUND(AVG(limeroad_mrp), 2) AS avg_limeroad_mrp,
        ROUND(AVG(myntra_mrp), 2) AS avg_myntra_mrp,
        ROUND(AVG(paytm_mrp), 2) AS avg_paytm_mrp,
        ROUND(AVG(snapdeal_mrp), 2) AS avg_snapdeal_mrp
    FROM
        short_march_2021
    GROUP BY
        product_category
)
SELECT * FROM avg_price_per_category;

-- Percentage comparison of trade price (TP) to original price of the product (old_mrp) for May 2022
SELECT 
    CONCAT(ROUND(AVG(trade_price) / AVG(old_mrp), 2), '%') AS tp_to_mrp_percentage
FROM
    short_may_2022;