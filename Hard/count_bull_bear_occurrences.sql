/*
Problem Statement:
Find the number of times the exact words 'bull' and 'bear' appear in the contents column.

Requirements:
- Count all occurrences, including multiple appearances within the same row.
- Matching should be case-insensitive.
- Count only exact words.
- Do not count substrings such as 'bullish' or 'bearing'.

Output:
- word ('bull' or 'bear')
- corresponding occurrence count

Pattern:
String Tokenization + Recursive CTE

Technique:
1. Split each contents value into individual words using a recursive CTE.
2. Extract the nth word during each recursion step.
3. Convert words to lowercase for case-insensitive matching.
4. Filter for exact matches ('bull', 'bear').
5. Aggregate counts by word.

Time Complexity Idea:
- Let N be the number of rows and W be the average number of words per row.
- Recursive tokenization processes each word once.
- Overall Time Complexity: O(N × W)

Solution:
*/

WITH RECURSIVE cte AS (
    SELECT
        1 AS n,
        contents,
        LOWER(SUBSTRING_INDEX(contents, ' ', 1)) AS word
    FROM google_file_store

    UNION ALL

    SELECT
        n + 1,
        contents,
        LOWER(
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(contents, ' ', n + 1),
                ' ',
                -1
            )
        ) AS word
    FROM cte
    WHERE n < LENGTH(contents) - LENGTH(REPLACE(contents, ' ', '')) + 1
)

SELECT
    word,
    COUNT(*) AS cnt
FROM cte
WHERE word IN ('bull', 'bear')
GROUP BY word;
