-- Assessment_Q5.sql

-- 1. Duplicate transactions (same customer, date, amount)
SELECT
    customer_id,
    transaction_date,
    amount,
    COUNT(*) AS duplicate_count
FROM
    transactions
GROUP BY
    customer_id, transaction_date, amount
HAVING
    COUNT(*) > 1;


-- 2. Missing (NULL) values
SELECT *
FROM transactions
WHERE
    customer_id IS NULL
    OR transaction_date IS NULL
    OR amount IS NULL;


-- 3. Negative transaction amounts
SELECT *
FROM transactions
WHERE
    amount < 0;

