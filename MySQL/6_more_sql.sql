-- WHAT IS THE AMOUNT OF PEOPLE THAT TOOK A TEST PER DAY

SELECT
    my_date,
    COUNT(*) AS no_of_people
FROM test
GROUP BY my_date;

/*
1. - Make sure the column your grouping by is selected

2. What is the maximum and minimum amount per transaction name
-   SELECT 
    txn_name,
    max(txn_amount) AS max_amount,
    min(txn_amount) AS min_amount
    FROM transactions
    GROUP BY txn_name;
- You can use more than one aggregate function

3. The WHERE cause doesn't work in conjuction with GROUP BY, instead we use the HAVING clause

4. Find all the transaction with three or more transaction per name
-   SELECT 
    txn_name,
    COUNT(*) AS no_of_transactions
    FROM transactions
    GROUP BY txn_name
    HAVING no_of_transactions >= 3;

*/


-- WHAT IS THE TOTAL AMOUNT OF TRANSACTIONS PER NAME AND GRAND TOTAL

SELECT 
    txn_name,
    SUM(txn_amount) AS total
FROM transactions
GROUP BY txn_name
WITH ROLLUP;

/*
5. ROLLUP is an extention of the GROUP BY clause that produces another row and shows the grand total

*/


-- CREATE A STORE PROCEDURE FOR A QUERY YOU OFTEN WRITE

DELIMITER $$
CREATE PROCEDURE get_txns()
BEGIN
    SELECT 
        * 
    FROM transactions;
END $$
DELIMITER ;

/*
6. - A delimiter is a special character used to signal the end of a query

7. - You can change it temporarily to seperate queries from one another
- Always remember to change it back

8. Procedure can help reduce network traffic and increase performance but it increase memory usage of every connection

9. How to invoke the procedure
-   CALL get_txns();

10. How to remove the procedure
-   DROP PROCEDURE get_txns;

11. How to pass in data in a procedure
-   DELIMITER $$
    CREATE PROCEDURE find_txn( IN id INT)
    BEGIN
        SELECT 
            *
        FROM transactions
        WHERE txn_id = id; 
    END $$
    DELIMITER ;

12. How to invoke the procedure
-   CALL find_txn(3);

13. How to pass in more than one data in a procedure
-   DELIMITER $$
    CREATE PROCEDURE find_emp( IN fname varchar(40), IN lname varchar(30))
    BEGIN
        SELECT 
            *
        FROM employees
        WHERE first_name = fname
        OR last_name = lname ; 
    END $$
    DELIMITER ;
- The datatype must be the same as the ones you used when creating a table
- Use DESC table_name in case you forgot

14. How to invoke the procedure
-   CALL find_emp ("David", "Gordon");

*/


-- CREATE A TRIGGER TO AUTO-UPDATE VALUE OF QAUNTITY WHENEVER STOCK IS BOUGHT OR SOLD

CREATE TRIGGER before_quantity_update
BEFORE UPDATE ON products
FOR EACH ROW
SET NEW.value_of_quantity = ( NEW.price * NEW.quantity );

/*
15. How to remove trigger
-   DROP TRIGGER before_quantity_update;

16. Create a trigger to auto-update the value of qauntity whenever we insert a new product
-   CREATE TRIGGER before_quantity_insert
    BEFORE INSERT ON products
    FOR EACH ROW
    SET NEW.value_of_quantity = ( NEW.price * NEW.quantity );

17. Create a trigger to auto-update expense total whenever an employee is deleted
-   CREATE TRIGGER after_hourly_pay_delete
    AFTER DELETE ON employees
    FOR EACH ROW
    UPDATE expense
    SET expense_total = expense_total - OLD.hourly_pay
    WHERE expense_name = 'wages';

18. Create a trigger to auto-update expense total whenever an employee is inserted
-   CREATE TRIGGER after_hourly_pay_insert
    AFTER INSERT ON employees
    FOR EACH ROW
    UPDATE expense
    SET expense_total = expense_total + NEW.hourly_pay
    WHERE expense_name = 'wages';

19. Create a trigger to auto-update expense total whenever an employee is updated
-   CREATE TRIGGER after_hourly_pay_update
    AFTER UPDATE ON employees
    FOR EACH ROW
    UPDATE expense
    SET expense_total = expense_total + ( NEW.hourly_pay - OLD.hourly_pay )
    WHERE expense_name = 'wages';

*/
