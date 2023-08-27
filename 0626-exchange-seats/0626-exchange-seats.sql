# Write your MySQL query statement below
# SELECT CASE
#            WHEN s.id % 2 <> 0 AND s.id = (SELECT COUNT(*) FROM Seat) THEN s.id
#            WHEN s.id % 2 = 0 THEN s.id - 1
#            ELSE
#                s.id + 1
#            END AS id,
#        student
# FROM Seat AS s
# ORDER BY id；
SELECT
ROW_NUMBER() OVER(order by IF(MOD(id, 2) = 0, id-1, id+1) ) as id,
student
FROM seat;