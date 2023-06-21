-- List the employee number, last name, first name, sex, and salary, for each employee.
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name,employees.last_name,employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name
FROM employees, dept_manager, departments
WHERE dept_manager.dept_no = departments.dept_no 
AND dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departments, employees, dept_emp
WHERE dept_emp.emp_no = employees.emp_no
AND dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name,employees.last_name,employees.sex
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no,employees.last_name,employees.first_name
FROM employees, dept_emp,departments
WHERE employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = departments.dept_no
AND departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name,employees.first_name, departments.dept_name
FROM employees, dept_emp,departments
WHERE employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = departments.dept_no
AND departments.dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


















































