create database EmployeeDb;
go;-- this ensure the that sql will execute the statement/query above and then jump to nect statement/ query after
use EmployeeDb;
go;
create schema Emp; --- Schema can be an extra layer for all your DB objects
go;
create table Emp.Department(
ID int Identity(1,1),
Name varchar(max) not null,
Location varchar(max) not null,
Primary key (Id)
)

insert into Emp.Department(Name, Location) values('Tina','Smith','102-29-3810')
insert into Emp.Department(Name, Location) values('Sales','Houston')
insert into Emp.Department(Name, Location) values('Tech','San Antonio')
select * from Emp.Department
--truncate table Emp.Department

create table Emp.Employee(
Id int Identity(1,1),
FirstName varchar(max) not null,
LastName varchar(max) not null,
SSN varchar(max) not null,
DeptId int,
Primary key (Id),
foreign key (DeptId) references Emp.Department(Id), 
)

select * from Emp.Employee
insert into Emp.Employee(FirstName, LastName, SSN, DeptId) values('Tina','Smith','102-29-3810', 1)
insert into Emp.Employee(FirstName, LastName, SSN, DeptId) values('Jerry','West','658-85-7619', 2)
insert into Emp.Employee(FirstName, LastName, SSN, DeptId) values('Bill','Walter','794-36-5112', 2)
--Drop table Emp.Employee

create table Emp.EmpDetails(
ID int Identity(1,1),
EmployeeID int,
Salary money not null,
Address1 varchar(max) not null,
Address2 varchar(max),
City varchar(max) not null,
State varchar(max) not null,
Country varchar(max) not null,
Primary key (ID),
foreign key (EmployeeID) references Emp.Employee(Id), 
)

select * from Emp.EmpDetails
insert into Emp.EmpDetails(EmployeeID, Salary, Address1, City, State, Country) values(1,80000,'3137 Michaelwood Dr','Atlanta','Georgia','USA')
insert into Emp.EmpDetails(EmployeeID, Salary, Address1, City, State, Country) values(2,75000,'5058 Squall Valley Rd','Mission','Texas','USA')
insert into Emp.EmpDetails(EmployeeID, Salary, Address1, City, State, Country) values(3,70000,'1254 Rocky Lane','Denver','Colorado','USA')
--truncate table Emp.EmpDetails
--drop table Emp.EmpDetails




Select * -- list all employees in maketing
from Emp.Employee 
Where DeptId IN (Select ID From Emp.Department Where Name = 'Marketing')



SELECT SUM(Salary) As TotalMarketingSal -- adding total salary of Marketing
FROM Emp.EmpDetails
WHERE EmployeeId IN (Select Id From Emp.Employee Where ID = 1)



SELECT DeptId, COUNT(*) AS total -- total people in each department, department 3 has 0 people
FROM Emp.Employee
GROUP BY DeptId;



SELECT Count(DeptId) As MarketingCount -- total of Department 1, marketing individual
From Emp.Employee
Where DeptId = 1



SELECT Count(DeptId) As SalesCount -- total of Department 2, marketing individual
From Emp.Employee
Where DeptId = 2



SELECT Count(DeptId) As TechCount -- total of Department 3, tech individual
From Emp.Employee
Where DeptId = 3




UPDATE Emp.EmpDetails -- changing Tina Smith Salary to 90000
SET Salary = 90000
Where EmployeeId IN (Select Id From Emp.Employee Where FirstName = 'Tina')
Select * from Emp.EmpDetails






