#CREATE DATABASE SALES;
CREATE DATABASE Sales;
use Sales;
#Create table 'Orders;
create table Orders (
Order_Id int primary key auto_increment,
Customer_Name varchar(30) NOT null,
Product_Category varchar(30) NOT null,
Ordered_item VARCHAR(30) NOT NULL,
Contact_No bigint unique
);

#Add a New Column;
alter table  Orders
ADD column  order_quantity  int ;
#Rename a Table;
RENAME TABLE Orders TO sales_orders;
desc sales_orders ;

#Insert Rows into the Table;
insert into sales_orders values
(1,'PRANAV','Electronics','Smartphone',9048251484,3),
(null,'PRAVEENA','beauty','sunscreem',9745327301,2),
(null,'anto','electronics','laptop',7994742333,1),
(null,'Eva Green', 'Furniture', 'Sofa', 9876543215, 1),
(null,'Kiran Babu', 'Electronics', 'Microwave Oven', 9944556683, 2),
(null,'Anjali Raj', 'Groceries', 'Mangoes', 9944558686, 5),
(null,'Vijay Ramesh', 'Home Appliances', 'Washing Machine', 9944556671, 1),
(null,'Anita George', 'Books', 'Novel', 9944556680, 4),
(null,'Matthew Paul', 'Home Appliances', 'Air Conditioner', 9944556681, 1),
(null,'Thomas Varghese', 'Electronics', 'Television',9944556685, 1),
(null,'Elizabeth Thomas', 'Groceries', 'Sugar', 9944556686, 7);

select * from sales_orders;
SELECT Customer_name, Ordered_item
FROM sales_orders;

#Update Data;
update sales_orders
set Ordered_Item = 'smartwatch'
where Order_Id = 1;
#Delete table from database;
Drop table Sales_Orders;











