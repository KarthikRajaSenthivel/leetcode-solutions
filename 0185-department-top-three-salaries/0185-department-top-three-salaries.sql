SELECT Department, Employee, Salary FROM
(
    SELECT d.Name AS Department, e.Name AS Employee, e.Salary,
           DENSE_Rank() OVER (PARTITION BY d.Name ORDER BY e.Salary DESC) AS Ranking
    FROM Employee e JOIN Department d ON e.DepartmentId = d.ID
) res WHERE Ranking <= 3;