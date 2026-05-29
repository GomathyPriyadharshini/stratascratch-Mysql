/*
Problem Statement:
Find the best-selling item for each month (no need to separate months by year).
The best-selling item is determined by the highest total sales amount:

total_paid = unitprice * quantity

A negative quantity indicates a return/cancellation, and cancelled invoices
start with 'C'. Ignore returns and cancellations while calculating sales.

Output:
- month
- description
- total amount paid

-- Pattern:
Aggregation + Window Function

-- Technique:
1. Filter out cancelled invoices.
2. Aggregate total sales by month and item description.
3. Use ROW_NUMBER() to rank items within each month by total sales.
4. Select the top-ranked item for every month.

-- Time complexity idea:
Aggregation over all rows: O(n)
Window ranking after grouping: O(k log k)
Overall depends on grouped dataset size.
*/

SELECT
    month,
    description,
    total_paid
FROM (
    SELECT
        MONTH(invoicedate) AS month,
        description,
        SUM(unitprice * quantity) AS total_paid,
        ROW_NUMBER() OVER (
            PARTITION BY MONTH(invoicedate)
            ORDER BY SUM(unitprice * quantity) DESC
        ) AS rnk
    FROM online_retail
    WHERE invoiceno NOT LIKE 'C%'
    GROUP BY 1, 2
) t1
WHERE rnk = 1
ORDER BY month;
