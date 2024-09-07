# Introduction
**SQL** (Structured Query Language) is a fundamental tool for accessing, managing, and analyzing data stored in relational databases. **SQL** provides a structured approach to querying and manipulating data, which is crucial for drawing meaningful insights from complex datasets.

SQL queries ? [project_MYSQL folder](/Project_MYSQL/)
# Background
This is one of my projects to showcase my progress in **SQL** and my improvement to solve complex queries 

### The questions I wanted to answer through my SQL queries were:

1. Who are the most paid employee per hour ?
2. Find the test entries that happened after the 25th ?
3. Find all the products that need to be bought ?
4. Find the youngest and oldest customer ?
5. Find the top 5 customers with the most number of transactions ?
6. Find the teams that use @gmail.com emails ?
7. Find the managers who paid registeration fees for their teams ?

# Tools I Used
- SQL

- MySQL

- Visual Studio Code

- Git & Github
# The Analysis
These queries collectively aim to help me enhance my SQL skills as they include a whole lot of complex CRUD, functions, logical operators and many more queries.

Here's how I approached one of the question:
### 5. Find the top 5 customers with the most number of transactions
```sql
SELECT 
    transactions.customer_id,
    CONCAT (customer_fname,' ', customer_lname) as full_name,
    COUNT(*) AS no_of_txn
FROM transactions
JOIN customers
On transactions.customer_id = customers.customer_id
GROUP BY customer_id
ORDER BY no_of_txn DESC
LIMIT 5;
````
The top 5 customers with the most number of transactions insight:
- ** Top Customer: Lethabo Hahane with 9 transactions stands out as a high-engagement customer. Tailor strategies to retain and reward such valuable customers.
- ** Frequent Customers: Those with 6 transactions (Nyiko Baloi, Senzo Chaine, Mahlatse Lebape) are also significant. Focus on personalized strategies to maintain their loyalty.
- ** Opportunity for Growth: For customers with fewer transactions, such as Karabo Masemola, explore opportunities to increase engagement and transaction frequency.

# Conclusion

Overall, this project underscores the importance of SQL in the data analytics field and provides valuable insights for navigating career development and opportunities within this dynamic industry. Not only did I enchance my SQL skills but I learned new skills along the way which will be detrimental for the career I am trying to pursuit .