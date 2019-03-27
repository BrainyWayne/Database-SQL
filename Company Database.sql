
CREATE DATABASE COMPANY

USE COMPANY

CREATE TABLE DEPARTMENT(
Dname varchar(15) not null,
Dnumber int not null,
Mgr_ssn char (9) not null,
Mgr_start_date date,
PRIMARY KEY (Dnumber),
UNIQUE  (Dname)
);



CREATE TABLE EMPLOYEE(
Fname varchar(15) not null,
Minit char,
Lname varchar(15) not null,
Ssn char(9) not null,
Bdate date,
Address varchar(30),
Sex char,
Salary Decimal(10,2),
Super_ssn char(9) not null,
Dno int,
PRIMARY KEY (Ssn),
);



CREATE TABLE DEPT_LOCATION(
Dnumber int,
Dlocation varchar(15),
PRIMARY KEY (Dnumber,Dlocation)
);


CREATE TABLE PROJECT(
Pname varchar(15),
Pnumber int not null,
Ploction varchar(15),
Dnum int not null,
PRIMARY KEY (Pnumber)
);


CREATE TABLE WORKS_ON(
Essn char(9) not null,
Pno int not null,
Hours decimal(3,1) not null,
PRIMARY KEY (Essn,Pno)
);


CREATE TABLE DEPENDENT(
Essn char(9) not null,
Dependent_name varchar(15) not null,
Sex char,
Bdate date,
Relationship varchar(9),
PRIMARY KEY (Essn, Dependent_name)
);


ALTER TABLE DEPARTMENT
ADD
UNIQUE(Dname),
FOREIGN KEY(Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
;

ALTER TABLE DEPT_LOCATION
ADD
FOREIGN KEY(Dnumber) REFERENCES DEPARTMENT (Dnumber)
;

ALTER TABLE PROJECT
ADD
UNIQUE(Pname),
FOREIGN KEY(Dnum) REFERENCES DEPARTMENT (Dnumber)
;

ALTER TABLE WORKS_ON
ADD
FOREIGN KEY(Pno) REFERENCES PROJECT (Pnumber)
;
ALTER TABLE DEPENDENT
ADD
FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn)
;


INSERT INTO EMPLOYEE
(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) Values
('John','B','Smith',123456789,'1965-01-09','731 Fondren,Houston,TX','M',30000,333445555,5),
('Franklin','T','Wong',333445555,'1955-12-08','638 Voss,Houston,TX','M',40000,888665555,5),
('Alicia','J','Zelaya',999887777,'1965-01-19','3321 Castle,Spring,TX','F',25000,987654321,5),
('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry,Bellaire,TX','F',43000,888665555,4),
('Ramesh','K','Narayan',666688444,'1962-01-09','975 Fire Oak,Humble,TX','M',38000,333445555,5),
('Joyce','A','English',453453453,'1972-07-31','5631 Rice,Houston,TX','F',25000,333445555,5),
('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas,Houston,TX','M',25000,987654321,4),
('James','E','Borg',888665555,'1937-11-10','450 Stone,Houston,TX','M',55000,456787665,1)
;

INSERT INTO DEPARTMENT
(Dname,Dnumber,Mgr_ssn,Mgr_start_date)Values
('Research',5,333445555,'1988-05-22'),
('Administration',4,987654321,'1988-01-01'),
('Headquarters',1,888665555,'1981-06-19')
;
INSERT INTO DEPT_LOCATION
(Dnumber,Dlocation)Values
(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(5,'Houston')
;

INSERT INTO PROJECT
(Pname,Pnumber,Ploction,Dnum)Values
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4)
;

INSERT INTO WORKS_ON
(Essn,Pno,Hours)Values
(123456789,1,32.5),
(123456789,2,7.5),
(666884444,3,40.0),
(453453453,1,20.0),
(453453453,2,20.0),
(333445555,2,10.0),
(333445555,3,10.0),
(333445555,10,10.0),
(333445555,20,10.0),
(999887777,30,30.0),
(999887777,10,10.0),
(987987987,10,35.0),
(987987987,30,5.0),
(987654321,30,20.0),
(987654321,20,15.0),
(888665555,20,10.0)
;

INSERT INTO DEPENDENT(Essn,Dependent_name,Sex,Bdate,Relationship)Values
(333445555,'Alice','F','1986-04-05','Daughter'),
(333445555,'Theodora','M','1986-04-05','Son'),
(333445555,'Joy','F','1986-04-05','Spouse'),
(987654321,'Abner','M','1986-04-05','Spouse'),
(123456789,'Michael','M','1986-04-05','Son'),
(123456789,'Alice','F','1986-04-05','Daughter'),
(123456789,'Elizabeth','F','1986-04-05','Spouse')
;


SELECT * FROM EMPLOYEE

SELECT Bdate
FROM EMPLOYEE
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';





--Query 1
select bdate,address
from EMPLOYEE
where fname = 'John' AND Minit = 'B' AND Lname = 'Smith';


--Query 2
select fname,lname,address
from EMPLOYEE,DEPARTMENT
where Dname='Research' AND Dnumber = Dno;

--Query 3
select pnumber,dnum,lname,bdate,address
from PROJECT,DEPARTMENT,EMPLOYEE
where Dnum=Dnumber AND Mgr_ssn=Ssn AND Ploction='Stafford';

--Query 4
select E.fname,E.lname,S.fname,S.lname
from EMPLOYEE AS E,EMPLOYEE AS S
where E.Super_ssn = S.Ssn;

--Query 5
select ssn
from EMPLOYEE

--Query 6
select Ssn,Dname
from EMPLOYEE,DEPARTMENT

--Query 7
select * 
from EMPLOYEE
where Dno = 5;

--Query 8
select * 
from EMPLOYEE,DEPARTMENT
where Dname='Research' AND  Dno = Dnumber;

--Query 9
select * 
from EMPLOYEE,DEPARTMENT;

--Try 
select SUM(salary),MAX(salary),MIN(salary),AVG(salary)
from EMPLOYEE;

--Query 10
select SUM(salary),MAX(salary),MIN(salary),AVG(salary)
from (EMPLOYEE JOIN DEPARTMENT ON Dno=Dnumber)
where Dno=Dnumber AND Dname='Research';

--Query 11
select COUNT(*)
from EMPLOYEE;

--Query 12
select COUNT(*)
from EMPLOYEE,DEPARTMENT
where Dno=Dnumber AND Dname='Research';

--Query 13
select Dno,COUNT(*),AVG(salary)
from EMPLOYEE
Group By Dno;

--Query 14
select pnumber,pname,COUNT(*)
from PROJECT,WORKS_ON
where Pnumber=Pno
Group By Pnumber,Pname;

--Query 15
select pnumber,pname,COUNT(*)
from PROJECT,WORKS_ON
where Pnumber = Pno
Group By Pnumber,Pname
Having COUNT(*) > 2;

