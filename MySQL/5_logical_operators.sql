-- FIND ALL THE CHEQUE TRANSACTIONS ABOVE R500 

SELECT 
    *
FROM transactions
WHERE txn_name = 'cheque'
AND txn_amount > 500;

/*
1. - Both of the conditions must be correct

*/


-- FIND ALL THE LOAN OR OVERDRAFT TRANSACTIONS

SELECT 
    *
FROM transactions
WHERE txn_name = 'loan'
OR txn_name = 'overdraft';

/*
2. - One of the 2 conditions must be correct 

*/


-- FIND ALL THE TRANSACTIONS THAT ARE NOT CASH TRANSACTIONS

SELECT 
    *
FROM transactions
WHERE NOT txn_name = 'cash';

/*
3. Find all the transactions that are not debit and are not cheque
-   SELECT 
    *
    FROM transactions
    WHERE NOT txn_name = 'debit'
    AND NOT txn_name = 'cheque';

*/


-- FIND THE CUSTOMER_ID BETWEEN 2 AND 7

SELECT 
    * 
FROM customers 
WHERE customer_id 
BETWEEN 2 AND 7;

/*
4. - Between is usually used when working with the same column
*/


-- FIND THE CUSTOMERS THE THE FOLLOWING LAST NAMES: Kolisi, Baloi, Lebape, Mapoulo

SELECT 
    *
FROM customers
WHERE customer_lname IN ( 'Kolisi', 'Baloi', 'Lebape', 'Mapoulo' );


-- FIND ALL THE EMPLOYEES WHO'S LAST NAME STARTS WITH THE LETTER M

SELECT
    *
FROM employees
WHERE last_name
LIKE 'M%';

/*
5. Find all the customers who's first name ends with the letter O
-   SELECT
    *
    FROM customers
    WHERE customer_fname
    LIKE '%o';
- You can add more than 1 letter

*/


--  FIND THE PRODUCT NAME THAT HAS A RANDOM CHARCTER FOLLOWED BY ODA
    
SELECT
    *
FROM products
WHERE product_name
LIKE '_oda';

/*
6. Find all the employees who's last name is a character followed by the letter O
-   SELECT
    *
    FROM employees
    WHERE last_name
    LIKE '_o%';

*/


-- RETRIEVE ALL THE TRANSACTIONS FROM HIGHEST TO LOWEST AMOUNT

SELECT 
    *
FROM transactions
ORDER BY txn_amount DESC;

/*
7. Retrieve all the customers from lowest age to the highest age
-   SELECT
    *
    FROM customers
    ORDER BY age ASC;
- The ASC isn't compulsory because that's the default output
*/


-- RETRIEVE 5 RESULTS FROM THE TEST TABLE 

SELECT
    *
FROM test
LIMIT 5;

/*
8. Retrieve 5 results after 2 rows in the test table
-   SELECT
    *
    FROM test
    LIMIT 2,5;

-   SELECT
    *
    FROM test
    LIMIT 5
    OFFSET 2

*/


-- COMBINE ALL THE CUSTOMERS AND EMPLOYEES FIRST AND LAST NAME IN THE SAME COLUMN

SELECT 
    first_name, 
    last_name
FROM employees
UNION
SELECT 
    customer_fname,
    customer_lname
FROM customers;

/*
9. - Union only works when the amount of columns to return are the same

10. - Union removes all the duplicates from the results

11. Combine all the customers and employees first and last name in the same column including duplicates
-   SELECT 
    first_name, 
    last_name
    FROM employees
    UNION ALL
    SELECT 
    customer_fname,
    customer_lname
    FROM customers;
    
*/


-- FIND ALL THE EMPLOYEES WHO EARN MORE THAN THE AVERAGE PAY 

SELECT 
    *
FROM employees
WHERE hourly_pay > ( SELECT AVG(hourly_pay) FROM employees );

/*
12. A subquery is just a query inside a query

13. Retrieve the product name , price and total of the products table
-   SELECT
    product_name,
    price,
    ( SELECT SUM(price) FROM products ) AS total
    FROM products;

14. Find the full names of all the customers with a transaction
-   SELECT 
    CONCAT ( customer_fname,' ', customer_lname) AS customer_fullname
    FROM customers
    WHERE customer_id IN
    (SELECT DISTINCT
    customer_id
    FROM transactions
    WHERE customer_id IS NOT NULL);
- Always use IN operator instead of '=' when returning more than 1 row

*/

