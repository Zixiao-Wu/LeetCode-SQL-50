# Write your MySQL query statement below
-- gogogo--
select id
from Weather as W1 
where W1.temperature > 
  (select W2.temperature 
  from Weather as W2
  where datediff(W1.recordDate, W2.recordDate) = 1);