USE employees;

-- Number of Employees in Each Department
SELECT d.dept_name,
       COUNT(de.emp_no) AS total_employees
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY total_employees DESC;

-- Average Current Salary by Department
SELECT d.dept_name,
       ROUND(AVG(s.salary), 2) AS average_salary
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN salaries s
ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC;
