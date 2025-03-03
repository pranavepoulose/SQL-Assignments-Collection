use sales;
# Creating the Managers table;
CREATE TABLE Managers (
    Manager_Id INT auto_increment PRIMARY KEY,
    First_name VARCHAR(30),
    Last_Name VARCHAR(30),
    DOB DATE,
    Age INT CHECK (Age >= 18),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);
desc managers;
#Inserting values;
INSERT INTO Managers ( First_name, Last_Name, DOB, Age, Gender, Department, Salary) 
VALUES
( 'Aaliya', 'Khan', '1985-05-15', 40, 'Female', 'HR', 30000),
( 'John', 'Doe', '1979-08-22', 46, 'Male', 'IT', 35000),
( 'Sarah', 'Connor', '1990-11-30', 35, 'Female', 'Marketing', 28000),
( 'Michael', 'Smith', '1980-02-10', 45, 'Male', 'Sales', 25000),
( 'Rachel', 'Green', '1992-07-10', 33, 'Female', 'IT', 32000),
( 'David', 'Williams', '1988-06-18', 37, 'Male', 'Finance', 27000),
( 'Emma', 'Stone', '1987-09-21', 38, 'Female', 'HR', 23000),
( 'James', 'Bond', '1984-03-12', 41, 'Male', 'Marketing', 22000),
( 'Liam', 'Neeson', '1975-01-03', 50, 'Male', 'Sales', 38000),
('Olivia', 'Pope', '1991-12-17', 34, 'Female', 'Finance', 29000);
select * from managers;
#retrieve the name and date of birth of the manager with Manager_Id 1;
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;

#display the annual income of all managers;
SELECT First_name, Last_Name, Salary * 12 Annual_Income
FROM Managers;
#Query to display records of all managers except ‘Aaliya’;
select *
from Managers
where  First_name  <> 'Aaliya';
#Dispaly records of all manager whose  department is 'IT' and salary greater than 25000;
select * from Managers where department = 'IT' and salary>25000;
#Dispaly records of all manager whose salary between 10000 and 35000;
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;















