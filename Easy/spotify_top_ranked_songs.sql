-- Problem:
-- Find songs that have ranked in the top position.
-- Output track name and number of times it ranked at position 1.
-- Sort by number of times in descending order.

-- Pattern: Filtering + Aggregation
-- Technique: WHERE + GROUP BY + COUNT
-- Time complexity idea: O(n) full scan

select trackname,
       count(*) as times_top1
from spotify_worldwide_daily_song_ranking
where position = 1
group by trackname
order by times_top1 desc;
