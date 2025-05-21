### Question 1 - High-Value Customers with Multiple Products

**Goal:** Find customers who use both savings and investment products.

**Method:**
- Used a JOIN between `savings_account` and `investment_plan` on `customer_id`
- Counted savings and investments separately
- Added them to get `total_products`

**Note:** We only included customers who appear in both tables (meaning they use both services).

