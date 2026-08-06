-- Query 1: Top 10 Sub-Categories by Revenue
SELECT
"Sub-Category",
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM
Superstore3
GROUP BY "Sub-Category"
ORDER BY total_sales DESC
limit 10;

-- Query 2: Sales Performance by Region
SELECT
Region,
COUNT(DISTINCT "Order ID") AS total_orders,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS profit_margin_pct
FROM
Superstore3
GROUP BY Region
ORDER BY total_sales DESC;

-- Query 3: Profit Margin by Customer Segment
SELECT
  Segment,
  COUNT(Segment) AS total_orders,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Profit) * 100.0
        / SUM(Sales), 2) AS profit_margin_pct
FROM Superstore3
GROUP BY Segment
ORDER BY profit_margin_pct DESC;

-- Query 4: Impact of Discount on Profit
SELECT
  CASE
    WHEN Discount = 0    THEN 'No Discount'
    WHEN Discount <= 0.2 THEN 'Low (1-20%)'
    WHEN Discount <= 0.4 THEN 'Medium (21-40%)'
    ELSE                      'High (41%+)'
  END AS discount_band,
  COUNT(*) AS total_orders,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM Superstore3
GROUP BY discount_band
ORDER BY total_profit DESC; 

-- Query 5: Monthly Sales Trend
SELECT
  STRFTIME('%Y-%m', "Order Date") AS month,
  ROUND(SUM(Sales), 2) AS monthly_sales,
  ROUND(SUM(Profit), 2) AS monthly_profit
FROM Superstore3
GROUP BY month
ORDER BY month ASC;