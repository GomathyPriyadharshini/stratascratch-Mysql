/*
Find all the users who were active for 3 consecutive days or more.

-- Pattern: Gaps and Islands
-- Technique: ROW_NUMBER with date normalization to identify consecutive sequences
-- Time complexity idea: O(n log n) due to window function sorting per user
*/

WITH ranked AS (
    SELECT
        user_id,
        record_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY record_date
        ) AS rn
    FROM sf_events
),
grouped AS (
    SELECT
        user_id,
        record_date,
        DATE_SUB(record_date, INTERVAL rn DAY) AS grp_date
    FROM ranked
)

SELECT
    user_id
FROM grouped
GROUP BY user_id, grp_date
HAVING COUNT(*) >= 3;
