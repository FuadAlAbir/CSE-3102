/*
    AUTHOR: FUAD AL ABIR
    DATE: 25 JUNE 2019
    INSTRUCTOR: DR. MD. ALI HOSSAIN
*/ 

-- 1/2 --
SELECT emp_name FROM employee, department WHERE dept_name = 'Engineering/GIS' AND employee.dept_id = department.dept_id;

-- 3 --
SELECT emp_name FROM employee, paydetails WHERE DOJ > '2013-01-01' AND employee.emp_id = paydetails.emp_id;

-- 4 --
SELECT emp_name FROM employee, paydetails WHERE basic * 1.35 > 10000 AND employee.emp_id = paydetails.emp_id;
