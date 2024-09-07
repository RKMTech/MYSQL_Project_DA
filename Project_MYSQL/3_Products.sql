/*
QUESTIONS : Find all the products that need to be bought
- Calculate the average value of the stock
WHY ? We want to restock on products with low quantity
BONUS : Quantity must be 50 or below
*/

SELECT 
    product_name,
    AVG(value_of_quantity) AS avg_value_stock
FROM products
WHERE quantity <= 50 
GROUP BY product_name;

/*
Products that need to be bought insight:
- Inventory Management: Regularly review stock levels and adjust orders based on sales trends and lead times to maintain optimal inventory levels.
- Hamburger: Although at the threshold, hamburgers should be monitored closely. If the demand is high, consider ordering a small additional quantity to ensure you don’t run out.
- Milkshake: Due to the quantity being well below 50, it is important to reorder milkshake promptly to prevent stockouts and potential loss of sales.
- Ice Cream: This product also requires reordering soon, as its quantity is just below the 50 threshold.
- Customer Demand: Analyze historical sales data to determine if the current quantities are adequate or if higher safety stock levels are needed, especially for high-demand items.



~ RESULTS

[
  {
    "product_name": "hamburger",
    "avg_value_stock": "2125.000000"
  },
  {
    "product_name": "ice cream",
    "avg_value_stock": "520.300000"
  },
  {
    "product_name": "milkshake",
    "avg_value_stock": "1068.000000"
  }
]

*/
