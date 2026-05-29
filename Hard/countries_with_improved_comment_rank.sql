/*
Problem Statement:
Compare the total number of comments made by users in each country
during December 2019 and January 2020.

For each month:
- Rank countries by total comments in descending order.
- Countries with the same total share the same rank.
- The next rank increases sequentially without gaps.

Return the names of countries whose rank improved
from December to January (smaller rank number).

-- Pattern:
CTE + Aggregation + Window Function

-- Technique:
1. Join comments table with users table to get country names.
2. Aggregate total comments per country for each month.
3. Use DENSE_RANK() to rank countries within each month.
4. Self-join December and January rankings.
5. Select countries where January rank is better than December rank.

-- Time complexity idea:
Aggregation: O(n)
Window ranking: O(k log k)
Join between ranked datasets: O(k)
*/

WITH country_ranks AS (
    SELECT
        t2.country,
        MONTH(t1.created_at) AS mnth,
        SUM(t1.number_of_comments) AS total_comments,

        DENSE_RANK() OVER (
            PARTITION BY MONTH(t1.created_at)
            ORDER BY SUM(t1.number_of_comments) DESC
        ) AS rnk

    FROM fb_comments_count t1

    JOIN fb_active_users t2
        ON t1.user_id = t2.user_id

    WHERE t1.created_at >= '2019-12-01'
      AND t1.created_at < '2020-02-01'

    GROUP BY t2.country, MONTH(t1.created_at)
)

SELECT jan.country
FROM country_ranks decm

JOIN country_ranks jan
    ON decm.country = jan.country

WHERE decm.mnth = 12
  AND jan.mnth = 1
  AND jan.rnk < decm.rnk;
