-- Gender pay gap 
-- Objective: Compare average salaries by gender across
--            departments and quantify the pay gap (%)


-- Average salary by gender, per department (current salaries only)
SELECT
    d.dept_name,
    e.gender,
    ROUND(AVG(s.salary), 0) AS avg_salary,
    COUNT(DISTINCT e.emp_no) AS employee_count
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01'
GROUP BY d.dept_name, e.gender
ORDER BY d.dept_name, e.gender;

-- Gender pay gap (%) per department
-- Positive gap_pct = male average is higher; negative = female average is higher
WITH gender_salary AS (
    SELECT
        d.dept_name,
        e.gender,
        AVG(s.salary) AS avg_salary
    FROM employees e
    INNER JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
    INNER JOIN departments d ON de.dept_no = d.dept_no
    INNER JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01'
    GROUP BY d.dept_name, e.gender
)
SELECT
    m.dept_name,
    ROUND(m.avg_salary, 0) AS male_avg_salary,
    ROUND(f.avg_salary, 0) AS female_avg_salary,
    ROUND(((m.avg_salary - f.avg_salary) / f.avg_salary) * 100, 2) AS gap_pct
FROM gender_salary m
INNER JOIN gender_salary f ON m.dept_name = f.dept_name
WHERE m.gender = 'M' AND f.gender = 'F'
ORDER BY gap_pct DESC;
