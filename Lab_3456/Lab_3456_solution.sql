/*
    AUTHOR: FUAD AL ABIR
    DATE: 09 JULY 2019
    INSTRUCTOR: DR. MD. ALI HOSSAIN
*/ 

-- 1 --   
SELECT DISTINCT emp_name FROM employee, dept, ft_pt_work, project WHERE ft_pt_work.project_id = project.project_id AND employee.emp_id = ft_pt_work.emp_id AND employee.dept_id = dept.dept_id AND dept.dept_name = 'Engineering' AND project.project_name = 'Googong Subdivision' AND project.project_location = 'Googong';

-- 2 --
SELECT emp_name FROM employee, ft_pt_work, project, dept WHERE employee.emp_id = ft_pt_work.emp_id AND  dept.dept_id = ft_pt_work.dept_id AND dept.dept_name = 'Labor' AND works_date BETWEEN '2012-06-01' AND '2012-06-01' + INTERVAL 7 DAY AND project.project_name = 'Googong Subdivision' AND project_location = 'Googong' AND ft_pt_work.project_id = project.project_id  GROUP BY emp_name HAVING SUM(num_of_hours) > 20;
-- or
SELECT emp_name, employee.emp_id, SUM(num_of_hours) AS TOTAL_HOUR FROM employee, ft_pt_work, project, dept WHERE employee.emp_id = ft_pt_work.emp_id AND  dept.dept_id = ft_pt_work.dept_id AND dept.dept_name = 'Labor' AND works_date BETWEEN '2012-06-01' AND '2012-06-01' + INTERVAL 7 DAY AND project.project_name = 'Googong Subdivision' AND project_location = 'Googong' AND ft_pt_work.project_id = project.project_id  GROUP BY emp_id HAVING TOTAL_HOUR > 20;

-- 3 --
SELECT DISTINCT emp_name, CONCAT(street_no, ' ', street_name, ', ', city, ', ', zip_code) AS address FROM employee, address, dept, ft_pt_work, project WHERE employee.emp_id = address.emp_id AND dept.dept_id = employee.dept_id AND ft_pt_work.emp_id = employee.emp_id AND project.project_id = ft_pt_work.project_id AND project_location = 'Burton Canberra' AND dept.dept_location <> 'Canberra';

-- 4 --
SELECT DISTINCT tmp.emp_name FROM (SELECT DISTINCT employee.emp_id, emp_name FROM employee, dept, ft_pt_work, project WHERE ft_pt_work.project_id = project.project_id AND employee.emp_id = ft_pt_work.emp_id AND project.project_name = 'Googong Subdivision') AS tmp, ft_pt_work, project  WHERE ft_pt_work.project_id = project.project_id AND tmp.emp_id = ft_pt_work.emp_id  AND project.project_name = 'Burton Highway';

-- 5 --
CREATE OR REPLACE VIEW test_view AS SELECT DISTINCT emp_name, dept_name, type_of_work, basic, basic * .45 AS allowance, basic * (.09 + .15) AS deduction, basic * (1 + .45 - (.09 + .15)) AS salary  FROM employee, dept, ft_pt_work, salary WHERE employee.dept_id = dept.dept_id AND employee.emp_id = salary.emp_id;




