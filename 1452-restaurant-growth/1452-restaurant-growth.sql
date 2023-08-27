#Write your MySQL query statement below
select visited_on, amount, round(amount/7, 2) as average_amount
from (
    select distinct visited_on, sum(amount) over(order by visited_on RANGE BETWEEN INTERVAL 6 DAY   PRECEDING AND CURRENT ROW) as amount, 
    min(visited_on) OVER() as 1st_date
    from Customer
) as t
where visited_on >= 1st_date +6;

# SELECT distinct visited_on,
#     SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount
#     ROUND(sum(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) / 7, 2) AS average_amount,
# FROM Customer
# where visited_on >= (select min(visited_on) from Customer) +6
# ORDER BY visited_on;