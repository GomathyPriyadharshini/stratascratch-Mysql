-- Problem:
-- Find how many times each artist appeared on the Spotify ranking list.
-- Output the artist name along with the corresponding number of occurrences.
-- Order records by the number of occurrences in descending order.

-- Pattern: Aggregation (Group By)
-- Technique: COUNT(*) with GROUP BY
-- Time complexity idea: O(n) full table scan

select artist,
       count(*) as n_occurrences
from spotify_worldwide_daily_song_ranking
group by artist
order by n_occurrences desc;
