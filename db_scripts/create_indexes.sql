-- For amazon_sale_report table

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_order_date') THEN
        CREATE INDEX idx_order_date ON amazon_sale_report(date);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_order_status') THEN
        CREATE INDEX idx_order_status ON amazon_sale_report(status);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_product_sku') THEN
        CREATE INDEX idx_product_sku ON amazon_sale_report(sku);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_product_category') THEN
        CREATE INDEX idx_product_category ON amazon_sale_report(category);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_product_size') THEN
        CREATE INDEX idx_product_size ON amazon_sale_report(size);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_quantity_order_amount') THEN
        CREATE INDEX idx_quantity_order_amount ON amazon_sale_report(qty, amount);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_is_b2b_customer') THEN
        CREATE INDEX idx_is_b2b_customer ON amazon_sale_report(b2b);
    END IF;
END $$;

-- For international_sale_report table

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_date') THEN
        CREATE INDEX idx_date ON international_sale_report(date);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_customer') THEN
        CREATE INDEX idx_customer ON international_sale_report(customer);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_sku') THEN
        CREATE INDEX idx_sku ON international_sale_report(sku);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_pcs') THEN
        CREATE INDEX idx_pcs ON international_sale_report(pcs);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_gross_amt') THEN
        CREATE INDEX idx_gross_amt ON international_sale_report(gross_amt);
    END IF;
END $$;

-- For march_2021 table

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_product_category_march_2021') THEN
        CREATE INDEX idx_product_category_march_2021 ON march_2021(category);
    END IF;
END $$;
