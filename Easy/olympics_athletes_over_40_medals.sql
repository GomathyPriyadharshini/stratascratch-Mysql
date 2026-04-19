-- Problem:
-- Find all athletes who were older than 40 years when they won either Bronze or Silver medals.

-- Pattern: Filtering
-- Technique: WHERE with multiple conditions (AND + IN)
-- Time complexity idea: O(n) full scan

select name
from olympics_athletes_events
where age > 40
  and medal in ('Bronze', 'Silver');
