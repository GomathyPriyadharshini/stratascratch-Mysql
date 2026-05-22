/*
For each video, find how many unique users flagged it. A unique user can be identified using the combination of their first name and last name. Do not consider rows in which there is no flag ID.

-- Pattern: Distinct Aggregation
-- Technique: COUNT DISTINCT with concatenated user identity and GROUP BY
-- Time complexity idea: O(n) scan with hashing/sorting for distinct user combinations
*/

SELECT
    video_id,
    COUNT(
        DISTINCT CONCAT(
            IFNULL(user_firstname, ''),
            IFNULL(user_lastname, '')
        )
    ) AS num_unique_users
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id;
