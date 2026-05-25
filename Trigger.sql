use sakila;
CREATE TABLE inventori(product_id INT PRIMARY KEY, product_name VARCHAR(100),quantity INT);

CREATE TABLE sales(sale_id INT AUTO_INCREMENT PRIMARY KEY, product_id INT, amount DECIMAL(10,2),sale_date DATE, quantity_sold INT);


insert into inventori(product_id,product_name,quantity) values 
(1,"Prodyct A", 100),
(2,"Product B",150),
(3, "Product C" , 200);

## 1. Create a trigger ##
delimiter //
create trigger after_sales_insert
after insert on sales 
for each row 
begin 
    update inventori 
    set quantity= quantity-new.quantity_sold
    where product_id= new.product_id;
    
end //
delimiter ;


select*from inventori;

## 2. insert a neew sale tot est the trigger .  ##
insert into sales (product_id , amount , sale_date , quantity_sold) values 
(1, 50.00,"2024-07-01",10);


# Ques Create a trigger that updates an invertory table whenever a new sale is record in the sales table.
# Specifically, when a new sale is inserted into the sales table, the trigger should decreas the quantity of the corresponding product in the inventory table