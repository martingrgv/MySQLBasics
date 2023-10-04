<h1 align="center">MySQL - Basics</h1>
<h4 align="center">Credits: BroCode (https://www.youtube.com/watch?v=5OdVJbNCSso)</h3>
<br />

# Database
```
CREATE DATABASE databaseName;
USE databaseName;
DROP DATABASE databaseName;

ALTER DATABASE databaseName READ ONLY = 0;
```
# Tables
```
CREATE TABLE my_table (
    my_id INT,
    my_name VARCHAR(20),
    my_price DECIMAL(4, 2)
    my_date DATE
);
RENAME TABLE my_table TO my_table1;
DROP TABLE my_table;
```
## ALTER
```
ALTER TABLE my_table
ADD my_email VARCHAR(50)
RENAME COLUMN my_email TO email
MODIFY COLUMN email VARCHAR(100)
FIRST
AFTER my_date
DROP my_email
```
## INSERT ROWS
```
INSERT INTO my_table (id, my_name, my_price, my_date)
VALUES (1, "Name", "20.00", "2023-10-02"),
       (2, "Name", "20.00", "2023-10-02");
```
## SELECT
```
SELECT * FROM my_table;
SELECT my_name FROM my_table WHERE id = 1;
```
## Update & Delete
### UPDATE
```
Update my_table
SET my_name = "Ivan"
WHERE id = 2;
```
### DELETE
```
DELETE FROM my_table WHERE id = 1;
DELETE FROM my_table;
```
## Autocommit, Commit and Rollback
```
SET AUTOCOMMIT = ON; 
COMMIT;
ROLLBACK;
```
## CURRENT_DATE(), CURRENT_TIME(), NOW()
```
INSERT INTO my_table (my_date)
VALUES(CURRENT_DATE());
```
## Constraints
### UNIQUE, NOT NULL
```
CREATE TABLE products (
    id INT,
    product VARCHAR(20) UNIQUE
    price DECIMAL(6, 2) NOT NULL
);

ALTER TABLE products
ADD CONSTRAINT
UNIQUE(id);
```
### CHECK Constraint
```
CREATE TABLE my_taxes(
    id INT,
    tax DECIMAL(4, 2),
    CONSTRAINT chk_tax_price CHECK (tax > 10.00)
);

ALTER TABLE my_taxes
ADD CONSTRAINT chk_tax_price
CHECK (tax > 10.00);

DROP CHECK chk_tax_price;
```
### DEFAULT
```
CREATE TABLE my_taxes(
    id INT,
    tax DECIMAL(4, 2) DEFAULT 0
);

ALTER TABLE my_taxes
ALTER tax SET DEFAULT 0;
```
### PRIMARY KEY (Only one primary key allowed)
```
CREATE TABLE my_transactions(
    id INT PRIMARY KEY,
    amount DECIMAL (10, 2) DEFAULT 0,
    date_time DATETIME DEFAULT NOW();
);

ALTER TABLE my_transactions
ADD CONSTRAINT 
PRIMARY KEY (id);
```
### AUTO_INCREMENT
```
CREATE TABLE my_transactions(
    id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10, 2) DEFAULT 0,
    date_time DATETIME DEFAULT NOW()
);

ALTER TABLE my_transactions
AUTO_INCREMENT = 1000;
```
### FOREIGN KEY
```
CREATE TABLE my_transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10, 2) DEFAULT 0,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

ALTER TABLE transactions
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
DROP FOREIGN KEY transactions_ibfk_1;
```
## JOINS (LEFT JOIN, INNER JOIN, RIGHT JOIN)
```
SELECT *
FROM transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;
```
# Functions
```
SELECT CONCAT(first_name, " ", last_name) AS Full_name FROM employees;
https://www.w3schools.com/mysql/mysql_ref_functions.asp
```
# Logical operators (AND, OR, NOT)
```
SELECT * FROM employees WHERE hourly_pay > 50 AND hourly_pay < 200 OR hourly_pay = 100 AND NOT;
```
# Clauses
## Wild card characters (%, _)
```
SELECT * FROM employees WHERE first_name LIKE "s%";
SELECT * FROM employees WHERE timedate LIKE "_____-01-__";
```
# ORDER BY
```
SELECT * FROM employees ORDER BY fist_name ASC;
SELECT * FROM employees ORDER BY hourly_pay DESC;
```
# LIMIT
```
SELECT * FROM employees LIMIT 3;
```
# UNION
```
SELECT * FROM income
UNION
SELECT * FROM expenses;
```
# SELF JOINS
```
SELECT a.employee_id, CONCAT(a.first_name, a.last_name) AS employee, b.employee_id, CONCAT(b.first_name, b.last_name) AS referred
FROM employees AS a
INNER JOIN employees AS b
ON b.referral_id = a.employee_id;
```
# Views
```
CREATE VIEW employee_attendance AS 
SELECT first_name, last_name
FROM employees;

SELECT * FROM employee_attendance;

DROP employee_attendance;
```
# Indexes
``` 
CREATE INDEX first_name_idx
ON donators(donator_name);

SHOW INDEXES FROM donators;
SELECT * FROM donators WHERE donator_name = "BogOS";

ALTER TABLE donators
DROP INDEX first_name_idx;
```
# Subqueries
```
SELECT first_name, last_name, hourly_pay,
(SELECT AVG(hourly_pay) FROM employees) AS avg_pay
FROM employees;

SELECT donator_name
FROM donators
WHERE donator_id IN
(SELECT donator_id
FROM transactions
WHERE donator_id IS NOT NULL);
```
# GROUP BY
```
SELECT SUM(amount) AS total, date_time
FROM transactions
GROUP BY date_time
HAVING SUM(amount) iS NOT NULL;
```
# ROLLUP
```
SELECT SUM(amount) AS total_per_day, date_time 
FROM Transactions
GROUP BY date_time WITH ROLLUP;
```
# ON DELETE
```
-- ON DELETE SET NULL = When a FK is deleted, replace FK with NULL
-- ON DELETE CASCADE = When a FK is deleted, delete row
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_id
FOREIGN KEY (donator_id) REFERENCES donators(donator_id)
ON DELETE SET NULL;

DROP FROM donators
WHERE donator_id = 1;
```
# Stored Procedurs
```
-- Stored procedurs = is prepared SQL code that you can save great if there's a query that you write often
DELIMITER $$
CREATE PROCEDURE get_donators_transactions()
BEGIN
	SELECT donators.donator_id, donator_name, amount, date_time
	FROM transactions
	INNER JOIN donators
	ON transactions.donator_id = donators.donator_id
	ORDER BY donators.donator_id ASC;
END $$
DELIMITER ;

CALL get_donators_transactions();

DROP PROCEDURE get_donators_transactions();

DELIMITER $$
CREATE PROCEDURE find_employee(IN id INT)
BEGIN
	SELECT *
	FROM employees
	WHERE employee_id = id;
END $$
DELIMITER ;

CALL find_employee(1);
```
# Triggers
```
-- Trigger = When an event happens, do something
--           ex. (INSERT, UPDATE, DELETE)
--           checks data, handles errors, auditing tables
CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW 
SET NEW.salary = (NEW.hourly_pay * 2080);

SHOW TRIGGERS;

UPDATE employees
SET hourly_pay = 180
WHERE employee_id = 1;

SELECT first_name, hourly_pay, salary
FROM employees;
```
