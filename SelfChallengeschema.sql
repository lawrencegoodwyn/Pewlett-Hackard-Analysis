Select
		e.first_name,
		e.last_name,
		e.emp_no,
		tt.title,
		tt.from_date,
		tt.to_date
		
INTO retirement_titles

FROM employees as e

INNER JOIN titles as tt
ON e.emp_no = tt.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
--Unique Titles table
SELECT DISTINCT ON (emp_no) emp_no, first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT* FROM unique_titles;

--Retiring Titles table
SELECT DISTINCT ON (title) title
FROM unique_titles
GROUP BY title ORDER BY title DESC
INTO retiring_titles;




Select title, COUNT (title)
INTO 
retiring_titles
FROM unique_titles
GROUP BY title ORDER BY count DESC;

SELECT * FROM retiring_titles;

DROP TABLE retiring_titles;