use sales;
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) not null,
    Salary INT(15) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department CHAR(25) NOT NULL
);
INSERT INTO Worker 
 VALUES
(1, 'Arjun', 'Nair', 50000, '2022-01-10 09:00:00', 'IT'), 
(2, 'Joseph', 'Varghese', 60000, '2021-05-15 10:30:00', 'HR'), 
(3, 'Muhammad', 'Rafi', 55000, '2023-07-20 14:45:00', 'Finance'),
(4, 'Vishnu', 'Menon', 65000, '2020-03-10 08:15:00', 'Marketing'), 
(5, 'Ameer', 'Hussain', 70000, '2019-09-05 11:00:00', 'IT'), 
(6, 'Thomas', 'Mathew', 48000, '2022-12-01 15:30:00', 'HR'), 
(7, 'Rakesh', 'Pillai', 75000, '2018-06-25 09:45:00', 'Finance'), 
(8, 'Fathima', 'Beevi', 53000, '2023-01-18 16:00:00', 'IT'), 
(9, 'Antony', 'Chacko', 62000, '2021-11-07 13:20:00', 'Marketing'), 
(10, 'Devan', 'Warrier', 58000, '2020-08-14 12:10:00', 'HR'); 

select * from worker;

--  1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table
-- and then invokes the procedure call. 

delimiter #

create procedure add_workers (
in id int,
IN FIRST_NAME char(25),
IN LAST_NAME char(25),
IN SALARY INT,
IN Joining_Date datetime,
IN Department CHAR(25)
)
begin
      insert into WORKER (Worker_id,FirstName,LastName,Salary,JoiningDate,Department)
      values(id,FIRST_NAME,LAST_NAME,SALARY,Joining_Date,Department);
      END #
      
      DELIMITER ;
      
      call ADD_WORKERS (11, 'Arjun', 'Nair', 50000, '2022-01-10 09:00:00', 'IT');
      
      select * FROM WORKER;
      
-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the 
-- worker with the given ID  and returns it in the p_salary parameter. Then make the procedure call. 

  DELIMITER #
  
  create procedure GET_SALARY(
  IN P_Worker_Id INT,
  OUT P_Salary INT
  )
  BEGIN
        select SALARY into P_SALARY FROM WORKER WHERE Worker_Id = P_Worker_Id;
        END #
   DELIMITER ;
   
   CALL GET_SALARY(1,@SALARY);
    select @SALARY;
    
-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with
-- the given ID.Then make a procedure call. 

DELIMITER #

create procedure Update_Department(
IN P_Worker_Id INT,
IN P_Department char(25)
)
begin
      update WORKER 
      SET Department = P_Department
      WHERE WORKER_ID =  P_Worker_Id ;
      END #
DELIMITER ;

CALL Update_Department(2,'IT');

select * from WORKER;

-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve 
-- the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 

DELIMITER #

create procedure WORKER_COUNT(
IN P_DEPARTMENT CHAR(25),
OUT P_WORKER_COUNT int
)
begin
     select count(*) INTO P_WORKER_COUNT from WORKER 
     where Department = P_DEPARTMENT ;
     END #
DELIMITER ;
 
 
CALL WORKER_COUNT('IT',@WORKER_COUNT);

select @WORKER_COUNT;

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers 
-- in the given department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER #

create procedure WORKER_AVGSALARY(
IN P_DEPARTMENT char(25),
OUT P_AVGSALARY decimal(15,2)
)
begin 
	  select avg(Salary) into P_AVGSALARY from WORKER
      where Department = P_DEPARTMENT ;
      END #
DELIMITER ;
CALL  WORKER_AVGSALARY('IT',@AVGSALARY);
select @AVGSALARY;

     




    
   
      
      


