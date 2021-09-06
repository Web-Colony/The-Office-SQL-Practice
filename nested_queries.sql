-- Find names of all employees who have sold over 50 000
SELECT  employee.first_name ,employee.last_name
FROM employee
WHERE employee.emp_id IN ( 
       SELECT works_with.emp_id 
       FROM works_with 
       WHERE works_with.total_sales > 50000
);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assuming you know Michael's ID
SELECT  client.client_id,client.client_name
FROM client
WHERE client.branch_id = (
       SELECT  branch.branch_id
       FROM branch
       WHERE branch.mgr_id = 102
);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assuming you DONT'T know Michael's ID
SELECT  client.client_id,client.client_name
FROM client
WHERE client.branch_id = (
       SELECT  branch.branch_id
       FROM branch
       WHERE branch.mgr_id = (
              SELECT  employee.emp_id
              FROM employee
              WHERE employee.first_name = 'Michael'
              AND employee.last_name ='Scott'
              LIMIT 1
       )
);

-- Find the names of employees who work WITH clients handled by the scranton branch
SELECT  employee.first_name,employee.last_name
FROM employee
WHERE employee.emp_id IN ( 
       SELECT works_with.emp_id 
       FROM works_WITH 
)
AND employee.branch_id = (
    select branch_id
    from branch
    where branch_name = "Scranton"
    limit 1
);;

-- Find the names of all clients who have spent more than 100 000 dollars
SELECT  client.client_name
FROM client
WHERE client.client_id IN ( 
       SELECT client_id 
       FROM ( 
              SELECT SUM(works_with.total_sales) AS totals, client_id 
              FROM works_with 
              GROUP BY client_id
       ) AS total_client_sales 
       WHERE totals > 100000 
);
-- without the sum
select client.client_name
from client
where client.client_id In (
    select works_with.client_id
    from works_with
    where works_with.total_sales > 100000
);

