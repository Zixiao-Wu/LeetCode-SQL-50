# Write your MySQL query statement below
select a.machine_id,
  round(
    (select avg(a1.timestamp) from Activity as a1 where a1.activity_type = 'end' and a1.machine_id = a.machine_id)
    -
    (select avg(a2.timestamp) from Activity as a2 where a2.activity_type = 'start' and a2.machine_id = a.machine_id) 
  , 3) as processing_time
from Activity as a
group by a.machine_id;

/* another simpler
SELECT A1.machine_id, 
  ROUND(AVG(A2.timestamp - A1.timestamp),3) As processing_time 

FROM Activity A1, Activity A2 

WHERE A1.machine_id = A2.machine_id 
  AND A1.process_id = A2.process_id 
  AND A1.timestamp < A2.timestamp 
  
GROUP BY A1.machine_id;
*/
