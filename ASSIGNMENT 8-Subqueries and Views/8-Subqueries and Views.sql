use sales;
select * from country;
select * from persons;
 #1. Find the number of persons in each country.
 select Country_name, count(*) as persons_count from persons group by Country_name;
 
 #2. Find the number of persons in each country sorted from high to low. 
 
 select Country_name, count(*) as persons_count from persons 
 group by Country_name
 order by count(*) desc;
 

  #3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
  
  select Country_name,round( avg(Rating),2 )as Avg_Rating from persons
  group by Country_name having avg(Rating) > 3.0
  order by Avg_Rating desc;  
  
   #4. Find the countries with the same rating as the USA.
   
   select distinct ID,Country_name,rating from persons
where Rating in (select distinct Rating from persons WHERE Country_name = "USA");

#5. Select all countries whose population is greater than the average population of all nations. 

select Country_name,Population from country where Population > 
(select avg(Population) from country);

#Create a database named Product
create database PRODUCT;
USE PRODUCT;
-- CREATE TABLE Customer,
 CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY auto_increment,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50),
    Email VARCHAR(50) unique,
    Phone_no VARCHAR(15),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

desc CUSTOMER;

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
('John', 'Doe', 'johndoe@example.com', '1234567890', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
('Emma', 'Johnson', 'emma.johnson@example.com', '9876543210', '456 Oak St', 'New York', 'New York', '10001', 'USA'),
('Oliver', 'Smith', 'oliver.smith@example.co.uk', '1112223333', '789 Pine St', 'London', 'England', 'SW1A 1AA', 'UK'),
('Charlotte', 'Brown', 'charlotte.brown@example.co.uk', '4445556666', '321 Maple St', 'Manchester', 'Greater Manchester', 'M1 1AA', 'UK'),
('Liam', 'Tremblay', 'liam.tremblay@example.ca', '5556667777', '852 Birch St', 'Toronto', 'Ontario', 'M4B 1B4', 'Canada'),
('Sophie', 'Dubois', 'sophie.dubois@example.ca', '2223334444', '963 Walnut St', 'Montreal', 'Quebec', 'H3A 1A1', 'Canada'),
('Noah', 'Schmidt', 'noah.schmidt@example.de', '9998887777', '357 Oakwood St', 'Berlin', 'Berlin', '10117', 'Germany'),
('Hannah', 'Müller', 'hannah.mueller@example.de', '6667778888', '159 Redwood St', 'Munich', 'Bavaria', '80331', 'Germany'),
('Jack', 'Williams', 'jack.williams@example.au', '7778889999', '654 Cedar St', 'Sydney', 'New South Wales', '2000', 'Australia'),
('Matilda', 'Anderson', 'matilda.anderson@example.au', '1239876543', '741 Elm St', 'Melbourne', 'Victoria', '3000', 'Australia'),
('Arjun', 'Sharma', 'arjun.sharma@example.in', '5554443333', '741 Elm St', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Priya', 'Iyer', 'priya.iyer@example.in', '8887776666', '123 Lotus St', 'Bangalore', 'Karnataka', '560001', 'India');

select * FROM CUSTOMER;

#Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 

create view customer_info
AS select concat(First_name,' ',Last_name) AS FULL_NAME, EMAIL
FROM CUSTOMER;
select *FROM customer_info;

#2. Create a view named US_Customers that displays customers located in the US.

create view  US_Customers
AS select * FROM customer
where Country ='USA';

select * FROM US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.

create view  Customer_details AS 
select concat(First_name, ' ', Last_name) AS Full_Name, Email,Phone_no,State
FROM customer;
select * FROM Customer_details ;

-- 4. Update phone numbers of customers who live in California for Customer_details view. 

update customer
SET Phone_no = '3985462875'
where State = 'California';

SET SQL_SAFE_UPDATES = 0;
SELECT * FROM Customer_details WHERE State = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers.

select  State, count(*) AS customer_count
from customer 
group by STATE
having count(*) > 5;

--  6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 

select State,COUNT(*) AS CUSTOMER_COUNT FROM Customer_details group by STATE;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

select* from Customer_details
ORDER BY STATE ASC;







