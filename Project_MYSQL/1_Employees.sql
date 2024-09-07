/*
QUESTION : Who are the most paid employees per hour
- List the ones hired after the 22nd of January 2024
- WHY ? Finance depertment requests to compare hourly pay
- BONUS : Include the supervisors full names
*/

SELECT 
    employee_1.*,
    CONCAT( employee_2.first_name, ' ', employee_2.last_name) AS supervisor
FROM employees AS employee_1
JOIN employees AS employee_2
ON employee_1.supervisor_id = employee_2.employee_id
WHERE employee_1.hire_date > '2024-01-22' 
ORDER BY employee_1.hourly_pay DESC;

/*

Most Paid Employee Per Hour Insight:
- John Bopape is the top earner among the employees listed, with an hourly pay rate of $40.60.
- The differences in hourly pay might reflect various factors including job responsibilities, market rates, or individual negotiations.
- The hiring sequence does not always directly correlate with pay rates, as seen with John earning more despite being hired after Martha.



~ RESULTS

[
  {
    "employee_id": 5,
    "first_name": "John",
    "last_name": "Bopape",
    "hourly_pay": "40.60",
    "hire_date": "2024-01-24",
    "supervisor_id": 1,
    "supervisor": "Mike Smith"
  },
  {
    "employee_id": 4,
    "first_name": "Martha",
    "last_name": "Gordon",
    "hourly_pay": "35.10",
    "hire_date": "2024-01-23",
    "supervisor_id": 2,
    "supervisor": "David Merver"
  },
  {
    "employee_id": 6,
    "first_name": "Thato",
    "last_name": "Mathsa",
    "hourly_pay": "33.60",
    "hire_date": "2024-01-25",
    "supervisor_id": 2,
    "supervisor": "David Merver"
  }
]

*/

