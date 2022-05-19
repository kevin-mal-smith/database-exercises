use employees;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
select * from employees
where first_name in ('Irena','Vidya','Maya');
-- 709 results

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
select * from employees
where first_name = "Irena"
or first_name = "Vidya"
or first_name = "Maya";
-- 709 results, same as Q2

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
select * from employees
where (first_name = "Irena"
or first_name = "Vidya"
or first_name = "Maya")
and gender = "M";
-- 441 results

-- Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
select * from employees
where last_name like "e%";
-- 7330 results

-- Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
select * from employees
where last_name like "E%"
or last_name like "%E";
-- 30723 results

-- Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
select * from employees
where last_name like "e%e";
-- 899 employees last names begin and end with "e"
select * from employees
where last_name like "%e";
-- 24292 employees last names end with "e"alter

-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
select * from employees
where hire_date > "1989-12-31"
and hire_date < "2000-01-01";
-- 135214 results

-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
select * from employees
where birth_date like "____-12-25";
-- 842 results

-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
select * from employees
where (hire_date > "1989-12-31"
and hire_date < "2000-01-01")
and birth_date like "____-12-25";
-- 362 results

-- Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
select * from employees
where last_name like "%q%";
-- 1873 results

-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
select * from employees
where last_name like "%Q%"
and last_name NOT LIKE "%QU%";
-- 547 result
