use sales;
select * from persons;
-- Perform inner join, Left join, and Right join on the tables.
-- 1 inner join
select C.Country_name,P.Fname,P.Lname
 from country C inner JOIN persons P 
 ON C.ID = P.Country_Id;
 
 -- 2 Left join
 select P.Fname,P.Lname,C.Country_name
 from persons P left JOIN country C 
 ON C.Id = P.Country_Id;
 
 -- Right join
 select P.Fname,P.Lname,C.Country_name
 from persons P RIGHT JOIN  country C 
 ON C.Id = P.Country_Id;
 
-- (2)List all distinct country names from both the Country and Persons tables. 

select distinct Id, Country_name from country union 
select distinct Country_Id, Country_name FROM persons;

-- (3)List all country names from both the Country and Persons tables, including duplicates.
 select distinct Id, Country_name from country union ALL 
select distinct Country_Id, Country_name FROM persons;

-- 4)Round the ratings of all persons to the nearest integer in the Persons table.

select Id,Fname,Lname,Country_name, round(Rating) AS rounded_rating FROM persons;

 
 