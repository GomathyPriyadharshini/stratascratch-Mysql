/*
Problem Statement:
Given a table of purchases by date, calculate the month-over-month percentage change in revenue.

The output should include:
- Year-month date (YYYY-MM)
- Percentage change in revenue rounded to 2 decimal places

Requirements:
- Sort results from the beginning of the year to the end of the year.
- Percentage change should be calculated starting from the second month.
- Formula:
  ((current_month_revenue - previous_month_revenue) / previous_month_revenue) * 100

Pattern:
Aggregation + Window Function (LAG)

Technique:
1. Aggregate revenue by month.
2. Use LAG() to retrieve the previous month's revenue.
3. Apply the percentage change formula.
4. Round the result to 2 decimal places.

Time Complexity Idea:
- Monthly aggregation: O(N)
- Window function processing: O(M)
- Overall: O(N log N) due to grouping/sorting, where N is number of records and M is number of months.

Solution:
*/

SELECT
    ym,
    ROUND(
        (
            (revenue - LAG(revenue) OVER (ORDER BY ym))
            / LAG(revenue) OVER (ORDER BY ym)
        ) * 100,
        2
    ) AS revenue_diff_pct
FROM (
    SELECT
        SUBSTRING(created_at, 1, 7) AS ym,
        SUM(value) AS revenue
    FROM sf_transactions
    GROUP BY 1
) t1;
