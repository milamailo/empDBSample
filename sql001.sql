-- Drop the database if it already exists
DROP DATABASE IF EXISTS employees_db;

-- Create the database
CREATE DATABASE employees_db;
USE employees_db;

-- Drop the emp_info table if it already exists
DROP TABLE IF EXISTS emp_info;

-- Create the emp_info table
CREATE TABLE emp_info (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,     
    firstname VARCHAR(100) NOT NULL,           
    lastname VARCHAR(100) NOT NULL,           
    email VARCHAR(150) UNIQUE NOT NULL,        
    phone VARCHAR(20)                          
);

-- Drop the emp_schedule table if it already exists
DROP TABLE IF EXISTS emp_schedule;

-- Drop the emp_schedule table if it already exists
DROP TABLE IF EXISTS emp_schedule;

-- Create the emp_schedule table 
CREATE TABLE emp_schedule (
    sch_id INT AUTO_INCREMENT PRIMARY KEY,                         
    date DATE NOT NULL,  
    from_time TIME NOT NULL,
    to_time TIME NOT NULL,                      
    emp_id INT NOT NULL,                                
    FOREIGN KEY (emp_id) REFERENCES emp_info(emp_id) ON DELETE CASCADE,
    CONSTRAINT chk_time_range CHECK (from_time < to_time) -- Ensures 'from' time is earlier than 'to' time
);

-- Ensure no duplicate rows per employee with the same 'from' and 'to' times on the same date
CREATE UNIQUE INDEX idx_unique_schedule ON emp_schedule (date, from_time, to_time, emp_id);

