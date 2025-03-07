USE SALES;


#Country Table
select * from country;

#Person Table
select * from Persons;

#1. Write an SQL query to print the first three characters of Country_name from the Country table.;
 select substring(Country_name,1,3) AS  first_three_characters from country;
 
# 2. Write an SQL query to concatenate the first name and last name from the Persons table.

select concat(Fname, " ",Lname) AS FULL_NAME FROM persons;

#3. Write an SQL query to count the number of unique country names from the Persons table.

select count(distinct Country_name) AS Unique_Countries from persons;

#4. Write a query to print the maximum population from the Country table.
select max(Population) as Max_Population from country;

#5. Write a query to print the minimum population from the Persons table.

select min(Population) as Min_Population from persons;

#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from the Persons table.

insert into persons (Fname,Lname,Population,Rating,Country_Id,Country_name)
value ('John', NULL, 1000, 3.8, 1, 'USA'),
       ('Alice', NULL, 5000, 4.2, 2, 'Canada');
       
       
       select * from Persons;
       
       select count(lname) count_of_lname from persons;
       
#7. Write a query to find the number of rows in the Persons table.

select count(*) Total_Rows from persons;

#8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)

select Population from country 
limit 3;

#9. Write a query to print 3 random rows of countries. (Hint: Use RAND() function and LIMIT);
select * from country 
order by rand()
limit 3;

#10. List all persons ordered by their rating in descending order.

select * 
from persons
order by Rating desc;

#11. Find the total population for each country in the Persons table.

select  Country_name, sum(Population) as Total_Population from persons group by Country_name;

#12. Find countries in the Persons table with a total population greater than 50,000.

select Country_name, sum(Population) as Total_Population from persons group by Country_name having sum(Population) > 50000;

#13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.;

select Country_name, count(*) as  Total_Persons,

avg(Rating) as Average_Rating
from persons 
group by Country_name
having count(*) >= 2
order by Average_Rating asc;


       








 
 
 

