WITH base AS (
  -- Step 1: Filter out rows where people >= 100
  SELECT id, visit_date, people
  FROM Stadium
  WHERE people >= 100
),
consecutive_segments AS (
  -- Step 2: Assign a segment_id to each row
  -- The trick (id - ROW_NUMBER) ensures that consecutive ids share the same segment
  SELECT
    *,
    id - ROW_NUMBER() OVER (ORDER BY id) AS segment
  FROM base
)
-- Step 3: Keep only rows that belong to segments of length >= 3
SELECT id, visit_date, people
FROM consecutive_segments
WHERE segment IN ( SELECT segment FROM consecutive_segments
  GROUP BY segment
  HAVING COUNT(segment) >= 3
)
ORDER BY id;
