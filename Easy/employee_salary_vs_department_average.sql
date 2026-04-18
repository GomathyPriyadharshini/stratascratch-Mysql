-- Problem:
-- Compare each employee's salary with the average salary of the corresponding department.
-- Output the department, first name, and salary of employees along with the average salary of that department.

-- Pattern:
-- Aggregation with window function (per-group calculation without collapsing rows)

-- Technique:
-- Use AVG() as a window function with PARTITION BY department.
-- This calculates the department-wise average while keeping each employee row intact.

-- Time complexity idea:
-- O(N log N) due to partitioning/sorting for window function


-- Solution:

SELECT department,
       first_name,
       salary,
       AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employee;
