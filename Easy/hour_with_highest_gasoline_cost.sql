-- Problem:
-- Find the hour with the highest gasoline cost.
-- Assume there's only 1 hour with the highest gas cost.

-- Pattern:
-- Global maximum using subquery

-- Technique:
-- Use a subquery to find MAX(gasoline_cost).
-- Filter rows where gasoline_cost equals this maximum value.

-- Time complexity idea:
-- O(N) to compute MAX + O(N) scan for filtering


-- Solution:

SELECT hour
FROM lyft_rides
WHERE gasoline_cost = (
    SELECT MAX(gasoline_cost)
    FROM lyft_rides
);
