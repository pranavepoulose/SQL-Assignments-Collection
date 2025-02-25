#syntax : CREATE DATABASE School;
create database SCHOOL;
USE SCHOOL;

#syntax :CREATE TABLE ;
create table STUDENT (
Roll_No INT ,
Name varchar(30),
Marks INT,
Grade char(3)
);
# Describe the STUDENT table;
desc STUDENT;

#syntax: insert values;
INSERT INTO STUDENT
values
(1, 'ANTO',25,'D'),
(2,'MANU',50,'C'),
(3,'DON',78,'B'),
(4,'PRANAV',98,'A'),
(5,'PRAVEENA',80,'B+');

#Syntax: display the data in the table;
SELECT * FROM STUDENT;

#Syntax: ;Add Contact Column;
alter  table STUDENT
add CONTACT bigint;

#Syntax:  Remove Grade Column;
alter table STUDENT
DROP column Grade;

desc student;

#Syntax: Rename Table;

rename table STUDENT TO CLASSTEN;

#Syntax: ;Delete all rows from the CLASSTEN table;
truncate table CLASSTEN;

#Syntax:Remove the Table;
DROP TABLE CLASSTEN;























