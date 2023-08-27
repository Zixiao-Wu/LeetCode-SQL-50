# Write your MySQL query statement below
SELECT round(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i1
WHERE EXISTS (
    SELECT 1
    FROM Insurance a, Insurance b
    WHERE a.tiv_2015 = b.tiv_2015
    AND a.pid != b.pid
    AND a.tiv_2015 = i1.tiv_2015
)
AND NOT EXISTS (
    SELECT 1
    FROM Insurance a, Insurance b
    WHERE a.lat = b.lat
    AND a.lon = b.lon
    AND a.pid != b.pid
    AND a.pid = i1.pid
);
