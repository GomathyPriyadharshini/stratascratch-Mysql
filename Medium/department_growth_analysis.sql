/*
The workforce planning team is analyzing department growth since the company's expansion, focusing on teams that have grown substantially.

For each department with 5 or more employees hired after 2020, return the name, headcount, total payroll, and average salary.

-- Pattern: Aggregate Filtering
-- Technique: GROUP BY with aggregate functions and HAVING clause
-- Time complexity idea: O(n) table scan with grouping by department
*/

SELECT
    department,
    COUNT(*) AS headcount,
    SUM(salary) AS total_payroll,
    AVG(salary) AS avg_salary
FROM techcorp_workforce
WHERE YEAR(joining_date) > 2020
GROUP BY department
HAVING COUNT(*) >= 5;
