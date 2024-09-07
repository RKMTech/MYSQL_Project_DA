-- CREATE AN EMPLOYEES TABLE

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(40),
    last_name VARCHAR(30),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);


/*
1. How to get complete information about the table
-   DESC employees;

2. How to add a column to the created table
-   ALTER TABLE employees
    ADD cell_phone_no VARCHAR(12);

3.How to rename a column from the created table
-   ALTER TABLE employees
    RENAME COLUMN cell_phone_no TO phone_number;

4. How to move the position of a column on the table created
-   ALTER TABLE employees
    MODIFY phone_number VARCHAR(12)
    AFTER last_name;

5. How to drop the column from the created rable
-   ALTER TABLE employees
    DROP COLUMN phone_number;

*/


-- CREATE A TEST TABLE

CREATE TABLE test (
    my_date DATE,
    my_time TIME,
    my_dt DATETIME,
    age INT,
    CONSTRAINT legal CHECK ( age >= 18)
);

/*
6. How to add check constraint if you forgot to add it while creating the table
-   ALTER TABLE test
    ADD CONSTRAINT legal CHECK ( age >= 18);

7. How to remove check constraint
-   ALTER TABLE test
    DROP CHECK legal;
- test_chk_1 if you didnt add name
*/


-- CREATE A PRODUCTS TABLE

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR (50) UNIQUE,
    price DECIMAL (6,2) NOT NULL,
    quantity INT DEFAULT 0
);

/*
6. How to add unique constraint if you forgot to add it while creating the table
-   ALTER TABLE products
    ADD CONSTRAINT
    UNIQUE (product_name);

7. How to add not null constraint if you forgot to add it while creating the table
-   ALTER TABLE products
    MODIFY price DECIMAL (6,2) NOT NULL;

8. How to add default value if you forgot to add it while creating the table
-   ALTER TABLE products
    ALTER quantity SET DEFAULT 0

*/


-- CREATE A CUSTOMERS TABLE

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_fname VARCHAR (30) NOT NULL,
    customer_lname VARCHAR (30) NOT NULL,
    Age INT
);

/*
9. How to add primary key if you forgot to add it while creating the table
-   ALTER TABLE customers
    ADD CONSTRAINT
    PRIMARY KEY (customer_id)
- You can only have 1 primary key per table

10. How to remove primary key
-   ALTER TABLE customers
    DROP primary key;

11. How to add auto_increment if you forgot to add it while creating the table
-   ALTER TABLE customers
    MODIFY customer_id INT PRIMARY KEY AUTO_INCREMENT;
- You can add an auto_increment only on primary keys

12. Set primary key to begin at different value
-   ALTER TABLE customers
    AUTO_INCREMENT = 100;

13. How to remove auto_increment
-   ALTER TABLE customers
    MODIFY customer_id INT;
    
*/


-- CREATE A TRANSACTION TABLE

CREATE TABLE transactions (
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    txn_name VARCHAR (100) NOT NULL,
    txn_amount INT NOT NULL,
    txn_date TIMESTAMP DEFAULT NOW(),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

/*
14. How to add foreign key if you forgot to add it while creating the table
-   ALTER TABLE transactions
    ADD CONSTRAINT fk_cstm_id
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
- Make sure the column your referencing is unique or a primary key

15. How to remove foreign key
-   ALTER TABLE transactions
    DROP FOREIGN KEY fk_cstm_id;
- transactions_ibfk_1 if you didnt add name
- You have to drop the foreign key before deleting or updating components from the other table

*/


-- CREATE A VIRTUAL SHEET OF ONLY DEBIT TRANSACTIONS

CREATE VIEW debit_transactions AS 
SELECT 
    *
FROM transactions
WHERE txn_name = 'debit';

/*
16. - Views are not real tables but the can be interacted with as if they are

17. - Creating a view helps you not to repeat data when you don't have to

18. - Creating a view is better than creating another table because you won't have to update 2 tables

19. - All the changes made on the table will reflect on the view

20. How to remove a view
-   DROP VIEW debit_transactions;

*/


-- CREATE AN INDEX FOR THE EMPLOYEES TABLE

CREATE INDEX employee_id_idx
ON employees (employee_id);

/*
21. Indexes help find values within a specific column more quickly

22. UPDATE takes more time, SELECT takes less time

23. You can create more than one index on a table

24. How to create a multi-column index
-   CREATE INDEX customer_lname_fname_idx
    ON customers (customer_lname,customer_fname);
- It's important to start with the more important column because Mysql has a left most prexif for indexes

25. How to remove an index from a table
-   ALTER TABLE customers
    DROP INDEX customer_lname_fname_idx;

*/


-- CREATE A SOCCER TEAM AND MANAGERS SIGN UP TABLE

CREATE TABLE soccer_team (
    soccer_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) UNIQUE NOT NULL,
    team_email VARCHAR (50)
);

CREATE TABLE soccer_manager (
    manager_name VARCHAR(30) NOT NULL,
    manager_number INT NOT NULL,
    Payment BOOLEAN,
    soccer_id INT,
    FOREIGN KEY (soccer_id) REFERENCES soccer_team (soccer_id)
    ON DELETE SET NULL
);

/*
26. ON DELETE SET NULL will add a NULL value whenever a foreign key is deleted

27.How to add ON DELETE SET NULL if you forgot to add it while creating the table
-   ALTER TABLE soccer_manager
    ADD CONSTRAINT fk_soccer_id
    FOREIGN KEY (soccer_id) REFERENCES soccer_team (soccer_id)
    ON DELETE SET NULL
- If soccer_id is already a foreign key without the on deelete set null constraint, you have to drop it first

28. Create a table and make sure the entire row is deleted whenever a foreign key is deleted
-   CREATE TABLE soccer_manager (
    manager_name VARCHAR(30) NOT NULL,
    manager_number INT NOT NULL,
    Payment BOOLEAN,
    soccer_id INT,
    FOREIGN KEY (soccer_id) REFERENCES soccer_team (soccer_id)
    ON DELETE CASCADE
);
- ON DELETE CASCADE will deleted the entire row whenever a foreign key is deleted

29.How to add ON DELETE CASCADE if you forgot to add it while creating the table
-   ALTER TABLE soccer_manager
    ADD CONSTRAINT fk_soccer_id
    FOREIGN KEY (soccer_id) REFERENCES soccer_team (soccer_id)
    ON DELETE CASCADE

*/

-- CREATE AN EXPENSE TABLE

CREATE TABLE expense (
    expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(6,2)
);
