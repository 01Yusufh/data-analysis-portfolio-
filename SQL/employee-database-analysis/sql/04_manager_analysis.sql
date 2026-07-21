USE employees;

-- Current Department Managers
SELECT e.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
       d.dept_name
FROM dept_manager dm
JOIN employees e
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';
