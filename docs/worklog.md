# Worklog

## Week 1 — P0: Scoping & Foundations

--Date:-- 2026-07-19
--Hours:-- 7 / 7

### What I did

Initial setup:
- git root same as uv root
- installed dbt, kaggle
- dbt free tier workspace created, connect to dbt using official guide from sql warehouse page
- download olist dataset from kaggle to `/data/olist` (brazilian market data). Chose between this as recommended for the given task and hadoop logs from [this one
](https://www.kaggle.com/datasets/krishd123/log-data-for-anomaly-detection) as hadoop logs are closer to real problem solved for TCO Platform.

### What broke
- kaggle api key encoded in UTF-16 by default can not be used properly, check encoding of the file
-

### Decisions made
- use market dataset as it is more represantative of the project idea about comparing ai data insight with and without semantic layer
-

## Week 2 — P1: Cube.js Analytical Models

--Date:-- 2026-07-21
--Hours:-- 4 / 4

### What I did

Created Cube.js analytical models (9 cubes + 5 views) on top of existing dbt staging views:

**Cubes** (thin wrappers over `semantic-demo-catalog.staging.stg_*`):
- `stg_orders`, `stg_customers`, `stg_order_items`, `stg_order_payments`, `stg_order_reviews`, `stg_products`, `stg_sellers`, `stg_geolocation`, `stg_category_translation`
- Each cube defines dimensions with typed columns, measures (sum/avg/count), and joins to related cubes
- Composite primary keys added for `stg_order_items` (CONCAT order_id + order_item_id) and `stg_order_payments` (CONCAT order_id + payment_sequential) as required by Cube.js for join targets

**Views** (joined analytical models answering business questions):
- `revenue_analytics` — orders → items → products → category_translation (revenue, AOV, order count)
- `customer_insights` — orders → customers (customer count, repeat rate, by state)
- `product_performance` — items → products, orders → reviews (avg review score by category, revenue)
- `fulfillment_analytics` — orders → items → sellers, orders → reviews (delivery metrics, freight, seller performance)
- `payment_behavior` — orders → payments, orders → customers (payment type distribution, installments by region)

**Docs populated:**
- `docs/eval/gold_questions.md` — 15 business questions (P0/P1/P2) mapped to expected grain
- `docs/eval/metrics_dictionary.md` — 12 metrics with formulas, grain, allowed dimensions

### Verification

- Cube API loads all 9 cubes + 5 views without schema errors
- SQL generation verified for all 5 views — correct multi-table JOINs, aggregations, GROUP BY
- Generated SQL references correct Databricks tables (`semantic-demo-catalog.staging.stg_*`)
- Query results empty because `dbt build` hasn't been run to materialize staging views (expected)

### What broke

- Cube Store permission issue (`EACCES` on `/cubejs/rust/cubestore/downloaded`) — fixed by `chown` in Dockerfile
- Cube healthcheck failed on `/readyz` due to Cube Store error — fixed by changing to `/cubejs-api/v1/meta`
- Cube.js requires primary keys on any cube that's a join target — added composite PKs for `stg_order_items` and `stg_order_payments`
- MCPO proxy returns 404 on all endpoints — pre-existing issue, likely MCPO configuration or version

### Decisions made

- Use Cube.js only for semantic layer, skip dbt MetricFlow (YAGNI — Cube already deployed)
- All views root from `stg_orders` (central fact table) — avoids reverse joins, simplifies navigation
- Prefer YAML-only Cube definitions over custom JS schema files (simpler, no code to maintain)
- Keep pre-aggregations disabled unless query performance requires them
