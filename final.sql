use mydb;
create table Employee
(EmpID varchar(10) primary key,
Ename varchar(20),
Designation varchar(20),
Hiredate date,
Basicsal float,
DepID smallint);

insert into Employee(EmpID,Ename,Designation,Hiredate,Basicsal,DepId)
values('E101','Srushti nakil','HR','2021-08-07',40000,2),
('E102','Sujay Kubal','project head','2020-08-07',55000,4),
('E103','Tanvi shinde','Manager','2022-07-07',53000,5),
('E104','dhruvi Sharma','Employee','2022-08-04',35000,3),
('E105','Abhiv Rathod','COE','2018-08-07',80000,1);

select * from Employee;

alter table Employee add DA float,add HRA float,add PF float,add Grosssalary float,add Netsalary float;

update Employee
set
DA=0.8*Basicsal, 
HRA =0.12*Basicsal,
PF=0.1*Basicsal;
set sql_safe_updates=0;

update Employee
set Grosssalary=Basicsal+DA+HRA+PF;

update Employee
set Netsalary=Grosssalary -PF;
set sql_safe_updates=0;

select Ename,Basicsal from Employee where Netsalary>20000;

select Ename,Designation,Grosssalary from Employee 
where PF>3000;

-- --question 2
select Ename , Basicsal from Employee where Basicsal>=40000 and Basicsal<=50000;


select Ename,Designation from Employee
where Hiredate between '2018-06-30' AND '2018-12-31';

select Ename from Employee
where DepID in(1,2,4);


select * from Employee
order by EmpID asc;

select * from Employee
order by Basicsal desc;

select Ename,DepID from Employee
where Ename like 's%';

select Ename,DepID from Employee
where Ename like '%s%';

select Ename,DepID from Employee
where Ename like '%s';

insert into Employee (EmpID,Ename,Designation,Hiredate,Basicsal,DepId)
values('E106','Suhas','emp','2021-08-14',30500,2);

select Ename from Employee
where Ename like 'a%' or Ename like'b%';

select Ename from Employee
where Ename like '%ann%' or Ename like'%anne%';

insert into Employee (EmpID,Ename,Designation,Hiredate,Basicsal,DepId)
values('E107','anna','analyst','2021-08-09',30550,1);

-- drop table Employee;

select sum(Basicsal) as TotalSalary from Employee;

select avg(Basicsal) as AvgSalary from Employee;

select max(Basicsal) as MaxSalary from Employee;

select min(Basicsal) as MinSalary from Employee;


SELECT SUM(Basicsal) AS TOTAL_SALARY FROM Employee
WHERE Basicsal > 30000;

select count(Designation)from Employee
where Designation='Manager';

select count(EmpID)from Employee;

SELECT DepID, COUNT(*), AVG(Basicsal)
FROM Employee
GROUP BY DepID;

select DepID,sum(Basicsal) as TOTAL_SALARY
from Employee
group by DepID;


SELECT DepID, COUNT(EmpID) AS NO_OF_EMPLOYEES
FROM Employee
GROUP BY DepID
HAVING COUNT(EMPID) >= 5
ORDER BY COUNT(EMPID) DESC;

SELECT DepID, SUM(Basicsal) AS Total_Salary
FROM EMPLOYEE
GROUP BY DepID
HAVING SUM(Basicsal) > 100000;
