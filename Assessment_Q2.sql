- Assessment_Q2.sql

WITH transaction_summary AS (
    SELECT
        t.customer_id,
        COUNT(*) AS total_transactions,
        c.tenure_months,
        COUNT(*) * 1.0 / c.tenure_months AS avg_transactions_per_month
    FROM
        transactions t
    JOIN
        customers c ON t.customer_id = c.customer_id
    GROUP BY
        t.customer_id, c.tenure_months
),
categorized_customers AS (
    SELECT
        customer_id,
        avg_transactions_per_month,
        CASE
            WHEN avg_transactions_per_month >= 8 THEN 'High Frequency'
            WHEN avg_transactions_per_month >= 4 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM
        transaction_summary
)

SELECT
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_transactions_per_month), 1) AS avg_transactions_per_month
FROM
    categorized_customers
GROUP BY
    frequency_category;
