use Student;

-- create a function of squire a number 
create function squire_num(n int)
returns float 
deterministic
return (n*n);

select squire_num(5);

delimiter //
create function squire_num2(n int)
returns int
deterministic
begin
  return (n*n);
end //
delimiter //

select squire_num2(5);

-- create function for return even and odd
create function return_even_odd(n int)
returns varchar(50)
deterministic
begin 
    if n%2=0 then
      return "Even";
	else 
       return "Odd";
	end if;
end //
delimiter //;


select r_even_odd(8);

-- create function for simple intrest 
delimiter //
create function simple_intrest(p int, r int,t int)
returns int
deterministic
begin 
    return (p*r*t)/100;
end //
delimiter //

select simple_intrest(500000,5,3);


-- create function to get full name
delimiter //
create function full_name(first_name varchar(20),last_name varchar(20))
returns varchar(50)
deterministic
begin 
  return concat(first_name," ",last_name);
end //
delimiter //

select full_name("Sanskar","Yadav");

-- craete percentage function 
delimiter //
create function get_percentage(total int,obtained int)
returns int
deterministic
begin 
  return (obtained/total)*100 ;
end //
delimiter //

select get_percentage(600,420);


-- create a function to join year 
delimiter //
create  function join_years(join_year int)
returns int
deterministic
begin 
return year(curdate())-join_year;
end //
delimiter //

select join_years(2024);


-- create a function to get grade
delimiter //
create function get_grade(marks int)
returns varchar(20)
deterministic
begin 
      if marks>=85 then
       return "A";
	  elseif marks<85 and  marks>=60 then 
        return "B";
	  else 
        return "C";
	  end if ;
end //
delimiter //;

select get_grade(50);

-- Create a function for business logic 
delimiter //
create function loan_elegiblity(salary int)
returns varchar(100)
deterministic
begin 
    if salary >=50000 then
       return "Eligble";
	elseif salary <50000 and salary>=40000 then 
       return "Chek the Background details ";
	else
	return "Not Elegible";
  end if ;
end //
delimiter //

select loan_elegiblity(45000);

