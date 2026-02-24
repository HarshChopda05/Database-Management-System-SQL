•	Select Query
select first_name,email from employees;


CREATE DATABASE company;
USE company;


CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);


INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
('John', 'Doe', 'HR', 60000.00, '2022-05-10'),
('Jane', 'Smith', 'IT', 75000.00, '2021-08-15'),
('Alice', 'Johnson', 'Finance', 82000.00, '2019-03-20'),
('Bob', 'Williams', 'IT', 72000.00, '2020-11-25'),
('Charlie', 'Brown', 'Marketing', 65000.00, '2023-01-05');


SELECT * FROM employees;


SELECT first_name as 'First Name' , last_name, department FROM employees;


SELECT * FROM employees where department="IT" ORDER BY SALARY DESC limit 1;


SELECT * FROM EMPLOYEES limit 2;


select distinct department FROM EMPLOYEES;


SELECT first_name,last_name,salary*1.1 as 'Salary After Raise' FROM EMPLOYEES;


select concat(first_name, ' ', last_name) as 'Full Name', year(hire_date), ROUND(salary,1) FROM EMPLOYEES WHERE salary > 70000 ;


select AVG(salary) from employees;


SELECT * FROM employees WHERE SALARY > (select AVG(salary) from employees);


SELECT first_name, last_name FROM employees WHERE department = 'IT' UNION
SELECT first_name, last_name FROM employees WHERE department = 'HR';


select count(*), department from employees group by department;


select NOW() as 'time';


select 5 * 2;


SELECT LENGTH('hello');


SELECT 5 < 3;









•	NULL, LIKE, BETWEEN, Subqueries
CREATE DATABASE bookstore;


USE bookstore;
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(10,2),
    publication_date DATE,
    category VARCHAR(30),
    in_stock INT
);


INSERT INTO books VALUES
(1, 'The MySQL Guide', 'John Smith', 29.99, '2023-01-15', 'Technology', 50),
(2, 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
(3, 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
(4, 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75);


INSERT INTO books VALUES
(5, 'Cook Book', null, 24.99, '2023-04-05', 'Cooking', 75);


INSERT INTO books VALUES
(6, 'Mini Cook Book', 'Gohn Smith', 24.99, '2023-04-05', 'Cooking', 75);


select * from books where category='Technology' ;


SELECT title, price FROM books WHERE price < 30.00;


SELECT title, publication_date FROM books 
WHERE publication_date >= '2023-03-01';


-- Logical Operators


select * from books where category = 'Technology' and price < 30;


select * from books where category = 'Technology' or price < 30;


select * from books where (category = 'Technology' or category = 'Mystery') and price < 25; 


select * from books where not category = 'Technology';


-- Finding NULL values


select * from books where author is null;
select * from books where author is not null;


-- Pattern matching


select * from books where title like '%SqL%';
select * from books where title like 'the%';
select * from books where title like binary '%SQL%';
select * from books where author like '_ohn%';


-- RANGE OPERATORS 


select * from books where price between 20 and 30;


select * from books where category in (
'Technology', 'MysterY', 'Science');


SELECT * FROM books 
WHERE price BETWEEN 20.00 AND 40.00 
    AND publication_date >= '2023-01-01';
    
-- SUBQUERIES


select * from books where price > ( select avg(price) from books );


select * from books where category in (
select category from books where in_stock > 20
);




 -- Find all books published in 2023 that cost less than the average book price
 
SELECT title, price, publication_date
FROM books
WHERE YEAR(publication_date) = 2023
AND price < (SELECT AVG(price) FROM books);


 -- List all technology books with "data" in the title that have more than 50 copies in stock
 
SELECT title, category, in_stock
FROM books
WHERE category = 'Technology'
AND title LIKE '%data%'
AND in_stock > 50;


 -- Find books that are either in the Technology category with price > $30 or in the Mystery category with price < $20
 
SELECT title, category, price
FROM books
WHERE (category = 'Technology' AND price > 30.00)
OR (category = 'Mystery' AND price < 20.00);


 -- List all books where the author's name contains either 'son' or 'th' and were published after March 2023


SELECT title, author, publication_date
FROM books
WHERE (author LIKE '%son%' OR author LIKE '%th%')
AND publication_date > '2023-03-31';

•	AND, OR, NOT
-- Logical operators are used in SQL to filter records based on multiple conditions in the WHERE clause




-- AND → Returns records where both conditions are TRUE
-- OR → Returns records where at least one condition is TRUE
-- NOT → Negates a condition (returns the opposite result)


CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);




INSERT INTO employees (name, age, department, salary, city) VALUES
('Alice Johnson', 30, 'HR', 50000, 'New York'),
('Bob Smith', 25, 'IT', 70000, 'Los Angeles'),
('Charlie Brown', 35, 'IT', 80000, 'New York'),
('David Wilson', 40, 'Finance', 90000, 'Chicago'),
('Emily Davis', 28, 'HR', 48000, 'San Francisco'),
('Franklin Moore', 32, 'IT', 75000, 'Los Angeles'),
('Grace Adams', 45, 'Finance', 95000, 'Chicago');


select * from employees;


-- Find employees who work in the IT department and earn more than $70,000
select * from employees where department='IT' and salary > 70000;


-- Find employees who work in the HR department OR live in New York
select * from employees where department= 'hr' or city = 'New York'
 
-- Find employees who are NOT in the Finance department
select * from employees where not department= 'Finance'


-- Find employees who are in IT and earn more than $70,000 OR work in Finance
SELECT * FROM employees WHERE (department = 'IT' AND salary > 70000) OR department = 'Finance';


-- Find employees who are NOT in the IT department AND do not live in Chicago
select * from employees where not department = 'IT' and not city = 'Chicago'

•	Comparision Operators

-- StoreDB Complete SQL Script
-- This script creates a sample database with products and orders tables
-- and demonstrates various SQL query examples


-- Create the database
CREATE DATABASE StoreDB;
USE StoreDB;


-- Create products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);


-- Insert sample data into products table
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1200.00, 10),
('Phone', 'Electronics', 800.00, 15),
('Tablet', 'Electronics', 600.00, 20),
('Headphones', 'Accessories', 150.00, 50),
('Mouse', 'Accessories', 30.00, 100),
('Keyboard', 'Accessories', 45.00, 80);


-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(50)
);


-- Insert sample data into orders table
INSERT INTO orders (order_date, customer_name) VALUES
('2024-02-01', 'Alice'),
('2024-02-05', 'Bob'),
('2024-02-10', 'Charlie'),
('2024-02-15', 'David');


-- ========================================
-- QUERY EXAMPLES
-- ========================================


-- Get all products with a price of exactly 600
SELECT * FROM products WHERE price = 600;


-- Get all products that are NOT priced at 800
SELECT * FROM products WHERE price <> 800;
SELECT * FROM products WHERE price != 800;


-- Get all products priced below 500
SELECT * FROM products WHERE price < 500;


-- Get all products priced above 700
SELECT * FROM products WHERE price > 700;


-- Get all products priced at or below 150
SELECT * FROM products WHERE price <= 150;


-- Get all products priced at or above 800
SELECT * FROM products WHERE price >= 800;


-- Get all products where the category is exactly "Electronics"
SELECT * FROM products WHERE category = 'Electronics';


-- Retrieve Orders Placed Before February 10, 2024
SELECT * FROM orders WHERE order_date < '2024-02-10';


-- String comparison example (alphabetical ordering)
SELECT * FROM products WHERE product_name > 'Mouse';


-- Numeric comparison with strings (lexicographic comparison)
SELECT '100' < '2';


-- Another string comparison example (lexicographic ordering)
SELECT 100 < '211fcfc';









•	ORDER BY in MySQL: Single, Multiple Field, Function, Field, Case, Null Handling
/*
SQL Sorting and ORDER BY Tutorial
================================
This SQL script demonstrates various techniques for sorting data using ORDER BY
and includes examples ranging from basic to advanced sorting concepts.
*/


-- Section 1: Database and Table Setup
-- ----------------------------------
CREATE DATABASE db12;
USE db12;


-- Create a products table with various data types
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);


-- Insert initial sample data
INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');


-- Section 2: Basic Sorting Operations
-- ---------------------------------
-- Display all records (unsorted)
SELECT * FROM products;


-- Sort by price in ascending order (ASC is optional as it's the default)
SELECT * FROM products ORDER BY price ASC;


-- Sort by last updated timestamp
SELECT * FROM products ORDER BY last_updated;


-- Section 3: Advanced Sorting Techniques
-- ------------------------------------
-- Multiple column sorting (sort by category descending, then price descending)
SELECT * FROM products ORDER BY category DESC, price DESC;


-- Sort using column position (4 represents the price column)
SELECT * FROM products ORDER BY 4;


-- Combining WHERE clause with ORDER BY
SELECT * FROM products 
WHERE category = 'Electronics' 
ORDER BY price;


-- Case-sensitive sorting using BINARY
SELECT * FROM products ORDER BY BINARY category;


-- Section 4: Function-Based Sorting
-- -------------------------------
-- Sort by product name length
SELECT * FROM products ORDER BY LENGTH(product_name);


-- Sort by day of the month from timestamp
SELECT * FROM products ORDER BY DAY(last_updated);


-- Using LIMIT with ORDER BY to find highest stock quantity
SELECT * FROM products 
ORDER BY stock_quantity DESC 
LIMIT 1;


-- Section 5: Custom Sorting Orders
-- -----------------------------
-- Default category sorting
SELECT * FROM products ORDER BY category;


-- Custom category order using FIELD function
SELECT * FROM products 
ORDER BY FIELD(category, 'Electronics','Appliances','Furniture'), price DESC;


-- Section 6: Complex Sorting with Conditions
-- ---------------------------------------
-- Simple conditional sorting for low stock and high price items
SELECT *, 
    stock_quantity <= 50 AND price >= 200 AS priority_flag
FROM products 
ORDER BY (stock_quantity <= 50 AND price >= 200) DESC;


-- Advanced priority-based sorting using CASE
SELECT *,
    CASE
        WHEN stock_quantity <= 50 AND price >= 200 THEN 1
        WHEN stock_quantity <= 50 THEN 2
        ELSE 3
    END AS priority 
FROM products 
ORDER BY priority;


-- Section 7: Handling NULL Values
-- ----------------------------
-- Add records with NULL values for demonstration
INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');


-- Basic NULL handling in ORDER BY
SELECT * FROM products ORDER BY price;


-- Explicit NULL handling
SELECT *, 
    price IS NULL
FROM products 
ORDER BY price IS NULL;


-- Section 8: Working with Calculated Columns
-- --------------------------------------
-- Sort by total value (price * quantity)
SELECT *, 
    price * stock_quantity AS total_value 
FROM products 
ORDER BY total_value DESC;


-- Section 9: Query Performance Analysis
-- ---------------------------------
-- Examine query execution plan for multi-column sort
EXPLAIN SELECT * FROM products
ORDER BY category, price;


-- Compare with primary key sort performance
EXPLAIN SELECT * FROM products 
ORDER BY product_id;

•	LIMIT & OFFSET
/*
✅ LIMIT helps in retrieving a specific number of rows
✅ LIMIT offset, count is used for pagination
✅ Combining ORDER BY with LIMIT is essential for meaningful result sets
✅ Be cautious about performance impacts when using high offset values
*/
- =============================================
-- MySQL LIMIT Clause Lecture
-- =============================================


-- 1. Setup and Sample Data


CREATE DATABASE db13;
USE db13;
-- Create products table
CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
price DECIMAL(10,2),
category VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insert sample data
INSERT INTO products (name, price, category) VALUES
('Laptop', 999.99, 'Electronics'),
('Smartphone', 499.99, 'Electronics'),
('Coffee Maker', 79.99, 'Appliances'),
('Headphones', 149.99, 'Electronics'),
('Blender', 59.99, 'Appliances'),
('Tablet', 299.99, 'Electronics'),
('Microwave', 199.99, 'Appliances'),
('Smart Watch', 249.99, 'Electronics'),
('Toaster', 39.99, 'Appliances'),
('Speaker', 89.99, 'Electronics');


-- 2. Basic LIMIT Usage


-- Return first 2 products
SELECT * FROM products ORDER BY id LIMIT 2;


-- 3. LIMIT with OFFSET


-- Syntax 1: LIMIT [row_count] OFFSET [offset]
SELECT * FROM products ORDER BY id LIMIT 2 OFFSET 2;
-- Syntax 2: LIMIT [offset], [row_count]
SELECT * FROM products ORDER BY id LIMIT 2, 2;


-- 4. Pagination Implementation


-- Page size: 3 items per page
-- For page 1 (Using OFFSET syntax):
SELECT * FROM products LIMIT 3 OFFSET 0;
-- For page 2:
SELECT * FROM products LIMIT 3 OFFSET 3;
-- For page 3:
SELECT * FROM products LIMIT 3 OFFSET 6;
-- Alternative syntax using LIMIT offset, count
-- For page 1:
SELECT * FROM products LIMIT 0, 3;
-- For page 2:
SELECT * FROM products LIMIT 3, 3;
-- For page 3:
SELECT * FROM products LIMIT 6, 3;
-- Generic formula for pagination:
-- LIMIT (page_number - 1) * items_per_page, items_per_page


-- 5. Common Use Cases


-- Top 3 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;
-- Get 5 random products
SELECT * FROM products
ORDER BY RAND()
LIMIT 5;


-- 6. Performance Considerations


-- Example of potentially slow query with large offset
SELECT *
FROM products  -- Note: In real scenario, this would be a much larger table
ORDER BY created_at
LIMIT 1000000, 10;
-- Better alternative using WHERE clause
SELECT *
FROM products
WHERE created_at > '2025-01-01 00:00:00'
ORDER BY created_at
LIMIT 10;















•	Alias

-- MySQL Aliases Tutorial
-- Aliases are temporary names assigned to database tables, columns, or expressions 
-- to make them more readable and manageable.


-- Create and use the database
CREATE DATABASE db16;
USE db16;


-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);


