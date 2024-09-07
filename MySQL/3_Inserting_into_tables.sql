-- INSERT INTO THE EMPLOYEES TABLE

INSERT INTO employees ( employee_id, first_name, last_name, hourly_pay, hire_date )
VALUES (1, 'Mike', 'Smith', 45.30, '2024-01-20');

/*
1. How to enter more than 1 row
-   INSERT INTO employees ( employee_id, first_name, last_name, hourly_pay, hire_date )
    VALUES (2, 'David', 'Merver', 38.22, '2024-01-21'),
        (3, 'Lesedi', 'Mohale', 50.00, '2024-01-22'),
        (4, 'Martha', 'Gordon', 35.10, '2024-01-23'),
        (5, 'John', 'Bopape', 40.60, '2024-01-24');

2. How to enter specific components in a row
-   INSERT INTO employees ( employee_id, first_name, last_name )
    VALUES (6, 'Thato', 'Mathsa');

3. How to select all components from the employees table
-   SELECT 
        * 
    FROM employees;

4. How to select some components from the employees table
-   SELECT 
        employee_id, last_name, hire_date 
    FROM employees;

5. How to select specific components from the employees table
-   SELECT 
        *
    FROM employees
    WHERE employee_id = 3;

-    SELECT 
        *
    FROM employees
    WHERE hourly_pay > 40;

6. How to select components without a hire_date null value
-   SELECT
        *
    FROM employees
    WHERE hire_date IS NOT NULL;

*/


-- INSERT THE CURRENT TIME & DATE INTO THE TEST TABLE

INSERT INTO test ( my_date, my_time, my_dt, age)
VALUES (curdate(),curtime(),now(), 21);

/*
7. How to add 5 days to the current date
-   INSERT INTO test ( my_date, my_time, my_dt, age)
    VALUES (curdate()+5,curtime(),now(), 20);

8. How to minus 10 days to the current date
-   INSERT INTO test ( my_date, my_time, my_dt, age)
    VALUES (curdate()-10,curtime(),now(), 31);

9. Adding an age less than 18 with a check constraint 'legal'
-   INSERT INTO test ( my_date, my_time, my_dt, age)
    VALUES (curdate()-10,curtime(),now(), 15);
- You get an error stating check constraint legal is violated

*/


-- INSERT MULTIPLE VALUES INTO THE PRODUCTS TABLE

INSERT INTO products (product_id,product_name,price,quantity)
VALUES (1, 'hamburger', 42.50, 50),
        (2, 'fries', 20.00, 100),
        (3, 'Soda', 29.99, 75),
        (4, 'ice cream', 12.10, 43),
        (5, 'coffee', 16.00, 60);

/*
10. Adding a duplicate value on product_id which has an unique constraint
-   INSERT INTO products (product_id,product_name,price,quantity)
    VALUES (6, 'hamburger', 33.50, 20);
- You get a duplicate entry error for key product_id beacause of the unqiue constraint

11. Adding a null value to price which has a null constraint
-   INSERT INTO products (product_id,product_name,price,quantity)
    VALUES (6, 'hamburger', null, 20);
- You get an error stating price column cannot be nul because of the not null constraint
- You can however add zero because it's a value and not null

12. Adding components without qauntity value because of the default constraint
-   INSERT INTO products (product_id,product_name,price)
    VALUES (7, 'milkshake', 35.60);
- Row was affected without entering a value because of default constraint

*/


-- INSERT INTO CUSTOMERS TABLE

INSERT INTO customers (
    customer_fname,
    customer_lname,
    age)
VALUES 
    ( 'karabo', 'masemola', 25),
    ( 'lethabo', 'hahane', 33),
    ( 'nyiko', 'baloi', 40),
    ( 'senzo', 'chaine', 29),
    ( 'mahlatse', 'lebape', 46),
    ( 'max', 'tshabalala', 20),
    ( 'aphiwe', 'kolisi', 38),
    ( 'eban', 'muera', 57),
    ( 'palesa', 'mapoulo', 50);

/*
13. Adding a duplicate value of customer_id which is a primary key
-   INSERT INTO customers (customer_id,customer_fname, customer_lname)
    VALUES (1,'David', 'Smith');
- You get an error stating adding a duplicate value on customer_id which is a primary key

*/


-- INSERT INTO TRANSACTIONS TABLE

INSERT INTO transactions (txn_name, txn_amount, customer_id)
VALUES  ('cheque', 250.10, 1),
        ('debit', 350.20, 2),
        ('overdraft', 450.30, 3),
        ('debit', 550.40, 4),
        ('cheque', 650.50, 5),
        ('loan', 750.60, 2),
        ('cash', 850.70, NULL),
        ('debit', 950.80, 4),
        ('debit', 1200.10, 2),
        ('overdraft', 3190.30, 3),
        ('debit', 2550.40, 6),
        ('cheque', 1650.50, 5),
        ('loan', 4050.60, 8),
        ('cash', 5850.70, NULL),
        ('debit', 3950.80, 7),
        ('cash', 1050.90, NULL);


-- INSERT INTO SOCCER_GAME TABLE

INSERT INTO soccer_team ( team_name, team_email )
VALUES ( 'real_madrid','rm@gmail.com'),
       ( 'man_city' ,'mc@hotmail.com'),
       ( 'orlando_pirates', 'op@yahoo.com'),
       ( 'alnasarr','aln@gmail.com'),
       ( 'kaizer_chiefs','kc@gmail.com'),
       ( 'man_utd', 'mu@yahoo.com'),
       ( 'barcelona', 'barc@yahoo.com'),
       ( 'alhali', 'alh@otmail.com'),
       ( 'juventus','juv@yahoo.com');

INSERT INTO soccer_manager ( manager_name, manager_number, payment, soccer_id )
VALUES ( 'ancelotti', 0853692451, 1, 1),
       ( 'pep', 0956248510, 1, 2),
       ( 'jose', 0659832599, 0, 3),
       ( 'ronaldo', 0639855624, 1, 4),
       ( 'mutaung', 0699985623, null, 5),
       ( 'erik', 0236551247, 0, 6),
       ( 'xavi', 0125563485, null, 7),
       ( 'neymar', 0599863412, 0, 8),
       ( 'buffon', 0895563896, 1, 9);


-- INSERT INTO EXPENSE TABLE

INSERT INTO expense ( expense_id, expense_name, expense_total)
VALUES (1, 'wages', 0);