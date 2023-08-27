# Write your MySQL query statement below
select department, employee, salary
from (
    select e.name as employee, e.salary as salary, d.name as department, 
        dense_rank() over (partition by d.id order by e.salary desc) as ranking
    from Employee as e join Department as d
    on e.departmentId = d.id
) as Temp
where ranking <=3;
