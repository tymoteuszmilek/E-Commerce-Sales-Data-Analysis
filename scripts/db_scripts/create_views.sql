-- Create a view for a shortened version of the amazon_sale_report table
CREATE VIEW short_amazon_sale_report AS
SELECT
    order_id,
    date AS order_date,
    status AS order_status,
    style AS product_style,
    sku AS product_sku,
    category AS product_category,
    size AS product_size,
    qty AS quantity_ordered,
    currency AS currency_used,
    amount AS order_amount,
    ship_state AS shipping_state,
    b2b AS is_b2b_customer
FROM
    amazon_sale_report;

-- Create a view for selected fields from march_2021
CREATE VIEW short_march_2021 AS
SELECT
    index_id,
    sku AS product_sku,
    category AS product_category,
    weight AS product_weight,
    tp_1 AS first_trade_price,
    tp_2 AS second_trade_price,
    mrp_old AS old_mrp,
    final_mrp_old AS final_old_mrp,
    ajo_mrp,
    amazon_mrp,
    flipkart_mrp,
    limeroad_mrp,
    myntra_mrp,
    paytm_mrp,
    snapdeal_mrp
FROM
    march_2021;

