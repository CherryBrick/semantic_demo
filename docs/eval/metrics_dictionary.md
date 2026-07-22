# Metrics Dictionary v0

> Derived from the gold question backlog. Each metric is named, defined, and scoped to specific grains and dimensions. Cube model names must match these names.

| Metric Name | Business Definition | Formula | Grain | Allowed Dimensions |
|-------------|-------------------|---------|-------|--------------------|
| revenue | Total sales revenue | SUM(order_items.price) | order | order_purchase_timestamp, category, state, payment_type |
| aov | Average order value | SUM(price) / COUNT(DISTINCT order_id) | order | order_purchase_timestamp, state, category |
| order_count | Number of orders placed | COUNT(DISTINCT order_id) | order | order_purchase_timestamp, state, category, status |
| customer_count | Number of unique customers | COUNT(DISTINCT customer_id) | customer | state, city |
| avg_review_score | Average customer review score | AVG(review_score) | review | category, seller_state, product |
| delivery_days | Days from purchase to delivery | DATEDIFF(day, purchase_timestamp, delivered_date) | order | seller_state, product_category |
| ontime_pct | % of orders delivered by estimated date | COUNT(delivered <= estimated) / COUNT(*) | order | seller_state, month |
| freight_ratio | Freight cost as % of order value | SUM(freight_value) / SUM(price) | order_item | state, category |
| cancel_rate | % of orders with status = canceled | COUNT(canceled) / COUNT(*) | order | product_category, month |
| avg_installments | Average payment installments | AVG(payment_installments) | payment | payment_type, state |
| items_per_order | Average items per order | COUNT(item_id) / COUNT(DISTINCT order_id) | order | category, month |
| repeat_rate | % of customers with >1 order | COUNT(customer with >1 order) / COUNT(total customers) | customer | state |
