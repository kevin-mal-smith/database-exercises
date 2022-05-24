-- Q1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

use employees;
create temporary table kalpana_1825.employees_with_departments as 
select first_name, last_name, dept_name
from employees 
join dept_emp using (emp_no)
join departments using (dept_no);
use kalpana_1825;
select * from employees_with_departments;

-- Q1 a: Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(40);
-- Q1 b:Update the table so that full name column contains the correct data
update employees_with_departments set full_name = concat(first_name, " ", last_name);
-- Q1 c: Remove the first_name and last_name columns from the table.
alter table employees_with_departments drop first_name, drop last_name;
-- Q1 d: What is another way you could have ended up with this same table?
-- select create temporary table kalpana_1825.employees_with_departments as select concat(first_name, " ", last_name), dept_name from employees join dept_emp using (emp_no) join departments using (dept_no);

-- Q2 Create a temporary table based on the payment table from the sakila database.
use sakila;

create temporary table kalpana_1825.payments as select * from payment;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
use kalpana_1825;
describe payments;

alter table payments modify amount decimal(8,2);
update payments set amount = round(amount * 100);
select amount from payments;
