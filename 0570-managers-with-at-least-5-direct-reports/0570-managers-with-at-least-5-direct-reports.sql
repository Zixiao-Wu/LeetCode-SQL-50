# Write your MySQL query statement below
select e1.name
from Employee as e1, (
    select managerId, count(id) as count
    from Employee as e2
    group by managerId
    having count(id) >=5
) as e3
where e1.id = e3.managerId;


# SELECT name 
# FROM Employee 
# WHERE id IN 
# (SELECT DISTINCT managerId FROM Employee 
# GROUP BY managerId 
# HAVING managerId IS NOT NULL and COUNT(managerId)>=5);