-- Insert initial employee data
INSERT INTO employees VALUES
    (1, 'John', 'Doe', 60000.00, '2020-01-15'),
    (2, 'Jane', 'Smith', 65000.00, '2019-11-20'),
    (3, 'Mike', 'Johnson', 55000.00, '2021-03-10');


-- View all employees
SELECT * FROM employees;


-- Basic column aliases: Creating full name using concatenation
SELECT 
    CONCAT(first_name, " ", last_name) AS full_name 
FROM employees;


-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);


-- Insert department data
INSERT INTO departments VALUES
    (1, 'Engineering', 'New York'),
    (2, 'Marketing', 'Los Angeles'),
    (3, 'Finance', 'Chicago');


-- Add department reference to employees table
ALTER TABLE employees ADD COLUMN department_id INT;


-- Using table aliases in JOIN operations
SELECT 
    e.first_name,
    e.last_name,
    d.dept_name 
FROM employees AS e 
JOIN departments AS d 
    ON e.department_id = d.dept_id;


-- Using aliases in subqueries
SELECT avg_salary.average_salary
FROM (
    SELECT AVG(salary) AS average_salary 
    FROM employees
) AS avg_salary;

•	DISTINCT
-- MySQL DISTINCT Tutorial
-- The DISTINCT clause eliminates duplicate rows from the result set
-- Syntax: SELECT DISTINCT column1, column2 FROM table_name;


-- Create and use the database
CREATE DATABASE EmployeeDB;
USE EmployeeDB;


-- Create employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);


-- Insert sample data including duplicates
INSERT INTO employees (name, department, salary) VALUES
    ('Alice', 'HR', 50000),
    ('Bob', 'Finance', 60000),
    ('Charlie', 'IT', 70000),
    ('Alice', 'HR', 50000),      -- Duplicate record
    ('David', 'Finance', 55000),
    ('Eve', 'IT', 70000),        -- Duplicate salary
    ('Frank', 'HR', 50000);      -- Duplicate department & salary


-- View all employees
SELECT * FROM employees;


-- Example 1: Using DISTINCT on a single column
-- Get unique departments
SELECT DISTINCT department 
FROM employees;


-- Example 2: Using DISTINCT on multiple columns
-- Get unique department-salary combinations
SELECT DISTINCT department, salary 
FROM employees;


-- Example 3: Using DISTINCT with aggregate functions
-- Count number of unique departments
SELECT COUNT(DISTINCT department) AS unique_departments 
FROM employees;


-- Example 4: Using DISTINCT with string functions
-- Get unique name-department combinations
SELECT DISTINCT CONCAT(name, '-', department) 
FROM employees;


-- Example 5: Using DISTINCT with ORDER BY
-- Get unique salaries in descending order
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC;


-- Example 6: Using DISTINCT with WHERE clause
-- Get unique departments where salary is greater than 50000
SELECT DISTINCT department 
FROM employees 
WHERE salary > 50000;


-- Display current data
SELECT * FROM employees;


-- Example 7: Handling NULL values with DISTINCT
-- Insert records with NULL departments
INSERT INTO employees (name, department, salary) VALUES 
    ('Grace', NULL, 48000),
    ('Bobby', NULL, 48000);


-- Show how DISTINCT handles NULL values
SELECT DISTINCT department 
FROM employees;


•	String, Date, Math & Aggregate

-- =============================================
-- SQL FUNCTIONS DEMO SCRIPT
-- A comprehensive demonstration of various SQL functions
-- =============================================


-- =================
-- STRING FUNCTIONS
-- =================


-- Create and use database for string function examples
CREATE DATABASE StringFunctionsDB;
USE StringFunctionsDB;


-- Create employees table for string function demonstrations
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50)
);


-- Insert sample employee data
INSERT INTO employees (first_name, last_name, email, department) VALUES
('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');


-- CONCAT: Combine first and last names into full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;


-- LENGTH: Get the length of the first name
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;


-- UPPER and LOWER: Convert first names to uppercase and lowercase
SELECT first_name, UPPER(first_name) AS uppercase, LOWER(first_name) AS lowercase FROM employees;


-- TRIM: Remove leading and trailing spaces
SELECT TRIM(UPPER('      ok.   ')) AS trimmed_sample;


-- SUBSTRING: Extract the first three characters of first names
SELECT first_name, SUBSTRING(first_name, 1, 3) AS first_three_chars FROM employees;


-- LOCATE: Find the position of character 'a' in first names
SELECT first_name, LOCATE('a', first_name) AS position_of_a FROM employees;


-- LOCATE: Find the position of characters 'ch' in first names
SELECT first_name, LOCATE('ch', first_name) AS position_of_ch FROM employees;


-- REPLACE: Replace domain in email addresses
SELECT first_name, REPLACE(email, 'example.com', 'amazon.com') AS new_email FROM employees;


-- REVERSE: Reverse the characters in first names
SELECT first_name, REVERSE(first_name) AS reversed_name FROM employees;


-- LEFT and RIGHT: Get the first two and last two characters of first names
SELECT first_name, 
       LEFT(first_name, 2) AS first_two, 
       RIGHT(first_name, 2) AS last_two 
FROM employees;


-- ASCII: Get ASCII value of the first character in first names (regular and lowercase)
SELECT first_name, 
       ASCII(first_name) AS ascii_value, 
       ASCII(LOWER(first_name)) AS ascii_lowercase_value 
FROM employees;


-- Create products database for FIELD function demonstration
CREATE DATABASE db12;
USE db12;


-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);


-- Insert sample product data
INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');


-- FIELD: Order products by category in custom order
SELECT *, 
       FIELD(category, 'Electronics', 'Appliances', 'Furniture') AS category_order 
FROM products 
ORDER BY FIELD(category, 'Electronics', 'Appliances', 'Furniture') DESC;


-- LENGTH vs CHAR_LENGTH: Demonstrate difference with ASCII and multibyte characters
SELECT LENGTH('hello') AS length_in_bytes;          -- Returns 5 (bytes)
SELECT LENGTH('こんにちは') AS multibyte_length;      -- Returns more than 5 because each character is multiple bytes
SELECT CHAR_LENGTH('hello') AS char_count;          -- Returns 5 (characters)
SELECT CHAR_LENGTH('こんにちは') AS multibyte_char_count; -- Returns 5 (characters)


-- SOUNDEX: Compare phonetically similar strings
SELECT SOUNDEX('Smith') AS smith_soundex;  -- Returns 'S530'
SELECT SOUNDEX('Smyth') AS smyth_soundex;  -- Also returns 'S530'
SELECT SOUNDEX('Robert') AS robert_soundex; -- Returns 'R163'
SELECT SOUNDEX('Rupert') AS rupert_soundex; -- Also returns 'R163'


-- Find employees with names that sound like "Jane"
SELECT * FROM employees WHERE SOUNDEX('jane') = SOUNDEX(first_name);




-- =================
-- NUMERIC FUNCTIONS
-- =================


CREATE DATABASE NumericFunctionsDB;
USE NumericFunctionsDB;


CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10,5)
);


INSERT INTO numbers (num_value) VALUES
(25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);


-- Basic display of all values
SELECT * FROM numbers;


-- Absolute value function
SELECT num_value, ABS(num_value) AS absolute_value FROM numbers;


-- Rounding functions
SELECT num_value, 
       CEIL(num_value) AS rounded_up, 
       FLOOR(num_value) AS rounded_down 
FROM numbers;


SELECT num_value, ROUND(num_value, 2) AS rounded_2_decimals FROM numbers;
SELECT num_value, TRUNCATE(num_value, 2) AS truncated_2_decimals FROM numbers;


-- Mathematical operations
SELECT num_value, POWER(num_value, 2) AS squared FROM numbers;
SELECT num_value, MOD(num_value, 3) AS remainder FROM numbers;
SELECT num_value, SQRT(ABS(num_value)) AS sqrt_value FROM numbers;


-- Exponential functions with handling for out-of-range values
SELECT 
    num_value, 
    CASE 
        WHEN num_value > 709 THEN 'Value too large for EXP()' 
        ELSE EXP(num_value) 
    END AS exp_value 
FROM numbers;


-- Logarithmic functions
SELECT num_value, 
       LOG(2, ABS(num_value) + 1) AS log_base2, 
       LOG10(ABS(num_value) + 1) AS log_base10 
