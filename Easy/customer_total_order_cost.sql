-- Problem:
-- Find the total cost of each customer's orders.
-- Output customer's id, first name, and the total order cost.
-- Order records by customer's first name alphabetically.


-- Pattern:  Aggregation with JOIN

-- Technique:
-- 1. Aggregate order data using GROUP BY on cust_id
-- 2. Compute SUM(total_order_cost) per customer
-- 3. Join aggregated result with customers table
-- 4. Select required fields and sort by first_name

-- Time complexity idea:
-- Let:
-- C = number of customers
-- O = number of orders
--
-- Step 1: GROUP BY aggregation on orders → O(O)
-- Step 2: JOIN with customers → O(C + O)
-- Overall: O(C + O)
--
-- Efficient and standard approach for aggregation queries

-- Solution:

SELECT c.id,
       c.first_name,
       o.total_order_cost
FROM customers c
INNER JOIN (
    SELECT cust_id,
           SUM(total_order_cost) AS total_order_cost
    FROM orders
    GROUP BY cust_id
) o
ON c.id = o.cust_id
ORDER BY c.first_name;
