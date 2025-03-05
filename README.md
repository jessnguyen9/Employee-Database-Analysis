# Data Analysis and Engineering: Employee Database Insights

## Context
In this project, I conducted an in-depth analysis using SQL to extract valuable insights from an employee dataset. The data covered various employee-related details such as employee numbers, departments, salaries, and hire dates. The goal was to uncover key trends and actionable insights that could help drive improvements in areas like staffing, salary planning, and departmental management.

The analysis was carried out independently, where I focused on data acquisition, preparation, and analysis, followed by translating these findings into meaningful recommendations.

## Technique Used
1. **Data Acquisition**
The data for this project was gathered from multiple sources, including CSV files containing detailed employee records. I imported these files into SQL databases to facilitate structured querying. The process involved:
* Data Import: Loading CSV files into SQL tables.
* Data Sources: Extracting data from multiple spreadsheets and organizing it into a relational database to ensure consistency across different tables.
2. **Data Preparation**
* Data Cleaning:
  * Remove rows with missing or incomplete values to avoid misleading insights.
  * Standardized values (e.g., ensuring consistent formats for dates and names).
* Data Manipulation
  * Converted data into appropriate types.
  * Created new features such as employee tenure by calculating the difference between hire date and current date.
3. **Data Analytics**
Once the data was clean and organized, I used SQL to conduct a series of analytical queries. These queries provided insights into:
* **Employee Information:** List the employee number, last name, first name, sex, and salary.

`
SELECT employee_number, last_name, first_name, sex, salary FROM Employees;
`
* **Hired in 1986:** List the first name, last name, and hire date for employees hired in 1986.

`
SELECT first_name, last_name, hire_date FROM Employees WHERE YEAR(hire_date) = 1986;
`
* **Department Managers:** List the manager of each department along with department and employee information.

`
SELECT D.manager_employee_number, D.department_number, D.department_name, E.employee_number, E.last_name, E.first_name
FROM Departments D
JOIN Employees E ON D.manager_employee_number = E.employee_number;
`
* **Employee Department Information:**  List department number, employee number, name, and department name.

`
SELECT E.department_number, E.employee_number, E.last_name, E.first_name, D.department_name
FROM Employees E
JOIN Departments D ON E.department_number = D.department_number;
`
* **Sales Department Employees:** List employees in the Sales department.
  
`
SELECT E.employee_number, E.last_name, E.first_name
FROM Employees E
JOIN Departments D ON E.department_number = D.department_number
WHERE D.department_name = 'Sales';
`
* **Sales and Development Department Employees:** List employees in the Sales and Development departments.
  
`
SELECT E.employee_number, E.last_name, E.first_name, D.department_name
FROM Employees E
JOIN Departments D ON E.department_number = D.department_number
WHERE D.department_name IN ('Sales', 'Development');
`
* **Frequency of Last Names:** List the frequency counts of employee last names.
  
`
SELECT last_name, COUNT(*) AS frequency FROM Employees GROUP BY last_name ORDER BY frequency DESC;
`

4. **Data Modeling**
In this step, I inspected the provided CSV files and created an Entity Relationship Diagram (ERD) to represent the relationships between tables. The ERD was exported using QuickDBD and visualizes the tables' structure.

Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables.
![QuickDBD-export](https://github.com/jessnguyen9/sql-challenge/assets/128268114/7c0b16a7-001e-47f9-9dcb-22f1793ce431)

**Data Engineering**
1. Use the provided information to create a table schema for each of the six CSV files.
2. Import each CSV file into its corresponding SQL table.

**Data Analysis**
1. List the employee number, last name, first name, sex, and salary of each employee.
[data analysis (1).csv](https://github.com/jessnguyen9/sql-challenge/files/11815104/data.analysis.1.csv)
2. List the first name, last name, and hire date for the employees who were hired in 1986.
[data analysis (2).csv](https://github.com/jessnguyen9/sql-challenge/files/11815280/data.analysis.2.csv)
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
[data analysis (3).csv](https://github.com/jessnguyen9/sql-challenge/files/11815279/data.analysis.3.csv)
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
[data analysis (4).csv](https://github.com/jessnguyen9/sql-challenge/files/11815278/data.analysis.4.csv)
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
[data analysis (5).csv](https://github.com/jessnguyen9/sql-challenge/files/11815277/data.analysis.5.csv)
6. List each employee in the Sales department, including their employee number, last name, and first name.
[data analysis (6).csv](https://github.com/jessnguyen9/sql-challenge/files/11815276/data.analysis.6.csv)
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
[data analysis (7).csv](https://github.com/jessnguyen9/sql-challenge/files/11815275/data.analysis.7.csv)
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
[data analysis (8).csv](https://github.com/jessnguyen9/sql-challenge/files/11815274/data.analysis.8.csv)