FROM numbers;


-- Trigonometric functions
SELECT num_value, 
       SIN(num_value) AS sin_value, 
       COS(num_value) AS cos_value, 
       TAN(num_value) AS tan_value 
FROM numbers;


-- Pi constant and angle conversions
SELECT PI() AS pi_value;
SELECT num_value, 
       RADIANS(num_value) AS radians_value, 
       DEGREES(num_value) AS degrees_value 
FROM numbers;


-- Bitwise operations
SELECT BIT_AND(num_value) FROM numbers;
SELECT BIT_OR(num_value) FROM numbers;
SELECT BIT_XOR(num_value) FROM numbers;




-- =================
-- DATE FUNCTIONS
-- =================


-- Date and time data types:
-- DATE	        YYYY-MM-DD           Stores only date without time
-- DATETIME     YYYY-MM-DD HH:MI:SS  Stores date and time
-- TIMESTAMP    YYYY-MM-DD HH:MI:SS  Stores date/time with automatic UTC conversion
-- TIME         HH:MI:SS             Stores only time
-- YEAR         YYYY                 Stores only a four-digit year


-- Current date and time functions
SELECT NOW() AS current_datetime;
SELECT CURDATE() AS current_date;
SELECT CURTIME() AS current_time;


-- Date part extraction
SELECT YEAR(NOW()) AS current_year;
SELECT MONTH(NOW()) AS current_month;
SELECT DAY(NOW()) AS current_day;
SELECT HOUR(NOW()) AS current_hour;
SELECT MINUTE(NOW()) AS current_minute;
SELECT SECOND(NOW()) AS current_second;


-- Date formatting
SELECT DATE_FORMAT('2025-03-13', '%W, %M %e, %Y') AS formatted_date_long; -- "Thursday, March 13, 2025"
SELECT DATE_FORMAT('2025-03-13', '%e/%m/%Y') AS formatted_date_short; -- "13/03/2025"


-- Date arithmetic
SELECT DATE_ADD('2025-03-13', INTERVAL 7 MONTH) AS date_plus_7_months;
SELECT DATE_SUB('2025-03-13', INTERVAL 7 MONTH) AS date_minus_7_months;


-- Date difference
SELECT DATEDIFF('2025-03-10', '2024-03-03') AS days_between;


-- Unix timestamp functions (seconds since January 1, 1970, at 00:00:00 UTC)
SELECT UNIX_TIMESTAMP('2025-03-03') AS unix_time;
SELECT FROM_UNIXTIME(1741392000) AS readable_date;


-- Date function examples with a database
CREATE DATABASE DateExamplesDB;
USE DateExamplesDB;


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME
);


INSERT INTO orders (customer_name, order_date) VALUES
('Alice', '2025-03-01 10:15:00'),
('Bob', '2025-03-02 14:45:30'),
('Charlie', '2025-03-03 09:30:15'),
('Akshay', '2024-03-01 10:15:00');


-- Querying orders in the last 7 days
SELECT * FROM orders WHERE order_date >= DATE_SUB(NOW(), INTERVAL 7 DAY);




-- =================
-- AGGREGATE FUNCTIONS
-- =================
-- Used to perform calculations on multiple rows of data and return a single summarized value
-- COUNT() – Returns the number of rows
-- SUM() – Returns the sum of a numeric column
-- AVG() – Returns the average value of a numeric column
-- MIN() – Returns the minimum value
-- MAX() – Returns the maximum value


CREATE DATABASE CompanyDB2;
USE CompanyDB2;


CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);


INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'HR', 50000, '2018-06-23'),
('Bob', 'IT', 70000, '2019-08-01'),
('Charlie', 'Finance', 80000, '2017-04-15'),
('David', 'HR', 55000, '2020-11-30'),
('Eve', 'IT', 75000, '2021-01-25'),
('Frank', 'Finance', 72000, '2019-07-10'),
('Grace', 'IT', 68000, '2018-09-22'),
('Hank', 'Finance', 90000, '2016-12-05'),
('Ivy', 'HR', 53000, '2022-03-19'),
('Jack', 'IT', 72000, '2017-05-12');


-- Count employees in HR department
SELECT COUNT(*) AS hr_employee_count FROM employees WHERE department='HR';


-- Sum of salaries in HR department
SELECT SUM(salary) AS total_hr_salary FROM employees WHERE department='HR';


-- Average salary in HR department
SELECT AVG(salary) AS avg_hr_salary FROM employees WHERE department='HR';


-- Minimum salary in HR department
SELECT MIN(salary) AS min_hr_salary FROM employees WHERE department='HR';


-- Maximum salary in HR department
SELECT MAX(salary) AS max_hr_salary FROM employees WHERE department='HR';


-- Comprehensive statistics for all employees
SELECT 
    COUNT(*) AS num_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees;


-- Group by department to get statistics per department
SELECT 
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS department_total_salary,
    ROUND(AVG(salary), 2) AS department_avg_salary,
    MIN(salary) AS department_min_salary,
    MAX(salary) AS department_max_salary
FROM employees
GROUP BY department
ORDER BY department_avg_salary DESC;

•	GROUP BY & HAVING

-- GROUP BY Examples in SQL
-- =============================================
-- This file demonstrates various examples of using GROUP BY in SQL queries
-- for data summarization and aggregation operations.


-- Database Setup
-- =============================================
CREATE DATABASE db_for_group_by;
USE db_for_group_by;


-- Table Creation
-- =============================================
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);


-- Initial Data Insertion
-- =============================================
INSERT INTO employees (name, department, salary, joining_date) VALUES
('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 55000, '2019-08-20'),
('Charlie', 'IT', 70000, '2018-03-25'),
('David', 'IT', 72000, '2017-07-10'),
('Eve', 'IT', 73000, '2021-02-15'),
('Frank', 'Finance', 60000, '2020-11-05'),
('Grace', 'Finance', 65000, '2019-05-30'),
('Hannah', 'Finance', 62000, '2021-01-12');


-- Additional Data Insertion
-- =============================================
INSERT INTO employees (name, department, salary, joining_date) VALUES
('Tim', 'HR', 65000, '2019-05-30'),
('Tom', 'IT', 62000, '2021-01-12');


-- View All Employee Data
-- =============================================
SELECT * FROM employees;


-- Example 1: Count Employees in Each Department
-- =============================================
SELECT department, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department;


-- Example 2: Get the Average Salary Per Department
-- =============================================
SELECT department, AVG(salary) AS average_salary 
FROM employees 
GROUP BY department;


-- Example 3: Get the Highest and Lowest Salary Per Department
-- =============================================
SELECT department, MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary 
FROM employees 
GROUP BY department;


-- Example 4: Count Employees Per Department and Joining Year
-- =============================================
SELECT department, YEAR(joining_date) AS joining_year, COUNT(*) AS employee_count 
FROM employees 
GROUP BY joining_year, department;


-- Example 5: Order Departments by the Highest Average Salary
-- =============================================
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;


-- Example 6: Group by Calculated Salary Range
-- =============================================
SELECT 
    CASE 
        WHEN salary < 60000 THEN 'Low Salary'
        WHEN salary BETWEEN 60000 AND 70000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_range,
    COUNT(*) AS employee_count
FROM employees 
GROUP BY salary_range;


-- Example 7: Find Department with the Maximum Number of Employees
-- =============================================
SELECT department, COUNT(*) AS total_employees 
FROM employees 
GROUP BY department 
ORDER BY total_employees DESC 
LIMIT 1;


-- Example 8: Find Departments With More Than 2 Employees (With Conditions)
-- =============================================
SELECT 
    department, 
    AVG(salary) AS average_salary, 
    COUNT(*) AS total_employees 
FROM employees 
WHERE joining_date > '2017-07-10' 
GROUP BY department 
HAVING total_employees > 2 AND average_salary > 55000;

•	Primary Keys Mastery: Database Design Fundamentals

/*
 * PRIMARY KEYS IN SQL
 * This script demonstrates the concepts and best practices for using primary keys in database design
 */


-- Primary Keys - Key Benefits:
-- They uniquely identify each record in a table
-- They ensure no duplicate records exist
-- They provide a reference point for relationships between tables
-- They optimize database performance for record retrieval


-- SECTION 1: Basic Primary Key Implementation
-- Creating a table with a simple primary key
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);


-- Inserting records with valid primary keys
INSERT INTO students (student_id, first_name, last_name, email)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com'),
(2, 'Maria', 'Garcia', 'maria.garcia@example.com'),
(3, 'Ahmed', 'Khan', 'ahmed.khan@example.com');


-- Demonstrating primary key constraint - This will fail
INSERT INTO students (student_id, first_name, last_name, email)
VALUES (1, 'Jane', 'Doe', 'jane.doe@example.com');
-- Error Code: 1062. Duplicate entry '1' for key 'PRIMARY'


-- SECTION 2: Auto-increment Primary Keys
-- Creating a table with an auto-increment primary key
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);


-- With auto-increment, we don't need to specify the primary key value
INSERT INTO products (product_name, price, description)
VALUES 
('Laptop', 1299.99, 'High-performance laptop'),
('Smartphone', 799.99, 'Latest model smartphone'),
('Headphones', 199.99, 'Noise-cancelling headphones');


-- View the auto-generated IDs
SELECT * FROM products;


-- SECTION 3: Adding Primary Keys to Existing Tables
-- Creating a table with a primary key defined separately
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id)
);


-- Create table without primary key
CREATE TABLE suppliers (
    supplier_id INT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100)
);


-- Adding a primary key to an existing table
ALTER TABLE suppliers
ADD PRIMARY KEY (supplier_id);


-- SECTION 4: Composite Primary Keys
-- Creating a table with a composite primary key (multiple columns)
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id)
);


-- Insert records with unique combinations of the composite key
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES 
(1, 101, '2023-01-15', 'A'),
(1, 102, '2023-01-15', 'B+'),  -- Same student, different course - OK
(2, 101, '2023-01-16', 'A-'),  -- Different student, same course - OK
(3, 103, '2023-01-17', 'B');


-- This will fail - duplicate composite key (student_id + course_id)
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES (1, 101, '2023-02-01', 'C');
-- Error: Duplicate entry '1-101' for key 'PRIMARY'


-- Primary Key Best Practices:
-- 1. Always include a primary key in every table
-- 2. Use auto-increment unless you have a specific reason not to
-- 3. Keep primary keys simple - use INT or BIGINT for numeric IDs




•	Foreign Keys

-- Foreign Keys in SQL: Database Relationships
-- =============================================


-- INTRODUCTION TO FOREIGN KEYS
-- A foreign key is a column or set of columns in one table that refers to the primary key in another table. 
-- It creates a link between the two tables, establishing a parent-child relationship.
-- Parent table: Contains the primary key that is referenced
-- Child table: Contains the foreign key that references the primary key of the parent table
-- Purpose of Foreign Keys: Referential Integrity, Data Validation, Structured Relationships


-- TYPES OF TABLE RELATIONSHIPS
-- ============================


