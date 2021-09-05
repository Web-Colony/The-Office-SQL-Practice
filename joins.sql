
-- Add the extra branch
INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);

-- Select * 
-- from A
-- join B
-- on A.id = B.id;
-- A => LEFT Table
-- B => RIGHT Table

-- get all rows where the condition is satisfied
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
INNER branch   
ON employee.emp_id = branch.mgr_id;

-- get all rows where the condition is satisfied
-- and other rows from the left table which is employee
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT branch   
ON employee.emp_id = branch.mgr_id;

-- get all rows where the condition is satisfied
-- and other rows from the right table which is branch
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT branch   
ON employee.emp_id = branch.mgr_id;