USE employees;

-- Top 5 Highest-Paid Employees in Each Department
SELECT *
FROM (
    SELECT
        d.dept_name,
        e.emp_no,
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
        s.salary,
        RANK() OVER (
            PARTITION BY d.dept_name
            ORDER BY s.salary DESC
        ) AS salary_rank
    FROM employees e
    JOIN dept_emp de
        ON e.emp_no = de.emp_no
    JOIN departments d
        ON de.dept_no = d.dept_no
    JOIN salaries s
        ON e.emp_no = s.emp_no
    WHERE de.to_date = '9999-01-01'
      AND s.to_date = '9999-01-01'
) ranked
WHERE salary_rank <= 5
ORDER BY dept_name, salary_rank;

-- Employees Earning Above Their Department Average
WITH department_average AS (
    SELECT
        de.dept_no,
        AVG(s.salary) AS avg_salary
    FROM dept_emp de
    JOIN salaries s
        ON de.emp_no = s.emp_no
    WHERE de.to_date = '9999-01-01'
      AND s.to_date = '9999-01-01'
    GROUP BY de.dept_no
)

SELECT
    d.dept_name,
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.salary,
    ROUND(da.avg_salary, 2) AS department_average
FROM employees e
JOIN dept_emp de
    ON e.emp_no = de.emp_no
JOIN salaries s
    ON e.emp_no = s.emp_no
JOIN department_average da
    ON de.dept_no = da.dept_no
JOIN departments d
    ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
  AND s.salary > da.avg_salary
ORDER BY d.dept_name, s.salary DESC;