-- 1. One-to-One (1:1): Each record in Table A relates to exactly one record in Table B
CREATE TABLE employee_details (
    employee_id INT NOT NULL,
    passport_number VARCHAR(20),
    marital_status VARCHAR(20),
    emergency_contact VARCHAR(100),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


-- 2. One-to-Many (1:N): Each record in Table A relates to multiple records in Table B
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-- Here, multiple employee records can reference the same department_id


-- 3. Many-to-Many (N:M): Multiple records in Table A relate to multiple records in Table B 
-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);


-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor VARCHAR(100) NOT NULL
);


-- Create Enrollments junction table with foreign keys
CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


-- PRACTICAL IMPLEMENTATION
-- ========================


-- Create a database
CREATE DATABASE company_db;
USE company_db;


-- Create the parent table (departments)
CREATE TABLE departments (
    department_id INT NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    PRIMARY KEY (department_id)
);


-- Create the child table with a foreign key (employees)
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- INSERT SAMPLE DATA
-- =================


-- Insert department data
INSERT INTO departments (department_id, department_name, location)
VALUES 
    (1, 'Human Resources', 'Floor 1'),
    (2, 'Marketing', 'Floor 2'),
    (3, 'Engineering', 'Floor 3'),
    (4, 'Finance', 'Floor 1');


-- Insert employee data
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES
    (101, 'John', 'Smith', 'john.smith@company.com', '2018-06-20', 55000.00, 1),
    (102, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '2019-03-15', 62000.00, 2),
    (103, 'Michael', 'Williams', 'michael.williams@company.com', '2020-01-10', 75000.00, 3),
    (104, 'Emily', 'Brown', 'emily.brown@company.com', '2019-11-05', 68000.00, 3),
    (105, 'David', 'Jones', 'david.jones@company.com', '2021-02-28', 58000.00, 4),
    (106, 'Jessica', 'Davis', 'jessica.davis@company.com', '2020-07-16', 61000.00, 2),
    (107, 'Robert', 'Miller', 'robert.miller@company.com', '2018-09-12', 72000.00, 3);


-- View employee data
SELECT * FROM employees;


-- DEMONSTRATING FOREIGN KEY CONSTRAINT
-- ====================================


-- Attempt to insert an employee with non-existent department_id (this will fail)
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES
    (145, 'John', 'Smith', 'john.smith@company.com', '2018-06-20', 55000.00, 69);
-- Error: Cannot add or update a child row: a foreign key constraint fails


-- Insert an employee with NULL department_id (allowed if the foreign key allows NULL)
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES 
    (108, 'Thomas', 'Wilson', 'thomas.wilson@company.com', '2022-04-10', 65000.00, NULL);


-- ADDING AND REMOVING FOREIGN KEYS
-- ===============================


-- Create a projects table
CREATE TABLE projects (
    project_id INT NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    manager_id INT,
    PRIMARY KEY (project_id)
);


-- Add a foreign key constraint after table creation
ALTER TABLE projects
ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);


-- View the table structure including the foreign key
SHOW CREATE TABLE projects;


-- Remove a foreign key constraint
ALTER TABLE projects DROP FOREIGN KEY projects_ibfk_1;


-- Verify the foreign key was removed
SHOW CREATE TABLE projects;


-- EXERCISE: IMPLEMENTING EMPLOYEE SKILLS TABLE
-- ===========================================


-- Create a table for employee skills with a foreign key to employees
CREATE TABLE employee_skills (
    skill_id INT NOT NULL,
    employee_id INT NOT NULL,
    skill_name VARCHAR(50) NOT NULL,
    proficiency_level ENUM('Beginner', 'Intermediate', 'Advanced', 'Expert') NOT NULL,
    PRIMARY KEY (skill_id),
    CONSTRAINT fk_employee_skill FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


-- Insert some skills
INSERT INTO employee_skills (skill_id, employee_id, skill_name, proficiency_level)
VALUES
    (1, 103, 'Python', 'Expert'),
    (2, 103, 'SQL', 'Advanced'),
    (3, 104, 'Java', 'Intermediate'),
    (4, 107, 'C++', 'Advanced'),
    (5, 107, 'SQL', 'Expert'),
    (6, 102, 'Graphic Design', 'Advanced');




•	Normalization Explained: 1NF, 2NF & 3NF

-- Database Normalization: 1NF, 2NF, and 3NF Demonstration
-- This SQL script demonstrates the process of normalizing a database through 
-- First, Second, and Third Normal Forms using a bookstore database example.


-- Create and use bookstore database
CREATE DATABASE bookstore;
USE bookstore;


-- Original denormalized table
CREATE TABLE book_orders (
    order_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    book_isbn VARCHAR(20),
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10, 2),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2)
);


-- Sample data for denormalized table
INSERT INTO book_orders VALUES
(1, 'John Smith', 'john@example.com', '123 Main St, Anytown', '978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99, '2023-01-15', 1, 9.99),
(2, 'John Smith', 'john@example.com', '123 Main St, Anytown', '978-0451524935', '1984', 'George Orwell', 12.99, '2023-01-15', 2, 25.98),
(3, 'Mary Johnson', 'mary@example.com', '456 Oak Ave, Somewhere', '978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 14.99, '2023-01-20', 1, 14.99),
(4, 'Robert Brown', 'robert@example.com', '789 Pine Rd, Nowhere', '978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99, '2023-01-25', 1, 9.99);


-- View the denormalized data
SELECT * FROM book_orders;


-- FIRST NORMAL FORM (1NF)
-- Requirements:
-- 1. Each column contains atomic (indivisible) values
-- 2. Each column contains values of the same type
-- 3. Each row is unique (typically ensured by a primary key)
-- 4. No repeating groups of columns


CREATE TABLE book_orders_1nf (
    order_id INT,
    book_isbn VARCHAR(20),
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10, 2),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, book_isbn)
);


-- SECOND NORMAL FORM (2NF)
-- Requirements:
-- 1. Must be in 1NF
-- 2. All non-key attributes must be fully functionally dependent on the entire primary key
--    (No non-key column should depend on only part of the primary key)
--    (No partial dependencies on primary key)


CREATE TABLE orders_2nf (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    order_date DATE
);


CREATE TABLE books_2nf (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    price DECIMAL(10, 2)
);


CREATE TABLE order_items_2nf (
    order_id INT,
    book_isbn VARCHAR(20),
    quantity INT,
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, book_isbn),
    FOREIGN KEY (order_id) REFERENCES orders_2nf(order_id),
    FOREIGN KEY (book_isbn) REFERENCES books_2nf(isbn)
);


-- Sample data for 2NF tables
INSERT INTO orders_2nf VALUES
(1, 'John Smith', 'john@example.com', '123 Main St, Anytown', '2023-01-15'),
(2, 'Mary Johnson', 'mary@example.com', '456 Oak Ave, Somewhere', '2023-01-20'),
(3, 'Robert Brown', 'robert@example.com', '789 Pine Rd, Nowhere', '2023-01-25');


INSERT INTO books_2nf VALUES
('978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99),
('978-0451524935', '1984', 'George Orwell', 12.99),
('978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 14.99);


INSERT INTO order_items_2nf VALUES
(1, '978-0141439518', 1, 9.99),
(1, '978-0451524935', 2, 25.98),
(2, '978-0061120084', 1, 14.99),
(3, '978-0141439518', 1, 9.99);


-- THIRD NORMAL FORM (3NF)
-- Requirements:
-- 1. Must be in 2NF
-- 2. Must not have transitive dependencies
--    (A non-key attribute cannot depend on another non-key attribute;
--     it must depend directly on the primary key)


CREATE TABLE customers_3nf (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);


CREATE TABLE orders_3nf (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_3nf(customer_id)
);


CREATE TABLE books_3nf (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    price DECIMAL(10, 2)
);


CREATE TABLE order_items_3nf (
    order_id INT,
    book_isbn VARCHAR(20),
    quantity INT,
    PRIMARY KEY (order_id, book_isbn),
    FOREIGN KEY (order_id) REFERENCES orders_3nf(order_id),
    FOREIGN KEY (book_isbn) REFERENCES books_3nf(isbn)
);


-- Note: The 3NF design removes the derived column total_price from order_items
-- as it can be calculated from quantity * price






•	JOIN Masterclass: INNER, LEFT, RIGHT, CROSS, SELF JOIN, UNION & UNION ALL

•	Inner Join

-- SQL INNER JOIN Lecture
-- An INNER JOIN returns only the rows where there is a match in both tables based on the specified join condition.
-- If there's no match, the rows from both tables are excluded from the result set.


-- Create database
CREATE DATABASE db_inner_join;
USE db_inner_join;


-- Create authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_year INT
);


-- Create books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT,
    price DECIMAL(6,2)
);


-- Insert data into authors table
INSERT INTO authors (author_id, first_name, last_name, birth_year)
VALUES 
    (1, 'Jane', 'Austen', 1775),
    (2, 'George', 'Orwell', 1903),
    (3, 'Ernest', 'Hemingway', 1899),
    (4, 'Agatha', 'Christie', 1890),
    (5, 'J.K.', 'Rowling', 1965);


-- Insert data into books table
INSERT INTO books (book_id, title, author_id, publication_year, price)
VALUES 
    (101, 'Pride and Prejudice', 1, 1813, 12.99),
    (102, '1984', 2, 1949, 14.50),
    (103, 'Animal Farm', 2, 1945, 11.75),
    (104, 'The Old Man and the Sea', 3, 1952, 10.99),
    (105, 'Murder on the Orient Express', 4, 1934, 13.25),
    (106, 'Death on the Nile', 4, 1937, 12.50),
    (107, 'Emma', 1, 1815, 11.99),
    (108, 'For Whom the Bell Tolls', 3, 1940, 15.75);


-- Display table contents
SELECT * FROM authors;
SELECT * FROM books;


-- Basic INNER JOIN syntax:
/*
SELECT columns
FROM table1
JOIN_TYPE table2
ON table1.column = table2.column;
*/


-- Retrieve books with their author's information with conditions and ordering
SELECT b.title, a.first_name, a.last_name, a.birth_year
FROM books AS b
INNER JOIN authors AS a
ON a.author_id = b.author_id 
WHERE b.publication_year > 1940 
ORDER BY birth_year;


-- Count how many books each author has written
SELECT a.first_name, a.last_name, COUNT(*) AS book_count
FROM authors AS a 
JOIN books AS b 
ON a.author_id = b.author_id 
GROUP BY a.author_id;


-- Create categories table for many-to-many relationship example
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);


INSERT INTO categories (category_id, category_name)
VALUES 
    (1, 'Fiction'),
    (2, 'Classic'),
    (3, 'Romance'),
    (4, 'Political'),
    (5, 'Mystery'),
    (6, 'Adventure');


-- Create junction table for book-category many-to-many relationship
CREATE TABLE book_categories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id)
);


INSERT INTO book_categories (book_id, category_id)
VALUES 
    (101, 1), (101, 2), (101, 3), -- Pride and Prejudice: Fiction, Classic, Romance
    (102, 1), (102, 2), (102, 4), -- 1984: Fiction, Classic, Political
    (103, 1), (103, 2), (103, 4), -- Animal Farm: Fiction, Classic, Political
    (104, 1), (104, 2), (104, 6), -- The Old Man and the Sea: Fiction, Classic, Adventure
    (105, 1), (105, 5), -- Murder on the Orient Express: Fiction, Mystery
    (106, 1), (106, 5), -- Death on the Nile: Fiction, Mystery
    (107, 1), (107, 2), (107, 3), -- Emma: Fiction, Classic, Romance
    (108, 1), (108, 2), (108, 6); -- For Whom the Bell Tolls: Fiction, Classic, Adventure


