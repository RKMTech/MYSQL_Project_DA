/*
QUESTIONS : Find the top 5 customers with the most number of transactions
WHY ? We want to give them a 5% discounts for supporting our business
BONUS : Include the full names of the customers
*/

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

/*
The top 5 customers with the most number of transactions insight:
- Top Customer: Lethabo Hahane with 9 transactions stands out as a high-engagement customer. Tailor strategies to retain and reward such valuable customers.
- Frequent Customers: Those with 6 transactions (Nyiko Baloi, Senzo Chaine, Mahlatse Lebape) are also significant. Focus on personalized strategies to maintain their loyalty.
- Opportunity for Growth: For customers with fewer transactions, such as Karabo Masemola, explore opportunities to increase engagement and transaction frequency.



~ RESULTS

[
  {
    "customer_id": 2,
    "full_name": "lethabo hahane",
    "no_of_txn": "9"
  },
  {
    "customer_id": 3,
    "full_name": "nyiko baloi",
    "no_of_txn": "6"
  },
  {
    "customer_id": 4,
    "full_name": "senzo chaine",
    "no_of_txn": "6"
  },
  {
    "customer_id": 5,
    "full_name": "mahlatse lebape",
    "no_of_txn": "6"
  },
  {
    "customer_id": 1,
    "full_name": "karabo masemola",
    "no_of_txn": "3"
  }
]

*/