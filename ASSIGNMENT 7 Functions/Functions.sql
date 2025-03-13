use sales;

select *from country;

alter table persons add column DOB date;
 desc PERSONS;
 update PERSONS 
SET DOB = CASE 
    WHEN Id = 1 THEN '1990-05-14'
    WHEN Id = 2 THEN '1985-07-22'
    WHEN Id = 3 THEN '1993-09-10'
    WHEN Id = 4 THEN '1998-11-25'
    WHEN Id = 5 THEN '1980-01-30'
    WHEN Id = 6 THEN '1995-03-05'
    WHEN Id = 7 THEN '2000-06-18'
    WHEN Id = 8 THEN '1992-08-08'
    WHEN Id = 9 THEN '1997-12-12'
    WHEN Id = 10 THEN '1989-04-20'
    ELSE DOB
    END;
    SET sql_safe_updates = 0; 
select * from persons;

-- 2. Write a user-defined function to calculate age using DOB. 

DELIMITER $$

create function CALCULATE_AGE (DOB date)
returnS INT
deterministic
begin
return timestampdiff(YEAR,DOB,CURDATE());
end $$
DELIMITER ;
SHOW FUNCTION STATUS WHERE Name = 'Calculate_age';

-- 3. Write a select query to fetch the Age of all persons using the function that has been created. 


SELECT Id, Fname, Lname, DOB, Calculate_age(DOB) AS Age FROM Persons;

-- 4. Find the length of each country name in the Country table.

select Id,Country_name,length(Country_name) AS NameLength from country;
-- 5.Extract the first three characters of each country's name in the Country table.

select Id,Country_name,left(Country_name,3) AS FirstThreeChars 
from country;

 -- 6. Convert all country names to uppercase and lowercase in the Country table.
 
 
 select ID , Country_name, upper(Country_name) AS UppercaseName,
 lower(Country_name) AS LowercaseName 
 from country;
 








 
 
 
