USE employees;

-- Top 10 Highest Paid Current Employees
SELECT e.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 10;
