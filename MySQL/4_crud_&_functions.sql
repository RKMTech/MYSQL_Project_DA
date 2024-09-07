-- UPDATE COMPONENTS FROM THE EMPLOYEES TABLE

UPDATE employees
SET hourly_pay = 30.90
WHERE employee_id = 6;

/*
1. How to update multiple of columns
-   UPDATE employees
    SET hourly_pay = 33.60,
        hire_date = '2024-01-25'
    WHERE employee_id = 6;

2. How to update the whole column
-   UPDATE employees
    SET hourly_pay = 40 ;

*/


-- DELETE COMPONENTS FROM THE EMPLOYEES TABLE

DELETE FROM employees
WHERE employee_id =1;

/*
3. How to delete all components from the empoyees table
-   DELETE FROM employees;

*/


-- HOW TO UNDO CHANGES WHEN DEALING WITH SENSITIVE INFORMATION

SET AUTOCOMMIT = OFF;

COMMIT;

/*
4. How to restore the changes
-   ROLLBACK;

5. How to save changes
-   COMMIT;

6. How to return to default execution settigs
-   SET AUTOCOMMIT = ON;

*/


-- HOW TO JOIN TWO OR MORE TABLES

SELECT 
    *
FROM transactions
JOIN customers
ON transactions.customer_id = customers.customer_id


/*
7. How to join tables based on the components of the first table
-   SELECT 
    *
    FROM transactions
    LEFT JOIN customers
    ON transactions.customer_id = customers.customer_id

8. How to join tables based on the components of the second table
-   SELECT 
    *
    FROM transactions
    RIGHT JOIN customers
    ON transactions.customer_id = customers.customer_id

9. How to join another copy of a table to itself
-   SELECT
    emp_a.employee_id,
    emp_a.first_name, 
    emp_a.last_name,
    CONCAT ( emp_b.first_name,' ', emp_b.last_name ) AS supervisor
    FROM employees AS emp_a
    INNER JOIN employees AS emp_b
    ON emp_a.supervisor_id = emp_b.employee_id;
- Writing INNER JOIN isn't compulsory because that's the default output of JOIN

*/


-- HOW TO COUNT THE COMPONENTS IN A TABLE

SELECT COUNT (*) AS no_emp
FROM employees;

/*
10. You can specify anything you want to count in the brackets
-   SELECT COUNT (customer_id)
    FROM customers

*/

-- HOW TO GET THE MAXIMUM VALUE IN A TABLE

SELECT MAX(txn_amount) AS maximum_value
FROM transactions; 


-- HOW TO GET THE MINIMUM VALUE IN A TABLE

SELECT MIN(txn_amount) AS minimum_value
FROM transactions; 


-- HOW TO GET THE AVERAGE VALUE IN A TABLE

SELECT AVG(txn_amount) AS average_value
FROM transactions; 


-- HOW TO GET THE TOTAL VALUE IN A TABLE

SELECT SUM(txn_amount) AS total_value
FROM transactions; 


-- HOW TO COMBINE COLUMNS IN A TABLE

SELECT CONCAT ( first_name ,' ', last_name ) AS full_name
FROM employees;

/*
11. How to combine without adding a space after every column when adding mutliple of columns
SELECT CONCAT_WS ( ' ', first_name, last_name, hourly_pay )
FROM employees;

*/

-- ADDING ANOTHER COLUMN TO EXISTING TABLE FOR SELF JOIN EXAMPLE

ALTER TABLE employees
ADD COLUMN supervisor_id INT;

UPDATE employees
SET supervisor_id = 1
WHERE employee_id =2;

UPDATE employees
SET supervisor_id = 1
WHERE employee_id =3;

UPDATE employees
SET supervisor_id = 2
WHERE employee_id =4;

UPDATE employees
SET supervisor_id = 1
WHERE employee_id =5;

UPDATE employees
SET supervisor_id = 2
WHERE employee_id =6;


-- HOW TO DELETE OR UPDATE FROM A PARENT ROW

SET foreign_key_checks = 0;

/*
12. You don't get an error however this isn't always applicable because you'll be referencing something that doesn't exist

13. How to revert back to default FOREIGN KEY settings
-   SET foreign_key_checks = 1;

*/


-- DELETE KAIZER CHIEFS FROM THE SOCCER TEAM TABLE

DELETE FROM soccer_team
WHERE team_name = 'kaizer_chiefs';

/*
14. You don't get an error because of the ON DELETE constraint

*/


-- ADD NEW COLUMN FOR THE VALUE OF QAUNTITY TO PRODUCTS TABLE

ALTER TABLE products
ADD COLUMN value_of_quantity DECIMAL(6,2);


UPDATE products
SET value_of_quantity = price * quantity;

-- ADD 30 NEW MILKSHAKES TO THE PRODUCTS TABLE

UPDATE products 
SET quantity = 30
WHERE product_name = 'milkshake';

/*
15. - The value of quantity column auto-updated because of the trigger created (before_quantity_update)

16. Add a new product hotdog
-   INSERT INTO products ( product_id, product_name, price, quantity )
    VALUES ( 8,'hotdog', 18.99, 80 );
- The value of quantity column auto-updated because of the trigger created (before_quantity_insert)

*/

-- UPDATING EXPENSE TABLE

UPDATE expense
SET expense_total = ( SELECT SUM(hourly_pay) FROM employees)
WHERE expense_name = 'wages';

/*
17. You can use a subquery to use one table data to insert or update into another table data

18. Delete 1 employee from employees table
-   DELETE FROM employees
    WHERE employee_id = 1;
- The expense_total was auto-updated because of the trigger created (after_hourly_pay_delete)

19. Add a new employee to the employees table
-   INSERT INTO employees ( employee_id, first_name, last_name, hourly_pay, hire_date )
    VALUES (1, 'Mike', 'Smith', 45.30, '2024-01-20');
- The expense_total was auto-updated because of the trigger created (after_hourly_pay_insert)

20. Increase Mike's salary by 10
-   UPDATE employees
    SET hourly_pay = hourly_pay + 10 
    WHERE first_name = 'Mike';
- The expense_total was auto-updated because of the trigger created (after_hourly_pay_update)

*/


