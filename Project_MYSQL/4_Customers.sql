/*
QUESTION : Find the youngest and oldest customer
WHY ? We running a competition and we want to send them prices
BONUS : Retrive them ascending by first name
*/

SELECT 
   *
FROM customers
WHERE age = ( SELECT MIN(age) FROM customers )
OR age = ( SELECT MAX(age) FROM customers )
ORDER BY customer_fname;

/*
The youngest and oldest customer insight:
- Max Tshabalala is the youngest customer. At 20 years old, this customer might be at the early stage of their purchasing journey. Understanding their preferences and behaviors could be valuable, especially if targeting younger demographics is a part of your marketing strategy.
- Eban Muera is the oldest customer. At 57 years old, this customer may have different needs, preferences, and purchasing behaviors compared to younger customers. Tailoring products, services, or marketing strategies to cater to older adults could enhance customer satisfaction and loyalty.



~ RESULTS

[
  {
    "customer_id": 8,
    "customer_fname": "eban",
    "customer_lname": "muera",
    "Age": 57
  },
  {
    "customer_id": 6,
    "customer_fname": "max",
    "customer_lname": "tshabalala",
    "Age": 20
  }
]

*/
