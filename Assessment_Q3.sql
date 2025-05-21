-- Assessment_Q3.sql

WITH customer_joined AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', account_open_date) AS join_month,
        account_open_date,
        last_transaction_date,
        CASE
            WHEN last_transaction_date >= account_open_date + INTERVAL '6 months' THEN 1
            ELSE 0
        END AS retained_after_6_months
    FROM
        customers
),
monthly_retention AS (
    SELECT
        join_month,
        COUNT(*) AS new_customers,
        SUM(retained_after_6_months) AS retained_customers
    FROM
        customer_joined
    GROUP BY
        join_month
    ORDER BY
        join_month
)

SELECT
    join_month,
    new_customers,
    retained_customers,
    ROUND(100.0 * retained_customers / new_customers, 1) AS retention_rate_percent
FROM
    monthly_retention;
