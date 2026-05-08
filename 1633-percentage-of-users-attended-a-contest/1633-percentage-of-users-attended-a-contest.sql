# Write your MySQL query statement below
select contest_id,ROUND(COUNT(user_id) * 100 /
(SELECT COUNT(*) FROM Users),2) as percentage from Users u JOIN Register r using (user_id) group by contest_id order by percentage DESC,contest_id