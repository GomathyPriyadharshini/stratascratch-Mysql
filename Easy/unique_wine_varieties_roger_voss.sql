-- Problem:
-- Find wine varieties tasted by 'Roger Voss' and with a value in the 'region_1' column.
-- Output unique variety names only.

-- Pattern:
-- Filtering + deduplication

-- Technique:
-- Filter rows using WHERE conditions (taster_name and non-null region_1).
-- Use DISTINCT to return only unique variety values.

-- Time complexity idea:
-- O(N) scan + O(N log N) for DISTINCT (depending on implementation)


-- Solution:

SELECT DISTINCT variety
FROM winemag_p2
WHERE taster_name = 'Roger Voss'
AND region_1 IS NOT NULL;
