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

![QuickDBD-export](https://github.com/jessnguyen9/sql-challenge/assets/128268114/7c0b16a7-001e-47f9-9dcb-22f1793ce431)

## Challenges
1. **Incomplete Data**
* Challenge: Many records had missing values, especially in fields like salary and hire date. This made it difficult to perform accurate analyses without first cleaning the data.
* Solution: I used SQL queries to identify and remove rows with missing values, ensuring that the final dataset was complete and accurate.
2. **Data Consistency Across Sources**
* Challenge: The data came from different sources (CSV files), and there were inconsistencies in formats.
* Solution: I standardized data formats during the data preparation phase by converting values into uniform formats using SQL functions like DATE_FORMAT() and UPPER() to standardize text fields.
3. **Large Dataset Handling**
* Challenge: As the dataset grew, certain queries took longer to execute, especially when joining multiple tables or aggregating large amounts of data.
* Solution: I optimized queries by indexing frequently used columns and breaking down complex queries into smaller, more manageable parts.
  
## What Would I Do Differently?
1. **Use of Advanced SQL features**

In future projects, I would incorporate more advanced SQL features such as window functions (e.g., ROW_NUMBER(), RANK()) to perform more complex analyses like ranking employees based on tenure or salary within each department.
2. **Automated Reporting**

Instead of manually generating reports, I would consider automating the reporting process by using tools like Tableau or Power BI. This would allow for real-time data visualization and easier communication.

## Conclusion
This repository demonstrates the ability to effectively perform data engineering and analysis tasks, using SQL to extract, manipulate, and analyze employee data. The tasks include data modeling with an ERD, schema creation, data import, and various SQL queries for analytical tasks.