-- Get books with their authors and categories using GROUP_CONCAT
SELECT b.title, 
       a.first_name, 
       a.last_name, 
       GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categories
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN book_categories bc ON b.book_id = bc.book_id
JOIN categories c ON bc.category_id = c.category_id
GROUP BY b.book_id;


-- Example with join condition in ON clause
SELECT b.title, a.last_name
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
                      AND b.publication_year < 1950
                      AND a.birth_year < 1900;


-- Equivalent example with join condition in WHERE clause
SELECT b.title, a.last_name
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
WHERE b.publication_year < 1950 
  AND a.birth_year < 1900;
  
-- Example with date functions - books published more than 70 years ago
SELECT b.title, a.last_name
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
WHERE YEAR(CURDATE()) - b.publication_year > 70;
 
/*
Note: INNER JOIN excludes rows with NULL values in the join columns. If you want to include rows with NULL values,
you would need to use LEFT JOIN or RIGHT JOIN (which we'll cover in later sections).
*/
 
-- Find authors who have written more than one book using HAVING clause
SELECT a.first_name, 
       a.last_name, 
       COUNT(b.book_id) AS book_count
FROM authors a
INNER JOIN books b ON a.author_id = b.author_id
GROUP BY a.author_id, a.first_name, a.last_name
HAVING COUNT(b.book_id) > 1;

•	Left Join

-- LEFT JOIN (LEFT OUTER JOIN) Tutorial
-- It returns ALL records from the left table and only the matching records from the right table.
-- If no match exists in the right table, NULL values will be returned for the right table's columns.


-- Basic LEFT JOIN syntax
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;


-- Create and set up database
CREATE DATABASE left_join_tutorial;
USE left_join_tutorial;


-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50)
);


-- Create orders table with foreign key
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Insert sample customer data
INSERT INTO customers (customer_id, customer_name, email, city)
VALUES 
    (1, 'John Smith', 'john@example.com', 'New York'),
    (2, 'Jane Doe', 'jane@example.com', 'Los Angeles'),
    (3, 'Robert Johnson', 'robert@example.com', 'Chicago'),
    (4, 'Emily Davis', 'emily@example.com', 'Houston'),
    (5, 'Michael Brown', 'michael@example.com', 'Phoenix');


-- Insert sample order data
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES 
    (101, 1, '2023-01-15', 150.75),
    (102, 3, '2023-01-16', 89.50),
    (103, 1, '2023-01-20', 45.25),
    (104, 2, '2023-01-25', 210.30),
    (105, 3, '2023-02-01', 75.00);


-- Example 1: Basic LEFT JOIN
-- Get all customers and their orders (if any)
SELECT 
    c.customer_id, 
    c.customer_name, 
    o.order_id, 
    o.order_date, 
    o.total_amount 
FROM 
    customers c 
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id;


-- Example 2: Finding customers with no orders
-- Note the use of IS NULL in the WHERE clause
SELECT 
    c.customer_id, 
    c.customer_name 
FROM 
    customers c 
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id 
WHERE 
    o.order_id IS NULL;


-- Example 3: Using aggregate functions with LEFT JOIN
-- Get customer order counts and total spending
SELECT 
    c.customer_id, 
    c.customer_name, 
    COUNT(o.order_id) AS order_count, 
    IFNULL(SUM(o.total_amount), 0) AS total_spent 
FROM 
    customers c 
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id 
GROUP BY 
    c.customer_id;


-- Create shipping table for multiple joins example
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    carrier VARCHAR(50),
    tracking_number VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Insert sample shipping data
INSERT INTO shipping (shipping_id, order_id, shipping_date, carrier, tracking_number)
VALUES 
    (1001, 101, '2023-01-16', 'FedEx', 'FDX123456789'),
    (1002, 104, '2023-01-26', 'UPS', 'UPS987654321'),
    (1003, 105, '2023-02-02', 'USPS', 'USPS456789123');


-- Example 4: Multiple LEFT JOINs
-- Get customers, their orders, and shipping information
SELECT 
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    s.carrier,
    s.tracking_number
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
LEFT JOIN 
    shipping s ON o.order_id = s.order_id;


-- Example 5: Filtering with WHERE vs. ON clause
-- Method 1: Filter in WHERE clause (filters after join)
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id 
WHERE 
    c.city = 'New York';


-- Method 2: Filter in ON clause (maintains all left table rows)
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id AND c.city = 'New York';


-- Method 3: Using subquery to filter left table first
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    (SELECT * FROM customers WHERE city = 'New York') c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id;


-- Example 6: Advanced filtering with aggregation
-- Find customers who haven't ordered in the past 30 days
SELECT 
    c.customer_id,
    c.customer_name,
    MAX(o.order_date) AS last_order_date
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    MAX(o.order_date) IS NULL 
    OR MAX(o.order_date) < DATE_SUB(CURDATE(), INTERVAL 30 DAY);


•	Right Join

-- Create and use the Gokuldham Society database
CREATE DATABASE gokuldham_society;
USE gokuldham_society;


-- Create apartments table to store apartment information
CREATE TABLE apartments (
    apartment_id INT PRIMARY KEY,
    apartment_number VARCHAR(10) NOT NULL,
    floor_number INT NOT NULL,
    wing_name CHAR(1) NOT NULL
);


-- Create residents table with foreign key to apartments
CREATE TABLE residents (
    resident_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(100),
    apartment_id INT,
    FOREIGN KEY (apartment_id) REFERENCES apartments(apartment_id)
);


-- Insert sample apartment data
INSERT INTO apartments (apartment_id, apartment_number, floor_number, wing_name) VALUES
(1, '101', 1, 'A'),
(2, '102', 1, 'A'),
(3, '201', 2, 'A'),
(4, '202', 2, 'A'),
(5, '301', 3, 'A'),
(6, '302', 3, 'A'),
(7, '401', 4, 'A'),
(8, '402', 4, 'A'),
(9, '501', 5, 'B'),
(10, '502', 5, 'B');


-- Insert sample resident data
INSERT INTO residents (resident_id, first_name, last_name, occupation, apartment_id) VALUES
(1, 'Jethalal', 'Gada', 'Electronics Shop Owner', 1),
(2, 'Daya', 'Gada', 'Housewife', 1),
(3, 'Taarak', 'Mehta', 'Writer', 2),
(4, 'Anjali', 'Mehta', 'Teacher', 2),
(5, 'Popatlal', 'Pandey', 'Reporter', 3),
(6, 'Bhide', 'Aatmaram', 'School Teacher', 4),
(7, 'Madhavi', 'Bhide', 'Housewife', 4),
(8, 'Dr', 'Hathi', 'Doctor', 5),
(9, 'Komal', 'Hathi', 'Housewife', 5);
-- Note: We've left some apartments without residents


-- Basic SELECT query to view all residents
SELECT * FROM residents;


-- DEMO: LEFT JOIN to see all apartments and their residents (if any)
SELECT a.apartment_number, a.floor_number, a.wing_name, 
       r.first_name, r.last_name
FROM apartments a
LEFT JOIN residents r
ON r.apartment_id = a.apartment_id;


-- DEMO: RIGHT JOIN to see all apartments and their residents (if any)
SELECT a.apartment_number, a.floor_number, a.wing_name, 
       r.first_name, r.last_name
FROM residents r 
RIGHT JOIN apartments a
ON r.apartment_id = a.apartment_id;


-- Create maintenance_requests table with foreign key to apartments
CREATE TABLE maintenance_requests (
    request_id INT PRIMARY KEY,
    apartment_id INT,
    request_date DATE NOT NULL,
    description TEXT NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (apartment_id) REFERENCES apartments(apartment_id)
);


-- Insert sample maintenance request data
INSERT INTO maintenance_requests (request_id, apartment_id, request_date, description, status) VALUES
(1, 1, '2023-01-15', 'Leaky faucet in kitchen', 'Completed'),
(2, 1, '2023-02-20', 'Broken window handle', 'Completed'),
(3, 2, '2023-03-10', 'Electricity fluctuation', 'In Progress'),
(4, 4, '2023-03-15', 'Ceiling fan not working', 'Pending'),
(5, 5, '2023-04-01', 'Bathroom door lock broken', 'Completed'),
(6, 8, '2023-04-10', 'Water seepage in wall', 'In Progress');


-- EXERCISE 1: Finding Unoccupied Apartments
SELECT a.apartment_id, a.apartment_number, a.floor_number, a.wing_name
FROM apartments a
LEFT JOIN residents r ON a.apartment_id = r.apartment_id
WHERE r.resident_id IS NULL;


-- EXERCISE 2: Count the number of residents per apartment
SELECT a.apartment_id, a.apartment_number, COUNT(r.resident_id) AS resident_count
FROM apartments a
LEFT JOIN residents r ON a.apartment_id = r.apartment_id
GROUP BY a.apartment_id;


-- EXERCISE 3: List all apartments with their residents and maintenance request status
SELECT 
    a.apartment_id, 
    a.apartment_number, 
    a.floor_number, 
    a.wing_name,
    CONCAT(r.first_name, ' ', r.last_name) AS resident_name,
    mr.status AS maintenance_status
FROM 
    apartments a
LEFT JOIN 
    residents r ON a.apartment_id = r.apartment_id
LEFT JOIN 
    maintenance_requests mr ON a.apartment_id = mr.apartment_id;


-- EXERCISE 4: Write a query to find the floor with the most unoccupied apartments
SELECT 
    floor_number,
    wing_name,
    COUNT(*) AS unoccupied_count
FROM 
    apartments a
LEFT JOIN 
    residents r ON a.apartment_id = r.apartment_id
WHERE 
    r.resident_id IS NULL
GROUP BY 
    floor_number, wing_name
ORDER BY 
    unoccupied_count DESC
LIMIT 1;


-- EXERCISE 5: Write a query to list all apartments along with the total number of maintenance requests
SELECT 
    a.apartment_id, 
    a.apartment_number, 
    a.floor_number, 
    a.wing_name,
    COUNT(mr.request_id) AS maintenance_request_count
FROM 
    apartments a
LEFT JOIN 
    maintenance_requests mr ON a.apartment_id = mr.apartment_id
GROUP BY 
    a.apartment_id;









•	Union

-- ====================================================================
-- MySQL UNION Lecture - Complete SQL Script
-- ====================================================================


-- Introduction to UNION and UNION ALL
-- ====================================================================
-- UNION allows us to combine result sets from multiple SELECT queries into a single result set
-- Key points:
-- - Combines rows from multiple queries into a single result set
-- - Appends rows vertically (stacks them on top of each other)
-- - Requires that all queries have the same number of columns
-- - Column data types must be compatible across all queries
-- - Eliminates duplicate rows by default (use UNION ALL to keep duplicates)
-- - Uses the column names from the first SELECT statement for the final result set
-- - Ignores column names from subsequent queries


