use employees;

-- Q1 Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
select concat(first_name, " ", last_name) as full_name, dept_no, hire_date, to_date, 
(select case to_date
	when to_date > now() then 1
    else 0 end) as "is_current_employee"
from employees
	join dept_emp using (emp_no);
    
-- Q2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

select first_name, last_name 
(case 
	when last_name like 'a-h%' then "A-H"
    when last_name like 'i-q%' then "I-Q"
    else "R-Z" end) as 'alpha_group'
from employees;


