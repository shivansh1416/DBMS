CREATE DATABASE company;
use company;
create table employee(
eno char(4) primary key,
ename varchar(50) not null,
job_type varchar(50) not null,
supervisioneno char(4) ,
hire_date date not null,
Dno Integer ,
comission decimal(10,2),
salary decimal(7,2)
);

create table department(
    dno integer primary key,
    dname varchar(50),
    location varchar(50) default "new delhi"
);

insert into department(dno,dname,location) values(1,it,delhi); 

INSERT INTO department (dno, dname, location)
VALUES 
  (10, 'Sales', 'Mumbai'),
  (20, 'Marketing', 'Delhi'),
  (30, 'Finance', 'Chennai'),
  (40, 'Human Resources', 'Kolkata'),
  (50, 'Research and Development', 'Bangalore'),
  (60, 'Operations', 'Hyderabad'),
  (70, 'Customer Service', 'Ahmedabad'),
  (80, 'Information Technology', 'Pune'),
  (90, 'Quality Assurance', 'Jaipur'),
  (100, 'Legal', 'Surat'),
  (110, 'Product Management', 'Lucknow'),
  (120, 'Facilities', 'Nagpur'),
  (130, 'Supply Chain Management', 'Gurgaon'),
  (140, 'Purchasing', 'Patna'),
  (150, 'Public Relations', 'Indore'),
  (160, 'Training and Development', 'Thane'),
  (170, 'Administration', 'Bhopal'),
  (180, 'Business Development', 'Visakhapatnam'),
  (190, 'Accounting', 'Agra');
  

INSERT INTO employee (eno, ename, job_type, supervisioneno, hire_date, salary, comission, dno) VALUES 
(79, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10),
(7905, 'PAUL', 'MANAGER', 7839, '1984-05-23', 3000, NULL, 10),
(7906, 'JACKSON', 'MANAGER', 7839, '1984-05-23', 3500, NULL, 20),
(7907, 'LUCAS', 'CLERK', 7905, '1985-01-13', 1200, NULL, 10),
(7908, 'JONES', 'CLERK', 7906, '1985-03-15', 1300, NULL, 20),
(7909, 'MARSHALL', 'MANAGER', 7839, '1985-03-15', 4000, NULL, 30),
(7910, 'BROWN', 'CLERK', 7909, '1985-03-15', 1400, NULL, 30);

-- Queries

1. SELECT eno,ename,job_type,supervisioneno,hire_date,dno,comission,salary from employee;
2. SELECT distinct (job_type) from employee;
3. SELECT concat(ename,",",job_type) from employee;
4. SELECT concat(eno,",",ename,",",job_type,",",supervisioneno,",",hire_date,",",dno,",",comission,",",salary) "THE_OUTPUT" from employee;
5. SELECT ename,salary from employee where salary>2850;
6. SELECT ename,dno from employee where eno=79;
7. SELECT ename,salary from employee where salary<1500 or salary>2850;
8. SELECT ename,dno from employee where dno=10 or dno=30 order by ename;
9. SELECT ename,hire_date from employee where year(hire_date)>1981;
10. SELECT ename,job_type from employee where supervisioneno is NULL;
11. SELECT ename,salary,comission from employee where comission is not NULL;
12. SELECT * from employee order by salary desc;
13. SELECT ename from employee where ename LIKE "__A%";
14. SELECT ename from employee where ename LIKE "%R%R%" or ename LIKE "%A%A%" and (dno = 30 OR supervisioneno=7788);
15.  SELECT ename,salary,comission from employee where comission>1.05*sala
ry;
16. SELECT concat(curdate() , "," ,dayname(now()));
-- 17. SELECT ename, hire_date from employee , (DATE_ADD(MONTHS,6,hire_date)) "SALARY_REVIEW_DATE" from employee;
18. SELECT ename,(TIMESTAMPDIFF(MONTH,hire_date,curdate())) "Months from hire" FROM (EMPLOYEE NATURAL JOIN DEPARTMENT) where dname="SALES"; 
19. SELECT concat(ename," earns ",salary," monthly but wants ",3*salary) "DREAM SALARY" from employee;
-- 20. SELECT concat(UPPER(LEFT(ename,1)),LOWER(RIGHT(ename,LENGTH(ename-1))
-- ) "names" from employee where (ename LIKE "J%" or ename LIKE "A%" OR ename L
-- IKE "M%");
21.  SELECT ename,hire_date,(dayname(hire_date)) "Hire Day" from employee;
22. SELECT ename,dname,dno from (EMPLOYEE NATURAL JOIN DEPARTMENT);
23. SELECT distinct(job_type) from employee where dno=30;
24. SELECT ename,dname from (EMPLOYEE NATURAL JOIN DEPARTMENT) WHERE ename LIKE "%A%";
25.  SELECT ename,job_type,dno,dname from (EMPLOYEE NATURAL JOIN DEPARTMENT) where location LIKE "DELHI";
-- 26.  SELECT t1.ename "EMPLOYEE",t2.ename "SUPERVISOR" from EMPLOYEE t1,EMPLOYEE t2 where t1.supervisioneno=t2.eno;
27.  SELECT t1.ename,t1.dno,t1.salary from employee t1,employee t2 where t1.dno=t2.dno and t1.salary=t2.salary and t1.eno<>t2.eno and t2.comission is not null;
28. SELECT ename,(repeat("*",salary/100)) "SALARY" from employee;
29. SELECT ename,(repeat("*",salary/100)) "SALARY" from employee;
30.  select job_type,count(*) "NUMBER OF EMPLOYEES" from employee group by job_type;
31. select count(DISTINCT(supervisioneno)) "NUMBER OF SUPERVISORS" from employee;
32.  select dname,location,count(*) "NUMBER OF EMPLOYEES",AVG(salary) "AVERAGE SALARY" from employee natural join department group by employee.dno;
33.  select ename,hire_date from employee where dno=(select dno from emplo
yee where ename like "Blake");
34.  select eno,ename from employee where salary>(select AVG(salary) from employee);
35. select eno,ename from employee where dno in (select dno from employee
where ename LIKE "%T%");
36. select ename,salary from employee where supervisioneno=(select eno from employee where ename LIKE "King");
37. select dno,ename,job_type from employee where dno=(select dno from de
partment where dname LIKE "SALES");
38.  select ename,dname from employee natural join department where TIMESTAMPDIFF(year,hire_date,curdate())>20;
39. select location,count(*) "NUMBER OF DEPARTMENTS" from department group by location;
40.select dname from employee natural join department group by dno having count(*)>20;