-- Database Setup
-- ====================================================================
CREATE DATABASE union_demo;
USE union_demo;


-- Create tables for our demonstration
CREATE TABLE headquarters_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);


CREATE TABLE branch_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE,
    status VARCHAR(20)
);


-- Sample Data
-- ====================================================================
-- Insert data into headquarters_employees
INSERT INTO headquarters_employees VALUES
(101, 'John', 'Smith', 'john.smith@company.com', '2018-03-15', 'IT', 75000.00),
(102, 'Mary', 'Johnson', 'mary.johnson@company.com', '2019-06-22', 'HR', 65000.00),
(103, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00),
(104, 'Susan', 'Brown', 'susan.brown@company.com', '2020-01-30', 'Marketing', 68000.00),
(105, 'Michael', 'Davis', 'michael.davis@company.com', '2018-09-12', 'IT', 78000.00);


-- Insert data into branch_employees
INSERT INTO branch_employees VALUES
(201, 'James', 'Wilson', 'james.wilson@company.com', '2019-04-18', 'Sales', 62000.00),
(202, 'Patricia', 'Moore', 'patricia.moore@company.com', '2020-07-25', 'Marketing', 59000.00),
(203, 'Linda', 'Taylor', 'linda.taylor@company.com', '2018-08-15', 'HR', 61000.00),
(204, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00), -- Duplicate employee who works at both locations
(205, 'Elizabeth', 'Anderson', 'elizabeth.anderson@company.com', '2019-12-03', 'Sales', 64000.00);


-- Insert data into customers
INSERT INTO customers VALUES
(1001, 'David', 'Miller', 'david.miller@email.com', '2019-02-14', 'Active'),
(1002, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '2020-05-20', 'Active'),
(1003, 'Michael', 'Davis', 'michael.davis@email.com', '2018-11-30', 'Inactive'), -- Same name as an employee
(1004, 'Jennifer', 'Garcia', 'jennifer.garcia@email.com', '2021-01-05', 'Active'),
(1005, 'Robert', 'Martinez', 'robert.martinez@email.com', '2019-08-22', 'Active');


-- View table data
-- ====================================================================
SELECT * FROM headquarters_employees;
SELECT * FROM branch_employees;
SELECT * FROM customers;


-- Basic UNION Examples
-- ====================================================================
-- Example 1: UNION vs UNION ALL
-- Get a list of all employees from both locations (without duplicates)
SELECT first_name, last_name, email FROM headquarters_employees
UNION
SELECT first_name, last_name, email FROM branch_employees;


-- Get a list of all employees from both locations (including duplicates)
SELECT first_name, last_name, email FROM headquarters_employees
UNION ALL
SELECT first_name, last_name, email FROM branch_employees;


-- Example 2: Combining full tables
SELECT * FROM headquarters_employees
UNION ALL
SELECT * FROM branch_employees;


-- Advanced UNION Examples
-- ====================================================================
-- Example 3: Adding a descriptor column
-- Combine employee and customer contact information with a type indicator
SELECT first_name, last_name, email, 'Employee' AS contact_type
FROM headquarters_employees
UNION
SELECT first_name, last_name, email, 'Customer' AS contact_type
FROM customers;


-- Example 4: Ordering results after UNION
-- Get all employees sorted by last name
SELECT employee_id, first_name, last_name, department
FROM headquarters_employees
UNION
SELECT employee_id, first_name, last_name, department
FROM branch_employees
ORDER BY last_name;


-- Example 5: Filtering before UNION
-- Get employees with salary over 70000
SELECT employee_id, first_name, last_name, department, salary
FROM headquarters_employees
WHERE salary > 70000
UNION
SELECT employee_id, first_name, last_name, department, salary
FROM branch_employees
WHERE salary > 70000
ORDER BY salary DESC;


-- Handling Different Column Structures
-- ====================================================================
-- Example 6: Handling different table structures with NULL values
SELECT employee_id, first_name, last_name, department, salary, NULL AS status
FROM headquarters_employees
UNION
SELECT customer_id, first_name, last_name, NULL, NULL, status
FROM customers
ORDER BY first_name, last_name;


-- Practical Use Cases
-- ====================================================================
-- Example 7: Finding all unique departments across locations
SELECT department
FROM headquarters_employees
UNION
SELECT department
FROM branch_employees;


-- Example 8: Finding common departments (advanced)
-- Departments that exist in both headquarters and branch offices
SELECT department FROM (
    SELECT DISTINCT department
    FROM headquarters_employees
    UNION ALL
    SELECT DISTINCT department
    FROM branch_employees
) AS combined 
GROUP BY department 
HAVING COUNT(*) = 2;

•	Full Join

-- ====================================================================
-- MySQL FULL JOIN Lecture - Complete SQL Script
-- ====================================================================


-- Introduction to FULL JOIN
-- ====================================================================
-- FULL JOIN
-- - It returns all matching rows from both tables where the join condition is met
-- - It also returns all non-matching rows from the left table (with NULL values for columns from the right table)
-- - It also returns all non-matching rows from the right table (with NULL values for columns from the left table)
-- - It combines the results of both LEFT JOIN and RIGHT JOIN, including all records from both tables and matching records from both sides where available.
--
-- Note: MySQL does not natively support FULL JOIN, but we can emulate it using UNION of LEFT JOIN and RIGHT JOIN


-- Join Types Comparison:
-- - INNER JOIN (only returns matching rows between tables)
-- - LEFT JOIN (returns all rows from left table and matching from right)
-- - RIGHT JOIN (returns all rows from right table and matching from left)
-- - FULL JOIN (returns all rows from both tables)


-- Database Setup - Friends Theme
-- ====================================================================
CREATE DATABASE friends_db;
USE friends_db;


-- Create tables for our demonstration
CREATE TABLE characters (
    character_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(100)
);


CREATE TABLE apartments (
    apartment_id INT PRIMARY KEY,
    building_address VARCHAR(100) NOT NULL,
    apartment_number VARCHAR(10) NOT NULL,
    monthly_rent DECIMAL(8, 2),
    current_tenant_id INT
);


-- Sample Data
-- ====================================================================
-- Insert data into characters
INSERT INTO characters (character_id, first_name, last_name, occupation) VALUES
(1, 'Ross', 'Geller', 'Paleontologist'),
(2, 'Rachel', 'Green', 'Fashion Executive'),
(3, 'Chandler', 'Bing', 'IT Procurement Manager'),
(4, 'Monica', 'Geller', 'Chef'),
(5, 'Joey', 'Tribbiani', 'Actor'),
(6, 'Phoebe', 'Buffay', 'Massage Therapist'),
(7, 'Gunther', 'Smith', 'Coffee Shop Manager'),
(8, 'Janice', 'Hosenstein', 'Unknown');


-- Insert data into apartments
INSERT INTO apartments (apartment_id, building_address, apartment_number, monthly_rent, current_tenant_id) VALUES
(101, '90 Bedford Street', '20', 3500.00, 3),
(102, '90 Bedford Street', '19', 3500.00, 4),
(103, '5 Morton Street', '14', 2800.00, 6),
(104, '17 Grove Street', '3B', 2200.00, NULL),
(105, '15 Yemen Road', 'Yemen', 900.00, NULL),
(106, '495 Grove Street', '7', 2400.00, 1);


-- View table data
-- ====================================================================
SELECT * FROM characters;
SELECT * FROM apartments;


-- JOIN Examples
-- ====================================================================


-- INNER JOIN Example
-- Only returns characters who have apartments and apartments that have tenants
SELECT c.character_id, c.first_name, c.last_name, c.occupation,
       a.apartment_id, a.building_address, a.apartment_number, a.monthly_rent
FROM characters c
INNER JOIN apartments a ON c.character_id = a.current_tenant_id;


-- LEFT JOIN Example
-- All characters, including those without apartments
SELECT c.character_id, c.first_name, c.last_name, c.occupation,
       a.apartment_id, a.building_address, a.apartment_number, a.monthly_rent
FROM characters c
LEFT JOIN apartments a ON c.character_id = a.current_tenant_id;


-- RIGHT JOIN Example
-- All apartments, including those without tenants
SELECT c.character_id, c.first_name, c.last_name, c.occupation,
       a.apartment_id, a.building_address, a.apartment_number, a.monthly_rent
FROM characters c
RIGHT JOIN apartments a ON c.character_id = a.current_tenant_id;


-- FULL JOIN Example (MySQL implementation using UNION)
-- All characters and all apartments, with matches where they exist
SELECT c.character_id, c.first_name, c.last_name, c.occupation,
       a.apartment_id, a.building_address, a.apartment_number, a.monthly_rent
FROM characters c
LEFT JOIN apartments a ON c.character_id = a.current_tenant_id
UNION
SELECT c.character_id, c.first_name, c.last_name, c.occupation,
       a.apartment_id, a.building_address, a.apartment_number, a.monthly_rent
FROM characters c
RIGHT JOIN apartments a ON c.character_id = a.current_tenant_id;


-- PostgreSQL native FULL JOIN syntax (for reference)
/*
SELECT c.character_id, c.first_name, c.last_name, c.occupation,
       a.apartment_id, a.building_address, a.apartment_number, a.monthly_rent
FROM characters c
FULL JOIN apartments a ON c.character_id = a.current_tenant_id;
*/


-- Additional examples - Employee/Department context
-- ====================================================================
-- For a typical HR database scenario, we would use:


-- Create Employee/Department tables (commented out)
/*
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- FULL JOIN example for employee/department context
SELECT e.employee_id, e.first_name, e.last_name,
       d.department_id, d.department_name, d.location
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
UNION
SELECT e.employee_id, e.first_name, e.last_name,
       d.department_id, d.department_name, d.location
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;
*/


-- Full Join Filtering Examples
-- ====================================================================


-- Finding only characters without apartments
SELECT c.character_id, c.first_name, c.last_name
FROM characters c
LEFT JOIN apartments a ON c.character_id = a.current_tenant_id
WHERE a.apartment_id IS NULL;


-- Finding only apartments without tenants
SELECT a.apartment_id, a.building_address, a.apartment_number
FROM apartments a
LEFT JOIN characters c ON a.current_tenant_id = c.character_id
WHERE c.character_id IS NULL;


-- Using the FULL JOIN result to find both unmatched cases
SELECT c.character_id, c.first_name, c.last_name, 
       a.apartment_id, a.building_address, a.apartment_number
FROM characters c
LEFT JOIN apartments a ON c.character_id = a.current_tenant_id
WHERE a.apartment_id IS NULL
UNION
SELECT c.character_id, c.first_name, c.last_name, 
       a.apartment_id, a.building_address, a.apartment_number
FROM characters c
RIGHT JOIN apartments a ON c.character_id = a.current_tenant_id
WHERE c.character_id IS NULL;

•	Cross Join

