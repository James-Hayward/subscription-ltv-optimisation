# Subscription Growth & 6-Month LTV Optimisation Engine

## Executive Summary & Business Problem
Consumer subscription apps rely on efficient user acquisition and strong week-one onboarding engagement to maximise 6-month Lifetime Value (LTV). Using a simulated dataset of **10,000 freemium mobile app users**, this end-to-end data science project evaluates acquisition channel unit economics, predicts paid subscription conversion from early user behaviour, and measures the commercial impact of a paywall A/B test.

📊 **Live Executive Dashboard:** [View Interactive Looker Studio Report](INSERT_YOUR_LOOKER_STUDIO_LINK_HERE)

---

## Tech Stack
* **Data Warehousing & SQL:** Google BigQuery
* **Data Engineering & Machine Learning:** Python (`pandas`, `numpy`, `scikit-learn`, `scipy`)
* **Business Intelligence & Visualisation:** Looker Studio

---

## Key Findings & Commercial Recommendations
1. **Reallocate Paid Acquisition Spend:** Users acquired via **Organic** and **Google Ads** generate substantially higher 6-month LTV (£) than **TikTok** users due to higher first-week feature engagement (`notes_created_7d`).
   * *Recommendation:* Shift 20% of paid social budget from TikTok toward Google Ads to improve Return on Ad Spend (ROAS).
2. **Optimise Week-One Activation:** Logistic regression feature weights demonstrate that `notes_created_7d` and `paywall_views_7d` are the strongest behavioural predictors of paid conversion (ROC-AUC: **~0.75**).
   * *Recommendation:* Introduce an interactive onboarding checklist prompting new users to create at least 3 notes within their first 48 hours.
3. **Roll Out New Paywall Design:** A two-sample t-test evaluating a 10,000-user A/B test confirmed a statistically significant **+2.5% lift** in conversion rate ($p < 0.05$).
   * *Recommendation:* Ship the new paywall variant to 100% of users.

---

## Data Quality & Iteration Log
* **Anomaly Detected:** During initial BI dashboard validation (`v1_initial_dashboard_flat_anomaly.pdf`), the daily signup time series displayed an unnatural flat distribution (~55–58 signups/day) caused by uniform date spacing in the initial simulation script.
* **Root-Cause Fix:** Refactored the ingestion script to model realistic organic growth and daily variance, overwrote the production table in Google BigQuery, and refreshed the Looker Studio pipeline to validate the updated growth curve.

---

## Repository Structure
* `analysis_and_modeling.ipynb` — End-to-end Python notebook covering data generation, exploratory data analysis, logistic regression modelling, and A/B test hypothesis testing.
* `bigquery_channel_metrics.sql` — Analytical SQL query aggregating user cohorts, conversion rates, and 6-month revenue by acquisition channel.
* `v1_initial_dashboard_flat_anomaly.pdf` — Initial dashboard snapshot documenting the date-distribution anomaly prior to pipeline remediation.
* `v2_final_executive_dashboard.pdf` — Final validated Looker Studio executive report.
