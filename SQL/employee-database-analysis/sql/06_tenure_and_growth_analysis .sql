-- Tenure and growth analysis
SELECT
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.hire_date,
    TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) AS tenure_years
FROM employees e
ORDER BY tenure_years DESC;


-- Average tenure per department (current department assignment only)
SELECT
    d.dept_name,
    ROUND(AVG(TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE())), 1) AS avg_tenure_years,
    COUNT(DISTINCT e.emp_no) AS employee_count
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'   -- current department assignment
GROUP BY d.dept_name
ORDER BY avg_tenure_years DESC;


-- Salary growth per employee: first salary vs. most recent salary
WITH first_salary AS (
    SELECT emp_no, salary AS starting_salary
    FROM salaries s1
    WHERE from_date = (
        SELECT MIN(from_date) FROM salaries s2 WHERE s2.emp_no = s1.emp_no
    )
),
latest_salary AS (
    SELECT emp_no, salary AS current_salary
    FROM salaries s1
    WHERE to_date = '9999-01-01'
)
SELECT
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    fs.starting_salary,
    ls.current_salary,
    (ls.current_salary - fs.starting_salary) AS total_growth,
    ROUND(((ls.current_salary - fs.starting_salary) / fs.starting_salary) * 100, 2) AS growth_pct
FROM employees e
INNER JOIN first_salary fs ON e.emp_no = fs.emp_no
INNER JOIN latest_salary ls ON e.emp_no = ls.emp_no
ORDER BY growth_pct DESC
LIMIT 20;

--  Top 10 employees with the biggest single-year raise
-- Compares each salary record to the one immediately before it per employee
WITH salary_changes AS (
    SELECT
        emp_no,
        salary,
        from_date,
        LAG(salary) OVER (PARTITION BY emp_no ORDER BY from_date) AS previous_salary
    FROM salaries
)
SELECT
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    sc.from_date AS raise_date,
    sc.previous_salary,
    sc.salary AS new_salary,
    (sc.salary - sc.previous_salary) AS raise_amount
FROM salary_changes sc
INNER JOIN employees e ON e.emp_no = sc.emp_no
WHERE sc.previous_salary IS NOT NULL
ORDER BY raise_amount DESC
LIMIT 10;

-- Average time (in years) between title changes, i.e. rough promotion cadence
WITH title_changes AS (
    SELECT
        emp_no,
        title,
        from_date,
        LEAD(from_date) OVER (PARTITION BY emp_no ORDER BY from_date) AS next_change_date
    FROM titles
)
SELECT
    ROUND(AVG(TIMESTAMPDIFF(YEAR, from_date, next_change_date)), 2) AS avg_years_between_title_changes
FROM title_changes
WHERE next_change_date IS NOT NULL;
