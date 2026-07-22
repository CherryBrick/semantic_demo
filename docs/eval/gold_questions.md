# Gold Questions — Business Question Backlog

> 15 natural-language questions a fictional Olist COO would ask. These drive the metrics dictionary, gold layer, Cube models, and evaluation set.

| ID | Question | Expected Grain | Priority |
|----|----------|---------------|----------|
| Q01 | What is monthly revenue trend by product category? | month, category | P0 |
| Q02 | Which categories drive the most revenue vs volume? | category | P0 |
| Q03 | What is the average order value (AOV) and how does it trend? | month | P0 |
| Q04 | Which states have the highest customer concentration and AOV? | state | P0 |
| Q05 | What is the month-over-month order growth rate? | month | P0 |
| Q06 | What is the average review score by product category? | category | P1 |
| Q07 | How does delivery time vary by seller state? | seller_state | P1 |
| Q08 | What % of orders exceed the estimated delivery date? | month, seller_state | P1 |
| Q09 | Which products have the highest cancellation rates? | product | P1 |
| Q10 | What is the most common payment method by region? | state, payment_type | P1 |
| Q11 | What is average freight cost as % of order value by region? | state | P2 |
| Q12 | Which sellers have the fastest average delivery? | seller | P2 |
| Q13 | How many installments do customers typically use by price bracket? | price_bucket | P2 |
| Q14 | What is the correlation between product weight and freight cost? | category | P2 |
| Q15 | What is the repeat purchase rate by customer state? | state | P2 |
