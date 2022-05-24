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

create temporary table kalpana_1825.payment_table as select * from payment;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
use kalpana_1825;
describe payment_table;

alter table payment_table modify amount decimal(8,2);
update payment_table set amount = (amount * 100);
select amount from payment_table;
alter table payment_table modify amount int;

-- Q3 Find out how the current average pay in each department compares to the overall current pay for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?
use employees;
drop table if exists kalpana_1825.dept_comp;
create temporary table kalpana_1825.dept_comp as 
select avg(salary) as avg_salary, departments.dept_name from salaries
join dept_emp using (emp_no)
join departments using (dept_no) 
where salaries.to_date > now()
and dept_emp.to_date > now()
group by departments.dept_name
order by avg(salary) desc;

use kalpana_1825;

select * from kalpana_1825.dept_comp;

select * ,
    (avg_salary - (SELECT AVG(salary) FROM employees.salaries where to_date > now()))
    /
    (SELECT stddev(salary) FROM employees.salaries where to_date > now()) AS zscore
FROM kalpana_1825.dept_comp;





