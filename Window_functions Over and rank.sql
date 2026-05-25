create database Student;

use Student;

CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, SaleDate, CustomerID, ProductID, Amount) VALUES
(1, '2024-01-01', 101, 1001, 150.00),
(2, '2024-01-02', 102, 1002, 200.00),
(3, '2024-01-03', 101, 1001, 100.00),
(4, '2024-01-04', 103, 1003, 300.00),
(5, '2024-01-05', 102, 1002, 250.00),
(6, '2024-01-06', 101, 1001, 175.00),
(7, '2024-01-07', 104, 1004, 400.00),
(8, '2024-01-08', 105, 1005, 350.00),
(9, '2024-01-09', 102, 1002, 225.00),
(10, '2024-01-10', 101, 1001, 125.00);



/* Q1. Calcultae the running total of sales amount */
select saleID,saleDate,Amount,
 sum(Amount) over(order by SaleDate) as RunningTotal
from Sales;

/* Q2. Rank the sales by amount for each costumer */
select 
CustomerID,Amount,
RANK() OVER (PARTITION BY CustomerID ORDER BY Amount DESC ) AS sales_rank
FROM Sales;

/* Q3. Calculate the average sales amount over the last 3 sales */
select 
SaleID,SaleDate,Amount,
Avg(Amount) over (order by SaleDate rows between 2 PRECEDING and current row ) as Avglast3sales
from Sales;

/* Calculate the lead sales amount for the next sale */
select 
SaleID,SaleDate,Amount,
Lead(Amount,1) Over (order by SaleDAte) as NextSaleAmount
from Sales;


select 
SaleID,SaleDate,Amount,
Lead(Amount,2) Over (order by SaleDAte) as NextSaleAmount
from Sales;

/* Q7. Find the first_sale amount for each costumer */
select 
SaleID,SaleDate,Amount,
first_value(Amount) over (partition by CustomerID order by SaleDate) as First_sale_amount
from Sales;

/* Q8. Calculate the cumulative distribution of sales  amount .*/
select 
SaleID,SaleDate,Amount,
cume_dist() over (order by Amount) As cumulative_distribution
from Sales;