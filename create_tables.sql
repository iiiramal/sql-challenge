-- Create the tables in the following order: 
-- Titles
-- Employees
-- Departments
-- Department_Manager
-- Department_Employee
-- Salaries

create table titles (
title_id varchar PRIMARY KEY
,title varchar
);

select * from titles

create table employees(
emp_no int primary key
,emp_title_id varchar
,birth_date	date
,first_name	varchar
,last_name varchar
,sex varchar
,hire_date date
,foreign key (emp_title_id) references titles(title_id)
);

select * from employees

create table departments(
dept_no varchar primary key
,dept_name varchar
);

select * from departments;

create table department_manager(
dept_no varchar
,emp_no int
,foreign key (dept_no) references departments(dept_no)
,foreign key (emp_no) references employees(emp_no)
,primary key (dept_no, emp_no)
);

select * from department_manager;

create table department_emp(
emp_no int
,dept_no varchar
,foreign key (emp_no) references employees(emp_no)
,foreign key (dept_no) references departments(dept_no)
,primary key (emp_no,dept_no)
);

select * from department_emp;

create table salaries(
emp_no int primary key
,salary int
,foreign key (emp_no) references employees(emp_no)
);

select * from salaries;