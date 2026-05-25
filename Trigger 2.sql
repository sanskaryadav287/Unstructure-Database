use sakila;

create table employees(
emp_id int primary key,
name varchar(20),
department varchar(50));

create table deleted_employees_log(
log_id int auto_increment primary key,
emp_id int,
name varchar(90),
department varchar(90),
deleted_at datetime);

delimiter // 
create trigger after_employee_delete
after delete on employees
for each row
begin 
insert into deleted_employees_log(emp_id,name,department,deleted_at) values 
(old.emp_id,old.name,old.department,now());
end //

delimiter ;

 insert into employees(emp_id,name,department) values 
 (1,"Alice","HR"),
 (2,"Bob","IT"),
 (3,"Charlie","Finance");
 
 select * from employees ; 
 select * from deleted_employees_log;
 
delete from employees where emp_id=1;



create table empp(
emp_id int primary key,
name varchar(50),
salary decimal(10,2));

create table employee_log(
log_id int auto_increment primary key,
emp_id int,
action varchar(50),
log_time timestamp default current_timestamp);

insert into empp(emp_id,name ,salary)values
(1, "Raju",25000),
(2,"Arun",42000),
(3,"Ramu",36000),
(4,"Ritesh",45000);

select *from empp;

-- Trigger to log INSERT activity

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON empp
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(emp_id, action)
    VALUES (NEW.emp_id, 'Employee Inserted');
END //

DELIMITER ;

INSERT INTO empp(emp_id, name, salary)
VALUES (5, 'Mohit', 38000);

select* from employee_log;

-- Trigger to log SALARY UPDATE activity
DELIMITER //

CREATE TRIGGER salary_change
AFTER UPDATE ON empp
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(emp_id, action)
    VALUES(NEW.emp_id, 'Salary Updated');
END //

DELIMITER ;

-- Salary update entry

UPDATE empp
SET salary = 48000
WHERE emp_id = 2;

select *from employee_log;


----- 3. trigger to convert employeee name to uppercase 
delimiter //
CREATE TRIGGER name_uppercase
before insert ON employees
FOR EACH ROW
begin 
  set new.name = upper(new.name);
END //

DELIMITER ;


select*from employees;
insert into employees(emp_id,name,department) values
(4,"arabh","AAFT");










create table aaa(
emp_id int,
name varchar(50),
salary int );

insert into aaa(emp_id,name,salary) values 
(1,"Rahul",50000);

-- 4. Trigger to prevent negative salary 
delimiter //
create trigger msg_bfore_insert_salary
before insert on aaa
for  each row
begin
  if new.salary<0 then 
  signal sqlstate '45000'
  set message_text = 'Salary cannot be negative' ;
end if ;
end //
delimiter ;

insert into aaa(emp_id,name,salary) values 
(2,"Gopal",45000);
insert into aaa(emp_id,name,salary) values 
(3,"Ajay",20000);
select*from aaa;











drop trigger msg_bfore_insert_salary;

-- 5. Trigger to restrict salary reduction 
delimiter //
create trigger restrict_salary
before update on aaa
for each row
begin
   if new.salary <> salary then
   signal sqlstate '45000'
   set message_text ='can not chnage salary';
end if;
end //
delimiter //

UPDATE aaa
SET salary = 25000
WHERE emp_id = 1;

select *from aaa;



## Trigger to Log Name Changes.


## Set Default Salary.