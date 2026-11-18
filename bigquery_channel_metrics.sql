-- Channel Unit Economics & 6-Month LTV Aggregation
-- Evaluates user acquisition performance, week-one engagement, and conversion rates

SELECT
    ad_channel,
    COUNT(user_id) AS total_users,
    ROUND(AVG(notes_created_7d), 2) AS avg_notes_7d,
    ROUND(AVG(app_opens_7d), 2) AS avg_app_opens_7d,
    ROUND(AVG(converted_to_paid) * 100, 2) AS conversion_rate_pct,
    ROUND(SUM(ltv_6m_gbp), 2) AS total_revenue_6m_gbp,
    ROUND(AVG(ltv_6m_gbp), 2) AS avg_ltv_gbp
FROM
    `bending-spoons-portfolio.app_analytics.users_7d_metrics`
GROUP BY
    ad_channel
ORDER BY
    avg_ltv_gbp DESC;
