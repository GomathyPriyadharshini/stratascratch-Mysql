-- Problem Statement:
-- We have a table with employees and their salaries; however, some of the records are old
-- and contain outdated salary information.
--
-- Since there is no timestamp, assume salary is non-decreasing over time.
-- The current salary for an employee is the largest salary value among their records.
--
-- If multiple records share the same maximum salary, return any one of them.
--
-- Output: id, first_name, last_name, department_id, salary
-- Order the result by employee ID in ascending order.

---------------------------------------------------------------------
-- Solution 1: ROW_NUMBER() (Recommended)
---------------------------------------------------------------------

-- Pattern: Top-N per group (latest/highest record per entity)
-- Technique: ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC)
-- Time complexity idea: O(N log N) due to sorting

SELECT id, first_name, last_name, department_id, salary
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC) AS rn
    FROM ms_employee_salary
) t
WHERE rn = 1
ORDER BY id;

---------------------------------------------------------------------
-- Solution 2: MAX() + JOIN
---------------------------------------------------------------------

-- Pattern: Aggregation + join (max per group)
-- Technique: GROUP BY id to get MAX(salary), then join back
-- Time complexity idea: O(N log N) depending on grouping/index

SELECT e.id, e.first_name, e.last_name, e.department_id, e.salary
FROM ms_employee_salary e
JOIN (
    SELECT id, MAX(salary) AS max_salary
    FROM ms_employee_salary
    GROUP BY id
) m
ON e.id = m.id
AND e.salary = m.max_salary
ORDER BY e.id;
