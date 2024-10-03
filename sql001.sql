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

-- Create the emp_schedule table
CREATE TABLE emp_schedule (
    sch_id INT AUTO_INCREMENT PRIMARY KEY,     
    monday VARCHAR(50),                        
    tuesday VARCHAR(50),                       
    wednesday VARCHAR(50),                     
    thursday VARCHAR(50),                      
    friday VARCHAR(50),                        
    saturday VARCHAR(50),                     
    sunday VARCHAR(50),                        
    date DATE NOT NULL,                       
    emp_id INT NOT NULL,                                
    FOREIGN KEY (emp_id) REFERENCES emp_info(emp_id) ON DELETE CASCADE
);
