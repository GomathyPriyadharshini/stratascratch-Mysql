/*
Given a single column of numbers, consider all possible permutations of two numbers with replacement, assuming that pairs of numbers (x,y) and (y,x) are two different permutations. Then, for each permutation, find the maximum of the two numbers.

Output three columns: the first number, the second number and the maximum of the two.

-- Pattern: Self Join / Cartesian Product
-- Technique: CROSS JOIN with row-wise comparison using GREATEST
-- Time complexity idea: O(n²) due to generating all number permutations
*/

SELECT
    t1.number AS number1,
    t2.number AS number2,
    GREATEST(t1.number, t2.number) AS max_number
FROM deloitte_numbers t1
CROSS JOIN deloitte_numbers t2
ORDER BY number1, number2;
