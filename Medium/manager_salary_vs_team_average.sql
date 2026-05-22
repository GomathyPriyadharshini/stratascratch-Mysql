/*
Write a query to get the list of managers whose salary is less than twice the average salary of employees reporting to them.

For these managers, output their ID, salary and the average salary of employees reporting to them.

-- Pattern: Self Join Aggregation
-- Technique: Join hierarchy table with employee table twice and filter using HAVING
-- Time complexity idea: O(n) joins with grouping by manager
*/

SELECT
    t1.manager_empl_id AS manager_id,
    t2.salary,
    AVG(t3.salary) AS empl_avg_salary
FROM map_employee_hierarchy t1
INNER JOIN dim_employee t2
    ON t1.manager_empl_id = t2.empl_id
INNER JOIN dim_employee t3
    ON t1.empl_id = t3.empl_id
GROUP BY t1.manager_empl_id, t2.salary
HAVING t2.salary < AVG(t3.salary) * 2;
