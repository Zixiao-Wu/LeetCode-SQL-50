# Write your MySQL query statement below
select unique_id, name
from Employees as E1 left join EmployeeUNI as E2 on E1.id = E2.id;