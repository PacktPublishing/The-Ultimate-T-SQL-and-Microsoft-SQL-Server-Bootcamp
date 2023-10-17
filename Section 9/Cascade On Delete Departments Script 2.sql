SELECT * FROM Employees;
SELECT * FROM Departments;

DELETE FROM Departments
WHERE ID = 1;

Alter table Employees drop constraint FK__Employees__Depar__267ABA7A;

Alter table Employees
add constraint FK__Employees__Depar__267ABA7A
foreign key (DepartmentID) references Departments(Id) on delete cascade;
