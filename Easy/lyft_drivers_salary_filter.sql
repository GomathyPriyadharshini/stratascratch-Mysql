-- Problem:
-- Find all Lyft drivers who earn either equal to or less than 30k USD
-- or equal to or more than 70k USD.
-- Output all details related to retrieved records.

-- Pattern:
-- Filtering with OR condition

-- Technique:
-- Use WHERE clause with OR to filter values in two non-overlapping ranges:
-- <= 30000 and >= 70000.

-- Time complexity idea:
-- O(N) full table scan with filtering


-- Solution:

SELECT *
FROM lyft_drivers
WHERE yearly_salary <= 30000
   OR yearly_salary >= 70000;
