use employees;

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select * from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name asc;
-- Irena Reutenauer and Vidya Simmen

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select * from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name, last_name;
-- Irena Acton and Vidya Zweizig

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select * from employees
where first_name in ('Irena','Vidya','Maya')
order by last_name, first_name;
-- Irena Acton and Maya Zyda

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
select * from employees
where last_name like "E%E"
order by emp_no;
-- 899 results 10021 Ramzi Erde, and 499648 Tadahiro Erde

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
select * from employees
where last_name like "E%E"
order by hire_date desc;
-- newest employee = Teiji Eldridge, oldest employee = Sergi Erde

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
select * from employees
where (hire_date > "1989-12-31"
and hire_date < "2000-01-01")
and birth_date like "____-12-25"
order by birth_date asc, hire_date desc;
-- 362 results. oldest hired last = Khun Bernini. youngest hired first = Douadi Pettis