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


### Question 3 - Customer Retention and Drop-off Rate

**Goal:** Understand how many customers remain active after 6 months of joining.

**Method:**
- Grouped customers by the month they joined
- Checked if they had a transaction at least 6 months later
- Counted how many stayed active vs. dropped off
- Calculated monthly retention rate

**Formula:**
retention_rate = (customers retained after 6 months / new customers) * 100
README.md
