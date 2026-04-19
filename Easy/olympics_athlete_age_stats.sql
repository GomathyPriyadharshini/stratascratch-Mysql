-- Problem:
-- Find the lowest, average, and highest ages of athletes across all Olympics.
-- If an athlete participated in more than one discipline at one Olympic games,
-- consider it as a separate athlete (do not remove duplicates).

-- Pattern: Aggregation
-- Technique: MIN, AVG, MAX
-- Time complexity idea: O(n) full scan

select min(age) as lowest_age,
       avg(age) as mean_age,
       max(age) as highest_age
from olympics_athletes_events;
