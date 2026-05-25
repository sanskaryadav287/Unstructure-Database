use Student;

create table employees(
id int,
name varchar(50),
department varchar(50),
salary int );

insert into employees(id,name,department,salary) values
(1,"Alice","HR",50000),
(2,"Bob","HR",60000),
(3,'Charlie','IT',70000),
(4,'David',"IT",80000),
(5,"Eve","HR",55000);

select*from employees;


/* Q1. Rank the employees based on their salary within each department . */
select 
id,name,department,salary,
rank()over(partition by department order by salary desc) as Rank_salary
from employees;

/* Q2. CAlculate the average salary for each department and display it along with each employees detail . */
select 
id,name,department,salary,
avg(salary) over (partition by department) as avg_salary
from employees;

/* Q3. List employees with their salaries and the maximum salary in their department . */
select 
id,name,department,salary,
max(salary) over(partition by department) as max_salary
from employees;

/* Q4. Find the difference between each employees salary and the avg salary of their department.*/
select
id,name,department,salary,
salary-avg(salary) over(partition by department) as salary_diff
from employees;