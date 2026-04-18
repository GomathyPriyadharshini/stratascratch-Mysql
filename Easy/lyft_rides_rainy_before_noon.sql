-- Problem:
-- Find all Lyft rides which happened on rainy days before noon.

-- Pattern:
-- Filtering with multiple conditions

-- Technique:
-- Use WHERE clause to filter by weather and time.
-- Use hour < 12 to ensure only times before noon are included.

-- Time complexity idea:
-- O(N) full table scan with filtering


-- Solution:

SELECT *
FROM lyft_rides
WHERE weather = 'rainy'
AND hour < 12;
