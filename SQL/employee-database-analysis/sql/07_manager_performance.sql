-- Manager performance analysis

-- Team size per current manager
SELECT
    dm.emp_no AS manager_id,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    d.dept_name,
    COUNT(de.emp_no) AS team_size
FROM dept_manager dm
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN dept_emp de ON de.dept_no = dm.dept_no AND de.to_date = '9999-01-01'
WHERE dm.to_date = '9999-01-01'
GROUP BY dm.emp_no, manager_name, d.dept_name
ORDER BY team_size DESC;

-- Do current managers earn more than their department's average salary?
WITH dept_avg AS (
    SELECT
        de.dept_no,
        AVG(s.salary) AS avg_dept_salary
    FROM dept_emp de
    INNER JOIN salaries s ON de.emp_no = s.emp_no AND s.to_date = '9999-01-01'
    WHERE de.to_date = '9999-01-01'
    GROUP BY de.dept_no
)
SELECT
    d.dept_name,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    s.salary AS manager_salary,
    ROUND(da.avg_dept_salary, 0) AS dept_avg_salary,
    ROUND(s.salary - da.avg_dept_salary, 0) AS salary_gap
FROM dept_manager dm
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN salaries s ON dm.emp_no = s.emp_no AND s.to_date = '9999-01-01'
INNER JOIN dept_avg da ON dm.dept_no = da.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY salary_gap DESC;


