use employees;

show tables;

describe employees;

-- the employees table has 6 columns with 4 data types. two dates, two varchar, one int PK, and one enum

-- which table(s) do you think have a numeric type column? dept_emp, dept_manager, employees, salaries, titles

-- which table(s) do you think have a string type column? departments, dept_emp, dept_manager, employees, titles

-- which table(s) do you think have a date type column? all but departments

-- what is the relationship between the employees and department tables? the department and employees tables are linked by the dept_emp table. the employees table has a primary index of the emp_no column, and the department table has a primary key of the dept_no column. the dept_emp table's primary key is made up of a composite of those 2 columns.



show create table dept_manager;