-- CROSS JOIN
-- Cartesian product of two tables
-- It combines each row from the first table with every row from the second table
-- resulting in all possible combinations of rows
CREATE DATABASE cross_join_tutorial;
USE cross_join_tutorial;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);
CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(30) NOT NULL
);
INSERT INTO products (product_id, product_name) VALUES
(1, 'T-shirt'),
(2, 'Jeans'),
(3, 'Sweater'),
(4, 'Jacket');
INSERT INTO colors (color_id, color_name) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green'),
(4, 'Black'),
(5, 'White');
select p.product_name, c.color_name from products p cross join colors c;
CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(10) NOT NULL
);
INSERT INTO sizes (size_id, size_name) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');
-- 5 * 4 * 4 = 80
-- Generate all possible product variations
explain select p.product_name, c.color_name, s.size_name, CONCAT(p.product_name, ' - ', c.color_name, ' - Size ', s.size_name) AS full_product_description from products p
cross join colors c
cross join sizes s
where p.product_name='T-shirt';


•	Self Join

-- Self JOIN in SQL Demonstration
-- This script demonstrates how to use Self JOINs to query hierarchical and relational data
-- within the same table, using an employee management system example.


-- Create and use database
CREATE DATABASE self_join_tutorial;
USE self_join_tutorial;


-- Create employees table with manager_id referencing the same table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    manager_id INT,
    hire_date DATE
);


-- Insert sample employee data with hierarchical management structure
INSERT INTO employees VALUES
(1, 'James', 'Smith', 'CEO', 150000.00, 'Executive', NULL, '2010-01-15'),
(2, 'Sarah', 'Johnson', 'CTO', 140000.00, 'Technology', 1, '2011-03-10'),
(3, 'Michael', 'Williams', 'CFO', 140000.00, 'Finance', 1, '2012-07-22'),
(4, 'Jessica', 'Brown', 'HR Director', 110000.00, 'Human Resources', 1, '2013-05-18'),
(5, 'David', 'Miller', 'Senior Developer', 95000.00, 'Technology', 2, '2014-11-05'),
(6, 'Emily', 'Davis', 'Developer', 80000.00, 'Technology', 5, '2016-08-12'),
(7, 'Robert', 'Wilson', 'Junior Developer', 65000.00, 'Technology', 5, '2019-02-28'),
(8, 'Jennifer', 'Taylor', 'Accountant', 75000.00, 'Finance', 3, '2015-09-17'),
(9, 'Thomas', 'Anderson', 'Accountant', 72000.00, 'Finance', 3, '2017-06-24'),
(10, 'Lisa', 'Martinez', 'HR Specialist', 68000.00, 'Human Resources', 4, '2018-04-30');


-- EXAMPLE 1: Basic Self JOIN to show employees with their managers
-- This joins the employees table with itself to match employees with manager information
SELECT * FROM employees emp 
JOIN employees mgr ON emp.manager_id = mgr.employee_id;


-- EXAMPLE 2: Self JOIN with LEFT JOIN to include all employees (including CEO with no manager)
-- This ensures even employees without managers (like the CEO) are included in results
SELECT * FROM employees emp 
LEFT JOIN employees mgr ON emp.manager_id = mgr.employee_id;


-- EXAMPLE 3: Group employees by department
-- Not a self join, but useful for context
SELECT 
    department,
    COUNT(*) AS employee_count,
    GROUP_CONCAT(CONCAT(first_name, ' ', last_name) ORDER BY employee_id SEPARATOR ', ') AS employees
FROM 
    employees
GROUP BY 
    department;


-- EXAMPLE 4: Find employees who work in the same department
-- Self join to match employees with their colleagues in the same department
-- The condition e1.employee_id < e2.employee_id prevents duplicates and self-matches
SELECT * FROM employees e1 
JOIN employees e2 ON e1.department = e2.department AND e1.employee_id < e2.employee_id;


-- EXAMPLE 5: Find employees who make less than their managers
-- Self join to compare employee salaries with their manager's salary
SELECT * FROM employees emp 
JOIN employees mgr ON emp.manager_id = mgr.employee_id 
WHERE emp.salary < mgr.salary;


-- EXAMPLE 6: Calculate average salary difference between employees and managers by department
-- This shows how to use aggregate functions with self joins
SELECT 
    emp.department,
    COUNT(emp.employee_id) AS num_employees,
    ROUND(AVG(mgr.salary), 2) AS avg_manager_salary,
    ROUND(AVG(emp.salary), 2) AS avg_employee_salary,
    ROUND(AVG(mgr.salary - emp.salary), 2) AS avg_salary_difference
FROM 
    employees emp
JOIN 
    employees mgr ON emp.manager_id = mgr.employee_id
GROUP BY 
    emp.department
ORDER BY 
    avg_salary_difference DESC;


-- IMPORTANT NOTES FOR SELF JOINS:
-- 1. Always use different aliases for each instance of the table.
-- 2. When looking for pairs, use conditions like a.id < b.id to avoid matching rows with themselves.
-- 3. Self JOINs can be resource-intensive. Consider indexing columns used in JOIN conditions.
-- 4. Consider LEFT JOINs when you need to include records without matches (like employees with no manager).

•	Subqueries: Real-World Online Store Database

-- =============================================
-- MySQL Subqueries Demonstration 
-- Online Store Database Example
-- =============================================


-- Create database and set it as the active database
CREATE DATABASE online_store;
USE online_store;


-- =============================================
-- TABLE CREATION
-- =============================================


-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50),
    state VARCHAR(2),
    signup_date DATE
);


-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);


-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Create order_items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- =============================================
-- SAMPLE DATA INSERTION
-- =============================================


-- Insert data into customers
INSERT INTO customers (first_name, last_name, email, city, state, signup_date) VALUES
('John', 'Smith', 'john.smith@example.com', 'New York', 'NY', '2023-01-15'),
('Sarah', 'Johnson', 'sarah.j@example.com', 'Los Angeles', 'CA', '2023-02-20'),
('Michael', 'Brown', 'michael.b@example.com', 'Chicago', 'IL', '2023-03-05'),
('Emily', 'Davis', 'emily.d@example.com', 'Houston', 'TX', '2023-01-30'),
('Robert', 'Wilson', 'robert.w@example.com', 'Phoenix', 'AZ', '2023-02-10'),
('Jennifer', 'Martinez', 'jennifer.m@example.com', 'Philadelphia', 'PA', '2023-03-15'),
('David', 'Anderson', 'david.a@example.com', 'San Antonio', 'TX', '2023-01-25'),
('Lisa', 'Thomas', 'lisa.t@example.com', 'San Diego', 'CA', '2023-02-28'),
('James', 'Jackson', 'james.j@example.com', 'Dallas', 'TX', '2023-03-12'),
('Mary', 'White', 'mary.w@example.com', 'San Jose', 'CA', '2023-01-18');


-- Insert data into products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop Pro', 'Electronics', 1299.99, 25),
('Smartphone X', 'Electronics', 899.99, 50),
('Wireless Headphones', 'Electronics', 199.99, 100),
('Coffee Maker', 'Home Appliances', 79.99, 30),
('Blender', 'Home Appliances', 49.99, 40),
('Running Shoes', 'Sports', 129.99, 75),
('Yoga Mat', 'Sports', 29.99, 120),
('Mystery Novel', 'Books', 14.99, 200),
('Cookbook', 'Books', 24.99, 150),
('Desk Chair', 'Furniture', 149.99, 15);


-- Insert data into orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-04-10 14:30:00', 1499.98),
(2, '2023-04-11 10:15:00', 249.98),
(3, '2023-04-12 16:45:00', 899.99),
(4, '2023-04-13 13:20:00', 1329.98),
(2, '2023-04-14 09:30:00', 49.99),
(5, '2023-04-15 15:10:00', 179.98),
(6, '2023-04-16 11:05:00', 159.98),
(7, '2023-04-17 14:55:00', 39.98),
(8, '2023-04-18 12:40:00', 899.99),
(9, '2023-04-19 16:25:00', 229.98),
(10, '2023-04-20 10:50:00', 279.97),
(1, '2023-04-21 13:35:00', 24.99),
(3, '2023-04-22 15:15:00', 129.99);


-- Insert data into order_items
INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 1299.99),
(1, 3, 1, 199.99),
(2, 5, 1, 49.99),
(2, 7, 1, 29.99),
(2, 9, 1, 24.99),
(3, 2, 1, 899.99),
(4, 1, 1, 1299.99),
(4, 6, 1, 129.99),
(5, 5, 1, 49.99),
(6, 4, 1, 79.99),
(6, 8, 1, 14.99),
(6, 9, 1, 24.99),
(7, 6, 1, 129.99),
(7, 8, 2, 14.99),
(8, 8, 1, 14.99),
(8, 9, 1, 24.99),
(9, 2, 1, 899.99),
(10, 3, 1, 199.99),
(10, 6, 1, 129.99),
(11, 5, 1, 49.99),
(11, 7, 1, 29.99),
(11, 8, 1, 14.99),
(12, 9, 1, 24.99),
(13, 6, 1, 129.99);


-- =============================================
-- BASIC SUBQUERIES
-- =============================================


-- Find all customers who have placed at least one order
SELECT * FROM customers 
WHERE customer_id IN (
    SELECT DISTINCT customer_id FROM orders
);


-- Finding customers who haven't placed orders
SELECT * FROM customers 
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
);


-- Find products with a price higher than average
SELECT * FROM products 
WHERE price > (
    SELECT AVG(price) FROM products
);


-- =============================================
-- GROUP BY WITH HAVING
-- =============================================


-- Find categories that have more than 2 products
SELECT category, COUNT(*) 
FROM products 
GROUP BY category 
HAVING COUNT(*) > 2;


-- =============================================
-- SUBQUERIES IN THE WHERE CLAUSE
-- =============================================


-- Find all orders made by customers from Texas
SELECT * FROM orders 
WHERE customer_id IN (
    SELECT customer_id FROM customers WHERE state = 'TX'
);


-- Alternative using JOIN
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
WHERE c.state = 'TX';


-- =============================================
-- JOIN QUERIES VS SUBQUERIES
-- =============================================


-- Find all customers who ordered electronics products
-- Using JOINs
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE p.category = "Electronics";


-- Using subquery
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.product_id IN (
    SELECT product_id FROM products WHERE category = "Electronics"
);


-- =============================================
-- SUBQUERIES WITH AVERAGE CALCULATION
-- =============================================


-- Customers who spent more than average
-- 1. Calculate the total amount spent by each customer
-- 2. Calculate the average total spending across all customers
-- 3. Identify customers whose total spending exceeds this average


-- First attempt (fails - need alias)
SELECT AVG(total_spent) AS average_customer_spending FROM
 (SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id);


-- Error Code: 1248. Every derived table must have its own alias


-- Correct version with alias
SELECT AVG(total_spent) AS average_customer_spending FROM
 (SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id) AS customer_total;


-- Final query - Find customers who spent more than average
SELECT *, 
    (SELECT SUM(total_amount) FROM orders WHERE customer_id = customers.customer_id) AS total_spent 
FROM customers 
WHERE
    (SELECT SUM(total_amount) FROM orders WHERE customer_id = customers.customer_id) > 
    (SELECT AVG(total_spent) AS average_customer_spending FROM 
        (SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id) AS customer_total);


-- =============================================
-- COMPLEX SUBQUERIES
-- =============================================


