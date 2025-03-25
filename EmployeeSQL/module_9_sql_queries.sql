-- Module 9 SQL challenge - Employee's Queries

-- 1)
SELECT 
  e.emp_no,
  e.last_name,
  e.first_name,
  e.sex 
FROM employees AS e
	LEFT JOIN salaries as s
	ON(e.emp_no = s.emp_no)
ORDER BY e.emp_no;

--2)
SELECT 
	 last_name,
  	 first_name,
	 hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
--ORDER BY hire_date
;

--3)
SELECT 
  dm.dept_no,
  d.dept_name,
  e.emp_no,
  e.last_name,
  e.first_name
 FROM employees as e
 	RIGHT JOIN dept_manager AS dm
	ON (dm.emp_no = e.emp_no)
	LEFT JOIN departments AS d
	ON (dm.dept_no = d.dept_no)
;

--4)
SELECT 
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name,
  dm.dept_no
FROM employees AS e
	LEFT JOIN dept_manager AS dm
	ON (e.emp_no = dm.emp_no)
	INNER JOIN departments as d
	ON (dm.dept_no = d.dept_no)
;

--5)
SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;

--6)
SELECT 
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employees AS e
	INNER JOIN  dept_emp AS de
	ON (e.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
;

--7
SELECT 
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employees AS e
	INNER JOIN  dept_emp AS de
	ON (e.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales','Development')
;

--8)
SELECT last_name, COUNT(last_name) AS count_last_names
FROM employees
GROUP BY last_name
ORDER BY count_last_names DESC;
