use COMPANY

--Francis Eshun
--1649617

--Number 1
select PROJECT.Pname, EMPLOYEE.Fname
from PROJECT, EMPLOYEE
where PROJECT.Dnum = EMPLOYEE.Dno

select * from EMPLOYEE

--Number 2
select  e.Fname, e.lname, s.Fname as Supervisor_name, e.Salary
from EMPLOYEE as e, EMPLOYEE as s
where e.Super_ssn = s.Ssn and e.Salary between 29000 and 40000

--Nnumber 3
select fname, lname, FLOOR(DATEDIFF(DAY, bdate, mgr_start_date)/365.25) as Age
from EMPLOYEE, DEPARTMENT
where Mgr_ssn = Ssn

--Number 4
select max(Salary), MIN(Salary), MAX(FLOOR(DATEDIfF(DAY, 2019, bdate)/365.25)) - MIN(FLOOR(DATEDIfF(DAY, 2019, bdate)/365.25)) as diff
from EMPLOYEE, DEPARTMENT
where Dnumber = Dno


--Number 5
create view VIRTUAL
as select fname, lname, ssn, dependent_name
from EMPLOYEE, DEPENDENT as d
where ssn = d.Essn


--Number 6
Create view EMPBONUS
as select fname, lname, ssn, dname, salary * 0.55 as Bonus
from EMPLOYEE, DEPARTMENT
where Dnumber = Dno

--Number 7
select fname, lname, Dependent_name
from EMPLOYEE left join DEPENDENT as d 
on Ssn = d.Essn
