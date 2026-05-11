/*select Department, Employee, Salary from
(
    select d.name as Department, e.name as Employee, e.salary as Salary, rank() over (partition by d.id order by e.salary desc) as r
    from Employee e
 join
    Department d 
    on e.departmentId  = d.id 
) temp
where r = 1*/
WITH temp AS (
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary AS Salary,
           RANK() OVER (
               PARTITION BY d.id
               ORDER BY e.salary DESC
           ) AS r
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM temp
WHERE r = 1;