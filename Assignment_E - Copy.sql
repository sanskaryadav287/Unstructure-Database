use Student;

create table sals(
id int,
employee varchar(50),
department varchar(50),
sales_amount int,
sale_date date);

insert into sals(id,employee,department,sales_amount,sale_date) values
(1,"Alice","A",1000,"2024-01-01"),
(2,"Bob","B",1500,"2024-01-02"),
(3,"Alice","A",2000,"2024-01-03"),
(4,"Bob","B",1800,"2024-01-04"),
(5,"Alice","A",1200,"2024-01-05"),
(6,"Bob","B",1600,"2024-01-06");


select *from sals;

/* Q1. Total sales per employee (Running Total) */
select employee,sum(sales_amount)as Running from sals group by employee order by Running desc;



select employee,sales_amount,
sum(sales_amount) over(order by employee) as Running_total
from sals;

/*Q2. Row number per employee  */
select 
id,employee,
row_number() over ( order by id) as Row_numb
from sals;


/* Q3. Rank of sales per department. */
select employee,sales_amount,
rank() over (order by sales_amount desc)as aaaa
from sals;

/* Q4. Lead (next sale) per employee. */
select 
employee,sales_amount,sale_date,
lead(sales_amount) over(order by sale_date) as next_amount from sals;


/* Q5. Lag (previous sale) per employee. */
select 
employee,sales_amount,sale_date,
lag(sales_amount) over(order by sale_date desc) as previous_sale
from sals;

/* Q6. 	Average sales per employee. */
select 
employee,sales_amount,
avg(sales_amount) over (partition by employee) as AA from sals;

/* Q7.First and last sales per employee. */
select 
employee,sales_amount,sale_date,
first_value(sales_amount) over (partition by employee) as Fist_sale,
last_value(sales_amount) over(partition by employee) as Last_sale
from sals;

/* Q8. Dense rank (no gaps). */
select 
employee,sales_amount,
dense_rank() over(order by sales_amount desc) as Rank_
from sals;

/* Q9. Cumulative average per employee.*/
SELECT 
employee,sale_date,sales_amount,
avg(sales_amount) over(partition by employee order by sale_date) as cumulative_avg
from sals;

/* Q10. Find highest sale per employee. */
select 
employee,sales_amount,
max(sales_amount) over(partition by employee) as highest_sale
from  sals;

/* Q11.Sales difference from previous record. */
select 
employee,sales_amount,sale_date,
lag(sales_amount) over(order by sales_date) as previous_amount,
previous_amount - sales_amount
from sals;



/* Q11. Sales difference from previous record */

SELECT 
employee,sale_date,sale_date,
sales_amount-lag(sales_amount) over(partition by employee) as diff
from sals;


/* Q12. Cumulative count of sales per employee.  */
select 
employee,sales_amount,sale_date,
count(*) over(partition by employee order by sale_date) as cumulative_count
from sals;







/* Q13. Show if sale is above average per employee. */
select 
employee , sales_amount,




/* Q14.Find second highest sale per employee. */
select employee,sales_amount
from 