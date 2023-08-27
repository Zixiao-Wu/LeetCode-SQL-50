# Write your MySQL query statement below
select customer_id, count(visit_id) as count_no_trans
from Visits as V
where not exists 
  (select transaction_id
  from Transactions as T
  where V.visit_id = T.visit_id)
group by customer_id;