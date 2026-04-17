-- Problem:
-- Management wants to analyze only employees with official job titles.
-- Find the job titles of the employees with the highest salary.
-- If multiple employees have the same highest salary, include all their job titles.

-- Pattern:
-- Global maximum using subquery

-- Technique:
-- Use a subquery to find the maximum salary from the worker table.
-- Join worker and title tables to get only employees with official titles.
-- Filter records where salary equals the maximum salary.

-- Time complexity idea:
-- O(N) to compute MAX(salary) + O(N) scan for filtering + O(N) join


-- Solution:

SELECT b.worker_title AS best_paid_title
FROM worker a
JOIN title b
ON a.worker_id = b.worker_ref_id
WHERE a.salary = (
    SELECT MAX(salary)
    FROM worker
);
