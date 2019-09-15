/* Creating all the tables */

-- Departments
CREATE TABLE departments (
    dept_no varchar(200)   NOT NULL,
    dept_name varchar(200)   NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Employees
CREATE TABLE employees (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(200)   NOT NULL,
    last_name varchar(200)   NOT NULL,
    gender varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
	PRIMARY KEY (emp_no)
);

-- Department Manager
CREATE TABLE dept_manager (
    dept_no varchar(2000)   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Deparment Employee
CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
	dept_no varchar(200)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

-- Salaries
CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary float   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Titles
CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar(200)   NOT NULL,
    form_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
