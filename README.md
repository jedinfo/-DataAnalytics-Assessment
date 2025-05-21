### Question 1 - High-Value Customers with Multiple Products

**Goal:** Find customers who use both savings and investment products.

**Method:**
- Used a JOIN between `savings_account` and `investment_plan` on `customer_id`
- Counted savings and investments separately
- Added them to get `total_products`

**Note:** We only included customers who appear in both tables (meaning they use both services).

### Question 2 - Transaction Frequency Analysis

**Goal:** Categorize customers based on how often they transact.

**Method:**
- Calculated total number of transactions per customer
- Divided by `tenure_months` to get average per month
- Used CASE WHEN to assign frequency categories
- Grouped by category to count customers and their average monthly activity

**Categories:**
- High Frequency: ≥ 8
- Medium Frequency: 4 to < 8
- Low Frequency: < 4
