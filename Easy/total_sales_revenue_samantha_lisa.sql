-- Problem:
-- Calculate Samantha's and Lisa's total sales revenue.

-- Pattern:
-- Aggregation with filtering

-- Technique:
-- Use SUM() to aggregate sales_revenue.
-- Filter rows using WHERE with IN clause for specific salespersons.

-- Time complexity idea:
-- O(N) full table scan with filtering


-- Solution:

SELECT SUM(sales_revenue) AS total_revenue
FROM sales_performance
WHERE salesperson IN ('Samantha', 'Lisa');
