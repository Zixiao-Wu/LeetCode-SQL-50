# Write your MySQL query statement below
# WITH Friends AS (
#     SELECT requester_id AS person_id, accepter_id AS friend_id
#     FROM RequestAccepted
#     UNION ALL
#     SELECT accepter_id AS person_id, requester_id AS friend_id
#     FROM RequestAccepted
# )

# SELECT person_id AS id, COUNT(DISTINCT friend_id) AS num
# FROM Friends
# GROUP BY person_id
# ORDER BY num DESC
# LIMIT 1;

select id , count(id) as num
from (

    select requester_id as id from requestaccepted
    union all
    select accepter_id from requestaccepted
)s
group by id
order by count(id) desc limit 1 ;