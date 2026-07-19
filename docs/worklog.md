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
