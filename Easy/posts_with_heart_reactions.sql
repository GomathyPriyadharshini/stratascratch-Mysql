-- Problem Statement:
-- Find all posts which were reacted to with a heart.
-- For such posts output all columns from facebook_posts table.

-- Pattern: Existence filtering (semi-join)
-- Technique: Correlated subquery with EXISTS to check matching condition without duplicates
-- Time complexity idea: O(N + M) with index on post_id (often faster due to early exit)

SELECT *
FROM facebook_posts p
WHERE EXISTS (
    SELECT 1
    FROM facebook_reactions r
    WHERE p.post_id = r.post_id
      AND r.reaction = 'heart'
);
