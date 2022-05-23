use join_example_db;
-- Q2 Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
select * from users
join roles on users.id=roles.id;
-- 4
select * from users
left join roles on users.id=roles.id;
-- 6
select * from users
right join roles on users.id=roles.id;
-- 4


-- Q3 Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
select count(role_id) from users
join roles on users.id=roles.id
group by role_id;

use employees;

-- Q2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE de.to_date = '9999-01-01';
  
  -- Q3 Find the name of all departments currently managed by women.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE de.to_date = '9999-01-01' and e.gender = "F";

-- Q4 Find the current titles of employees currently working in the Customer Service department.
SELECT count(e.emp_no), t.title
FROM employees AS e
JOIN titles AS t
  ON t.emp_no = e.emp_no
join dept_emp as de
  on de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE de.to_date > now()
  and t.to_date > now()
  and d.dept_name = "customer service"
  group by t.title;
  
  -- Q5 Find the current salary of all current managers.
  SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name, s.salary
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
join salaries as s
  on s.emp_no = e.emp_no
  WHERE s.to_date = '9999-01-01'
  and de.to_date = "9999-01-01";
  
-- Q6 Find the number of current employees in each department.
select d.dept_no, d.dept_name, count(e.emp_no) as num_employees
from employees as e
join dept_emp as de
  on de.emp_no = e.emp_no
join departments as d
  on d.dept_no = de.dept_no
  group by d.dept_no;
  
  -- Q7 Which department has the highest average salary? Hint: Use current not historic information.
select d.dept_name, avg(s.salary) as "average_salary"
from employees as e
join dept_emp as de
  on de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
join salaries as s
  on s.emp_no = e.emp_no
  WHERE s.to_date = '9999-01-01'
  and de.to_date = "9999-01-01"
  group by d.dept_name
order by average_salary desc
limit 1;

-- Q8 Who is the highest paid employee in the Marketing department?
select first_name, last_name
from employees as e
join dept_emp as de
	on de.emp_no = e.emp_no
join departments as d
	on d.dept_no = de.dept_no
join salaries as s
	on e.emp_no = s.emp_no
where de.to_date > now()
	and d.dept_name = "Marketing"
order by s.salary desc
limit 1;

-- Q9 Which current department manager has the highest salary?
select first_name, last_name, s.salary as "salary", d.dept_name as "department"
from employees as e
join dept_manager as dm
	on dm.emp_no = e.emp_no
join departments as d
	on d.dept_no = dm.dept_no
join salaries as s
	on s.emp_no = e.emp_no
where dm.to_date > now()
order by salary desc
limit 1;

-- Q10 Determine the average salary for each department. Use all salary information and round your results.
select dept_name, round(avg(s.salary)) as "average_salary"
from employees as e
join dept_emp as de
	on de.emp_no = e.emp_no
join departments as d
	on d.dept_no = de.dept_no
join salaries as s
	on s.emp_no = e.emp_no
group by dept_name;




