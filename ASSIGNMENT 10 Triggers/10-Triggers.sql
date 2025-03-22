use sales;
-- 1. Create a table named teachers with fields id, name, subject, 
-- experience and salary and insert 8 rows.

create table teachers(
ID int primary key auto_increment,
NAME varchar(25) not NULL,
SUBJECT varchar(25) NOT NULL,
EXPERIENCE INT check (EXPERIENCE >=0),
SALARY decimal(10.2) check (SALARY >=0)
);
DESC TEACHERS;

insert into TEACHERS (NAME,SUBJECT,EXPERIENCE,SALARY) values
('Alice Johnson', 'Math', 5, 4000.00), 
('Aarav Sharma', 'Science', 3, 3500.00), 
('Fatima Ali', 'English', 12, 4500.00), 
('David Lee', 'History', 8, 3800.00), 
('Priya Gupta', 'Math', 6, 4200.00),  
('Mohammed Khan', 'Science', 15, 5000.00),  
('Grace Brown', 'English', 4, 3900.00),  
('Suresh Kumar', 'History', 10, 4700.00); 

select* from TEACHERS;

-- 2.Create a before insert trigger named before_insert_teacher 
-- that will raise an error “salary cannot be negative” 
-- if the salary inserted to the table is less than zero. 

DELIMITER #

create trigger before_insert_teacher 
before insert ON TEACHERS
for each row
begin
     IF NEW.SALARY < 0 THEN
     signal sqlstate '45000' SET message_text =  'salary cannot be negative';
     end if;
     END #
     DELIMITER ;
     
     SHOW TRIGGERS;

INSERT INTO teachers (name, subject, experience, salary)
VALUES ('PRANAV POULOSE', 'Math', 5, -500);
-- 3. Create an after insert trigger named after_insert_teacher
--  that inserts a row with teacher_id,action, timestamp to a table called teacher_log
--  when a new entry gets inserted to the teacher table.
-- tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time 
-- at which the new row has got inserted. 

create table teacher_log (
teacher_id INT NOT NULL,  
    action_TYPE VARCHAR(50) NOT NULL, 
    ACTION_TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    foreign key (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE
    );
    
    desc teacher_log;
    
DELIMITER #
create trigger after_insert_teacher
after insert ON TEACHERS
for each row
begin
insert into teacher_log 
values(NEW.ID,'ONBOARD',now());
end #
DELIMITER ;
show triggerS;
insert into TEACHERS (name, subject, experience, salary) values
('John Doe', 'History', 5, 7000.00);
SELECT * FROM teacher_log;

 -- 4. Create a before delete trigger that will raise an error when you try to delete a row
 -- that has experience greater than 10 years.
 
 DELIMITER #
 
 create trigger BEFORE_DELETE_TEACHER
 before delete ON TEACHERS
 for each row
 begin
 IF OLD.EXPERIENCE > 10 then
 signal sqlstate '45000' 
 set message_text ='Cannot delete teacher with more than 10 years of experience';
 END IF;
 end #
 DELIMITER ;
 
DELETE FROM teachers WHERE id = 3;

-- 5. Create an after delete trigger that will insert a row to teacher_log table 
-- when that row is deleted from teacher table.
 DELIMITER #
 
create trigger AFTER_DELETE_TEACHER
AFTER DELETE ON TEACHERS 
for each row
begin
insert INTO teacher_log
valueS (OLD.ID,'DELETED',now());
END #
DELIMITER ;

DELETE FROM teachers WHERE id = 1;

ALTER TABLE teacher_log

DROP FOREIGN KEY teacher_log_ibfk_1; 

SELECT * FROM teacher_log;









 


     
     
