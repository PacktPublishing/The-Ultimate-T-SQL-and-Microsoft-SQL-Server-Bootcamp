-- employees who have more vacation available than the average
SELECT
  BusinessEntityID,
  LoginID,
  JobTitle,
  VacationHours
FROM 
  HumanResources.Employee
WHERE VacationHours > (SELECT AVG(VacationHours)
					   FROM HumanResources.Employee)

-- employees have more vacation hours than average for their job title
SELECT
  E1.BusinessEntityID,
  E1.LoginID,
  E1.JobTitle,
  E1.VacationHours,
  Sub.AverageVacation --Drawn from the subquery
FROM HumanResources.Employee E1
JOIN (SELECT
      JobTitle,
      AVG(VacationHours) AverageVacation
      FROM HumanResources.Employee E2
      GROUP BY JobTitle) Sub
ON E1.JobTitle = Sub.JobTitle
WHERE E1.VacationHours > Sub.AverageVacation AND E1.JobTitle = 'Janitor' 
ORDER BY E1.JobTitle