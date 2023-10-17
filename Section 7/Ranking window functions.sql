-- employees have more vacation hours than average for their job title
SELECT
  E1.BusinessEntityID,
  E1.LoginID,
  E1.JobTitle,
  E1.VacationHours,
  ROW_NUMBER() OVER( ORDER BY E1.LoginID) AS [RowCount]
FROM HumanResources.Employee E1

---Rank employee by vacation hours in the department
SELECT
  E1.BusinessEntityID,
  E1.LoginID,
  E1.JobTitle,
  E1.VacationHours,
  RANK() OVER( PARTITION BY E1.JobTitle ORDER BY VacationHours ) AS [Rank]
FROM HumanResources.Employee E1

UPDATE HumanResources.Employee SET VacationHours = 61
WHERE LoginID = 'adventure-works\deborah0'

---Rank employee by vacation hours in the department
SELECT
  E1.BusinessEntityID,
  E1.LoginID,
  E1.JobTitle,
  E1.VacationHours,
  DENSE_RANK() OVER( PARTITION BY E1.JobTitle ORDER BY VacationHours ) AS [Rank]
FROM HumanResources.Employee E1

-- Finding the employees with the most vacation hours for each job title
WITH CTE
AS
(
  SELECT
  E1.BusinessEntityID,
  E1.LoginID,
  E1.JobTitle,
  E1.VacationHours,
  DENSE_RANK() OVER( PARTITION BY E1.JobTitle ORDER BY VacationHours ) AS [Rank]
  FROM HumanResources.Employee E1
)
SELECT * FROM CTE where [rank]=1