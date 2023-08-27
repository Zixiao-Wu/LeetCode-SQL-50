# Write your MySQL query statement below
select
(select distinct Salary 
from Employee order by salary desc 
limit 1 offset 1) 
as SecondHighestSalary;

# select ifnull(max(salary),null) as secondhighestsalary 
# from employee 
# where salary < some(select max(salary) from employee);

# Write your MySQL query statement below
# SELECT MAX(salary) SecondHighestSalary 
# FROM Employee 
# WHERE salary < (SELECT MAX(salary) FROM Employee);