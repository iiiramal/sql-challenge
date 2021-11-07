--List the following details of each employee: employee number, last name, first name, sex, and salary.

select
e.emp_no
,last_name
,first_name
,sex
,salary
from employees e
join salaries s on e.emp_no = s.emp_no
order by 2,3; 

--List first name, last name, and hire date for employees who were hired in 1986.

select
first_name
,last_name
,hire_date
from employees
where date_part ('year', hire_date) = 1986
order by 3,2,1;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select 
dm.dept_no
,d.dept_name
,e.emp_no
,e.last_name
,e.first_name
from departments d
join department_manager dm on d.dept_no = dm.dept_no
join employees e on dm.emp_no = e.emp_no
order by 2,4,5;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
e.emp_no
,e.last_name
,e.first_name
,d.dept_name
from employees e
join department_emp de on e.emp_no = de.emp_no 
join departments d on de.dept_no = d.dept_no
order by 4,2,3;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select
first_name
,last_name
,sex
from employees
where 
1=1 
and first_name = 'Hercules'
and last_name like 'B%'
order by 2;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select
e.emp_no
,last_name
,first_name
,d.dept_name
from employees e
join department_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where de.dept_no = 'd007'
order by 2,3;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select
e.emp_no
,last_name
,first_name
,d.dept_name
from employees e
join department_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where 
1=1 
and (de.dept_no = 'd007' or de.dept_no = 'd005')
order by 4,2,3;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
last_name
,count(last_name)
from employees
group by last_name
order by 1 desc
