-- Assessment_Q4.sql

WITH monthly_revenue AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', transaction_date) AS revenue_month,
        SUM(amount) AS monthly_revenue
    FROM
        transactions
    GROUP BY
        customer_id, DATE_TRUNC('month', transaction_date)
),
revenue_with_trend AS (
    SELECT
        customer_id,
        revenue_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (PARTITION BY customer_id ORDER BY revenue_month) AS previous_month_revenue
    FROM
        monthly_revenue
),
revenue_growth_labeled AS (
    SELECT
        customer_id,
        revenue_month,
        monthly_revenue,
        previous_month_revenue,
        CASE
            WHEN previous_month_revenue IS NULL THEN 'No Previous Data'
            WHEN monthly_revenue > previous_month_revenue THEN 'Increasing'
            WHEN monthly_revenue < previous_month_revenue THEN 'Decreasing'
            ELSE 'No Change'
        END AS revenue_trend
    FROM
        revenue_with_trend
)

SELECT *
FROM revenue_growth_labeled
ORDER BY customer_id, revenue_month;