/* Data Analysis */

/* 1. List the following details of each employee: 
	employee number, 
	last name, 
	first name, 
	gender, and 
	salary. */
-- First I am checking that there's only one salary per employee (maybe an employee was promoted, it may have two entries)
SELECT COUNT(DISTINCT emp_no) 
FROM salaries

SELECT COUNT(*)
FROM salaries
-- We have only one salary per employee, we can merge the data sets 

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;


/* 2.  List employees who were hired in 1986. */
SELECT first_name, last_name, hire_date  
FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;


/* 3. List the manager of each department with the following information: 
	department number, 
	department name, 
	the manager's employee number, 
	last name, 
	first name, and 
	start and end employment dates. */

SELECT d.dept_no, d.dept_name, e.last_name, e.first_name, dm.from_date, dm.to_date 
FROM dept_manager dm
	LEFT JOIN departments d  
		ON dm.dept_no = d.dept_no 
	INNER JOIN employees e
		ON e.emp_no = dm.emp_no 
	

/* 4. List the department of each employee with the following information: 
	employee number, 
	last name, 
	first name, and 
	department name. */
	
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	LEFT JOIN dept_emp de  
		ON e.emp_no = de.emp_no 
	LEFT JOIN departments d
		ON de.dept_no = d.dept_no 


/* 5. List all employees whose first name is "Hercules" and last names begin with "B." */

SELECT e.first_name, e.last_name
FROM employees e
WHERE first_name = 'Hercules' AND
	  last_name LIKE 'B%'


/* 6.  List all employees in the Sales department, including their: 
	employee number, 
	last name, 
	first name, and 
	department name. */

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	LEFT JOIN dept_emp de  
		ON e.emp_no = de.emp_no 
	LEFT JOIN departments d
		ON de.dept_no = d.dept_no 
WHERE dept_name = 'Sales'


/* 7. List all employees in the Sales and Development departments, including their 
	employee number, 
	last name, 
	first name, and 
	department name. */
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	LEFT JOIN dept_emp de  
		ON e.emp_no = de.emp_no 
	LEFT JOIN departments d
		ON de.dept_no = d.dept_no 
WHERE dept_name = 'Sales' OR dept_name = 'Development' 


/* 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. */
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

