/*
Calculate the percentage of users who are both from the US and have an 'open' status, as indicated in the fb_active_users table.

-- Pattern: Conditional Aggregation
-- Technique: Aggregate filtering using SUM with boolean conditions
-- Time complexity idea: O(n) single table scan
*/

SELECT
    (
        SUM(country = 'USA' AND status = 'open') / COUNT(*)
    ) * 100 AS us_active_share
FROM fb_active_users;
