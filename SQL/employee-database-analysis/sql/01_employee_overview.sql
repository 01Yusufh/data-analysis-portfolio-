USE employees;

-- Total Number of Employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Male vs Female Employees
SELECT gender,
       COUNT(*) AS employee_count
FROM employees
GROUP BY gender;
