use Student;

DELIMITER //

create function square_num(n INT)
returns INT
deterministic
begin 
  return n*n;
End //
delimiter ;

select square_num(5);



DELIMITER //
create function squaree_num(n int)
returns float
deterministic
begin 
  return n*n;
End //
delimiter ;
select squaree_num(6);


create function square_num2(n int)
returns int
deterministic
return n*n;

select square_num2(5);


/* 2. Check even and odd */
DELIMITER //

CREATE FUNCTION check_even_odd(n INT)
RETURNS VARCHAR(50)
DETERMINISTIC

BEGIN
    IF n % 2 = 0 THEN
        RETURN 'Even';
    ELSE
        RETURN 'Odd';
    END IF;
END //

DELIMITER ;



## 2nd method of function creation ##


CREATE FUNCTION chk_even_odd(n INT)
RETURNS VARCHAR(10)
DETERMINISTIC
RETURN IF(n % 2 = 0, 'Even', 'Odd');


/* create function for simpple intrest */
CREATE FUNCTION simple_interest(p FLOAT, r FLOAT, t FLOAT)
RETURNS FLOAT
DETERMINISTIC
RETURN (p * r * t) / 100;

SELECT simple_interest(1000, 5, 2)as simple_intrest;



/* Create function get full name */

CREATE FUNCTION full_name(first_name VARCHAR(20), last_name VARCHAR(20))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN CONCAT(first_name, ' ', last_name);

select full_name("Sanskar","Yadav") as full_name;






/* Function using table data  */
create table employ(
id int,
name varchar(50),
salary int);

insert into employ(id,name,salary) values
(1,"Amit",50000),
(2,"Riya",60000);

## Function to get salary ##
create function get_salary(emp_id int)
returns int
deterministic 
return (select name,salary from employ where id=emp_id);

select get_salary(2);


CREATE FUNCTION get_salari(emp_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN (
    SELECT CONCAT(name, salary)
    FROM employ
    WHERE id = emp_id
);

SELECT get_salari(2);


/* Function to count vowels in a string */




CREATE FUNCTION vowel_count(str VARCHAR(50))
RETURNS INT
DETERMINISTIC
RETURN (
    (LENGTH(str) - LENGTH(REPLACE(LOWER(str),'a',''))) +
    (LENGTH(str) - LENGTH(REPLACE(LOWER(str),'e',''))) +
    (LENGTH(str) - LENGTH(REPLACE(LOWER(str),'i',''))) +
    (LENGTH(str) - LENGTH(REPLACE(LOWER(str),'o',''))) +
    (LENGTH(str) - LENGTH(REPLACE(LOWER(str),'u','')))
);

select vowel_count("AEIOUAEIOU");