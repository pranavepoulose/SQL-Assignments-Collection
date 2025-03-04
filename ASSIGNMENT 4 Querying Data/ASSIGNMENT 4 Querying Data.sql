USE SALES;
#Create Country Table;
CREATE TABLE Country (
    Id INT PRIMARY KEY auto_increment,
    Country_name VARCHAR(30) NOT null,
    Population INT,
    Area int
    );
    desc Country;
    
	#Create Persons Table;
    CREATE TABLE Persons (
    Id INT PRIMARY KEY auto_increment,
    Fname VARCHAR(30) not NULL,
    Lname VARCHAR(30),
    Population INT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(30),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id) ON delete cascade
);
DESC PERSONS;

#Insert 10 rows into Country table;
INSERT into Country (Country_name, Population, Area) 
VALUES
('USA', 331000000, 9833517),
('Canada', 37742154, 9984670),
('India', 1393409038, 3287263),
('UK', 68207000, 243610),
('Australia', 25499884, 7692024),
('Brazil', 213993437, 8515767),
('China', 1444216107, 9596961),
('Germany', 83783942, 357022),
('France', 67081000, 551695),
('Japan', 126300000, 377975);

select * from COUNTRY;
#Insert Values for Persons Table;
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
 VALUES
('John', 'Doe', 331000000, 4.2, 1, 'USA'),
('Jane', 'Smith', 37742154, 3.8, 2, 'Canada'),
('Ali', 'Khan', 1393409038, 3.5, 3, 'India'),
('Sarah', 'Johnson', 68207000, 4.0, 4, 'UK'),
('Michael', 'Brown', 25499884, 2.6, 5, 'Australia'),
('Ana', 'Silva', 213993437, 4.3, 6, 'Brazil'),
('Wang', 'Wei', 1444216107, 4.8, 7, 'China'),
('Emma', 'Miller', 83783942, 3.1, 8, 'Germany'),
('Sophia', 'Davis', 67081000, 3.7, 9, 'France'),
('David', 'Garcia', 126300000, 5.0, 10, 'Japan');

select * FROM Persons;

#List the distinct country names from the Persons table;

select distinct Country_name from Persons;

#Select first names and last names from the Persons table with aliases;

select Fname AS FirstName, Lname AS LastName FROM Persons;

#Find all persons with a rating greater than 4.0:

select * from persons where RATING > 4.0;

#Find countries with a population greater than 10 lakhs (1 million);

select ID, Country_name from country where Population > 1000000;

#Find persons who are from 'USA' or have a rating greater than 4.5:

select *FROM PERSONS WHERE Country_name = 'USA' OR  RATING > 4.5;

UPDATE PERSONS 
SET Country_name = null
WHERE ID IN (1,5,8);


#Find all persons where the country name is NULL:

select * FROM PERSONS WHERE Country_name IS NULL;

update persons
SET Country_name = 'USA'
where ID=1;

#Find all persons from the countries 'USA', 'Canada', and 'UK':

select * FROM persons where Country_name IN ('USA', 'Canada', 'UK');

#Find all persons not from the countries 'India' and 'Australia':

select * from persons where Country_name not IN ('India','Australia');

update country 
SET Population=CASE
WHEN ID = 1 THEN 1500000
WHEN ID = 6 THEN 600000
when ID = 8 THEN 1000000
else Population 
END;

#Find all countries with a population between 5 lakhs and 20 lakhs
select * from Country  where Population between 500000 and 2000000;

#Find all countries whose names do not start with 'C':

select Country_name from COUNTRY where Country_name NOT LIKE 'C%';



















    
    