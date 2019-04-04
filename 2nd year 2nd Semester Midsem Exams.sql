use COMPANY

--2nd year Second Semester Mid-Semester Exams
--Using the company database

--Number 1
select SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary) 
from EMPLOYEE e INNER JOIN DEPARTMENT d
on d.Dname = 'Research' and e.Dno = d.Dnumber

--Number 2
create view MYVIRTUAL(ssn, fname, lname, dno, sex, wages, salary)
as select e.ssn, e.fname, e.lname, e.Dno, e.sex, w.Hours * 50, e.Salary
from EMPLOYEE e, WORKS_ON w

--Number 3
UPDATE EMPLOYEE
SET Lname = 'Zelawa'
WHERE Ssn  = 999887777

--Number 4
insert into MYVIRTUAL(dno, lname,fname,ssn) 
values(5, 'Chinoke', 'John', 888993333);

--Numberr 5
select CONCAT(fname, ' ', lname) as Full_Name, w.Hours * 50 as Wages
from EMPLOYEE e JOIN WORKS_ON w
on e.Ssn = w.Essn 

