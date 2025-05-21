-- Assessment_Q1.sql

SELECT
    s.customer_id,
    COUNT(DISTINCT s.savings_id) AS savings_count,
    COUNT(DISTINCT i.investment_id) AS investment_count,
    COUNT(DISTINCT s.savings_id) + COUNT(DISTINCT i.investment_id) AS total_products
FROM
    savings_account s
JOIN
    investment_plan i ON s.customer_id = i.customer_id
GROUP BY
    s.customer_id
ORDER BY
    total_products DESC;