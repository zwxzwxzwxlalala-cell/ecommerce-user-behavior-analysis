CREATE TABLE agg_user_rfm AS SELECT user_id, DATEDIFF('2019-12-01', MAX(event_time)) AS recency, COUNT(*) AS frequency, ROUND(SUM(price), 2) AS monetary FROM raw_events WHERE event_type = 'purchase' GROUP BY user_id;
CREATE TABLE agg_category AS SELECT SUBSTRING_INDEX(category_code, '.', 1) AS main_category, COUNT(*) AS purchase_count, ROUND(SUM(price), 2) AS total_revenue, ROUND(AVG(price), 2) AS avg_price FROM raw_events WHERE event_type = 'purchase' AND category_code IS NOT NULL AND category_code != '' GROUP BY main_category ORDER BY total_revenue DESC;
CREATE TABLE agg_hourly AS SELECT HOUR(event_time) AS hour_of_day, COUNT(*) AS event_count, SUM(event_type = 'purchase') AS purchases FROM raw_events GROUP BY hour_of_day ORDER BY hour_of_day;
CREATE TABLE session_funnel AS
SELECT
    user_session,
    MAX(event_type = 'view') AS has_view,
    MAX(event_type = 'cart') AS has_cart,
    MAX(event_type = 'purchase') AS has_purchase
FROM raw_events
GROUP BY user_session;
CREATE TABLE agg_daily_trend AS
SELECT
    DATE(event_time) AS date,
    SUM(event_type = 'purchase') AS daily_orders,
    ROUND(SUM(CASE WHEN event_type = 'purchase' THEN price ELSE 0 END), 2) AS daily_revenue
FROM raw_events
GROUP BY DATE(event_time)
ORDER BY date;