-- Find customers who have ordered all products in the 'Electronics' category
SELECT c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = "Electronics"
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.product_id) = (SELECT COUNT(*) FROM products WHERE category="Electronics");


-- Find all customers who are not from California but have purchased the same product-quantity combinations as California customers
SELECT c.email, c.state, p.product_name, oi.quantity FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.state != 'CA' 
AND (oi.product_id, oi.quantity) IN 
    (SELECT oi.product_id, oi.quantity FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE c.state = 'CA');


-- =============================================
-- CORRELATED SUBQUERIES AND EXISTS
-- =============================================


-- Correlated Subqueries
-- A correlated subquery is a subquery that uses values from the outer query. 
-- Unlike regular subqueries which can be executed independently, correlated subqueries are dependent on the outer query and
-- must be re-evaluated for each row processed by the outer query.
-- Can Appear in Various SQL Clauses (SELECT / WHERE / HAVING)


-- Scalar subquery
-- Always Returns Exactly One Value
-- Can Be Independent or Correlated
-- Can Appear in Various SQL Clauses (SELECT / WHERE / HAVING)


-- Find customers who have placed at least one order
-- Using JOIN
SELECT DISTINCT c.customer_id, c.email 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;


-- Using EXISTS
SELECT * FROM customers c 
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
);


-- Find customers who haven't placed any orders
SELECT * FROM customers c 
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
);


-- Products that have never been ordered
SELECT * FROM products p 
WHERE NOT EXISTS (
    SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id
);


-- Find customers who have ordered electronics products
-- Using JOINs
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics';


-- Using EXISTS
SELECT * FROM customers c 
WHERE EXISTS (
    SELECT 1 FROM orders o 
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE c.customer_id = o.customer_id
    AND p.category = 'Electronics'
);






•	UPDATE Mastery: Essential Techniques for Database

-- Create the database
CREATE DATABASE store_inventory;


-- Switch to the new database
USE store_inventory;


-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(20),
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert initial data
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (1, 'Laptop', 'Electronics', 899.99, 25),
    (2, 'Desk Chair', 'Furniture', 149.50, 40),
    (3, 'Coffee Maker', 'Appliances', 79.99, 15),
    (4, 'Headphones', 'Electronics', 129.99, 30),
    (5, 'Desk Lamp', 'Furniture', 24.99, 50);


-- View all products
SELECT * FROM products;


-- Apply 10% discount to all products
UPDATE products SET price = price * 0.9 WHERE product_id > 0;


-- Update specific product prices
UPDATE products
SET price = 999.99
WHERE product_id = 1;
    
UPDATE products
SET price = 89.99, stock_quantity = 20
WHERE product_id = 3;


-- Modify the last_updated column to automatically update on changes
ALTER TABLE products
MODIFY last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


-- View updated products
SELECT * FROM products;
    
-- Update laptop price and quantity
UPDATE products
SET price = 199, stock_quantity = 1
WHERE product_id = 1;
    
-- View products after update
SELECT * FROM products;
    
-- Apply 90% discount to first two products
UPDATE products SET price = price * 0.1 WHERE product_id > 0 LIMIT 2;


-- View products after discount
SELECT * FROM products;
    
-- Attempt to update product_id (will cause a primary key constraint violation)
UPDATE products
SET product_id = 1
WHERE product_id = 2;


-- View final state of products table
SELECT * FROM products;


•	Deleting Row in SQL | Delete vs Truncate in SQL

-- Key differences between TRUNCATE and DELETE:
-- Speed: TRUNCATE is generally faster because it drops and recreates the table rather than removing rows one by one.
-- Logging: DELETE logs individual row removals, while TRUNCATE only logs table deallocation.
-- WHERE clause: DELETE supports WHERE conditions to remove specific rows, while TRUNCATE always removes all rows.
-- Auto-increment: TRUNCATE resets auto-increment counters to their initial value, while DELETE preserves the current counter value.
-- Triggers: DELETE activates DELETE triggers, while TRUNCATE does not fire any triggers.
-- Rollback: DELETE operations can be rolled back in a transaction, while TRUNCATE generally cannot
-- SQL Categories: TRUNCATE is a DDL (Data Definition Language) command, DELETE is a DML (Data Manipulation Language) command

-- SQL DELETE Tutorial
-- Demonstrates how to remove records from a database table
-- DELETE FROM table_name WHERE condition;


-- Create a database for our examples
CREATE DATABASE delete_tutorial;


-- Use the database
USE delete_tutorial;


-- Create a simple product inventory table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);


-- Insert sample data
INSERT INTO products VALUES
(1, 'Laptop', 999.99, 10),
(2, 'Smartphone', 499.99, 25),
(3, 'Headphones', 89.99, 50),
(4, 'Tablet', 349.99, 15),
(5, 'Keyboard', 59.99, 30),
(6, 'Mouse', 29.99, 45),
(7, 'Monitor', 249.99, 12),
(8, 'Printer', 179.99, 8),
(9, 'External Hard Drive', 129.99, 20),
(10, 'USB Drive', 19.99, 100);


-- Verify the data
SELECT * FROM products;


-- Delete a specific record by ID
DELETE FROM products WHERE product_id = 10;


-- Check the result
SELECT * FROM products;


-- Delete records based on a condition
DELETE FROM products WHERE price < 50.00;
-- Note: In safe update mode, this might generate an error if primary key is not used in WHERE clause


-- Delete all records from a table
DELETE FROM products;


-- Check the empty table
SELECT * FROM products;


-- Reinsert sample data
INSERT INTO products VALUES
(1, 'Laptop', 999.99, 10),
(2, 'Smartphone', 499.99, 25),
(3, 'Headphones', 89.99, 50),
(4, 'Tablet', 349.99, 15),
(5, 'Keyboard', 59.99, 30),
(6, 'Mouse', 29.99, 45),
(7, 'Monitor', 249.99, 12),
(8, 'Printer', 179.99, 8),
(9, 'External Hard Drive', 129.99, 20),
(10, 'USB Drive', 19.99, 100);


-- Select expensive products
SELECT * FROM products WHERE price > 300;


-- Delete expensive products
DELETE FROM products WHERE price > 300;


-- Creating a table with a foreign key reference
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Insert an order
INSERT INTO orders VALUES (1, 2, 3);


-- Check the order
SELECT * FROM orders;


-- Try to delete a referenced product (will fail due to foreign key constraint)
DELETE FROM products WHERE product_id = 2; -- ERROR


-- Check the constraint name
SHOW CREATE TABLE orders;


-- Remove the default foreign key constraint
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;


-- Add a new foreign key constraint with CASCADE delete behavior
ALTER TABLE orders 
ADD CONSTRAINT orders_ibfk_1 
FOREIGN KEY (product_id) REFERENCES products(product_id) 
ON DELETE CASCADE;


-- Now deleting the product will also delete related orders
DELETE FROM products WHERE product_id = 2;


-- Check the results
SELECT * FROM products;
SELECT * FROM orders;


-- Insert a new order
INSERT INTO orders VALUES (1, 3, 2);


-- Change the foreign key behavior
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;


-- Add a constraint with SET NULL behavior
ALTER TABLE orders 
ADD CONSTRAINT orders_ibfk_1 
FOREIGN KEY (product_id) REFERENCES products(product_id) 
ON DELETE SET NULL;


-- Now deleting the product will set related order product_id to NULL
DELETE FROM products WHERE product_id = 3;


-- Check the results
SELECT * FROM products;
SELECT * FROM orders;


-- Auto-increment behavior with DELETE
CREATE TABLE auto_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);


-- Insert some data
INSERT INTO auto_example (name) VALUES ('Item 1'), ('Item 2'), ('Item 3');


-- Delete all records
DELETE FROM auto_example;


-- Insert a new record (notice the ID continues from previous sequence)
INSERT INTO auto_example (name) VALUES ('New Item');


-- Check the result
SELECT * FROM auto_example;


-- TRUNCATE TABLE demonstration
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2)
);


-- Insert some employee data
INSERT INTO employees (name, email, hire_date, salary) VALUES
('John Doe', 'john.doe@example.com', '2023-01-15', 65000.00),
('Jane Smith', 'jane.smith@example.com', '2023-02-20', 72000.00),
('Michael Brown', 'michael.brown@example.com', '2023-03-10', 58000.00);


-- Check the employee data
SELECT * FROM employees;


-- Remove all employees using TRUNCATE (faster than DELETE)
TRUNCATE TABLE employees;
-- Alternative syntax: TRUNCATE employees;


-- Check the result (empty table)
SELECT * FROM employees;


-- For comparison, DELETE can also remove all rows
DELETE FROM employees;


•	SQL REPLACE Statement: Combination of INSERT & DELETE

-- REPLACE INTO SQL Demonstration
-- This script demonstrates how REPLACE INTO combines INSERT and DELETE operations
-- to simplify the process of updating or inserting records based on primary or unique key values.


-- Create and use database
CREATE DATABASE replace_demo;
USE replace_demo;


-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Insert initial product data
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (1, 'Laptop', 'Electronics', 899.99, 25),
    (2, 'Smartphone', 'Electronics', 599.99, 50),
    (3, 'Coffee Maker', 'Kitchen', 79.99, 30),
    (4, 'Running Shoes', 'Sportswear', 129.99, 40),
    (5, 'Desk Chair', 'Furniture', 189.99, 15);
    
-- Replace an existing product (ID 5)
-- This will DELETE the existing record and INSERT a new one
REPLACE INTO products (product_id, product_name, category, price, stock_quantity)
VALUES
    (5, 'Mic', 'Electronics', 500, 12);
    
-- Add a new product (ID 6) with REPLACE
-- Since the ID doesn't exist, this works like a regular INSERT
REPLACE INTO products (product_id, product_name, category, price)
VALUES
    (6, 'Camera', 'Electronics', 5000);
    
-- View the updated products table
SELECT * FROM products;


-- Create a second products table with an additional supplier column
CREATE TABLE products2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    supplier VARCHAR(100) -- Extra column
);
    
-- Insert data into products2 including both existing and new product IDs
INSERT INTO products2 (product_id, product_name, category, price, stock_quantity, supplier)
VALUES 
    (2, 'Ultra Smartphone', 'Electronics', 899.99, 40, 'TechCorp'), -- Existing ID (2)
    (4, 'Pro Running Shoes', 'Sportswear', 149.99, 35, 'SportMaster'), -- Existing ID (4)
    (7, 'Bluetooth Speaker', 'Electronics', 79.99, 60, 'SoundWave'), -- New ID
    (8, 'Gaming Mouse', 'Computer Accessories', 49.99, 100, 'GamerZone'), -- New ID
    (9, 'Portable Monitor', 'Electronics', 199.99, 25, 'DisplayTech'); -- New ID
    
-- View both product tables before the bulk REPLACE operation
SELECT * FROM products;
SELECT * FROM products2;


-- Use REPLACE with SELECT to perform bulk replace operation
-- This will update products with IDs 2 and 4, and insert products with IDs 7, 8, and 9
REPLACE INTO products (product_id, product_name, category, price, stock_quantity)
SELECT product_id, product_name, category, price, stock_quantity
FROM products2;
    
-- View the final products table after bulk REPLACE operation
SELECT * FROM products;

