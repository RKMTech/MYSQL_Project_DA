/*
QUESTION : Find the test entries that happened after the 25th
- Only show the ones without my_dt NULL values
WHY ? We want to recall them to re-write
BONUS : Only show 3 entries
*/

SELECT 
    *
FROM test
WHERE my_date > '2024-08-25'
AND my_dt IS NOT NULL
LIMIT 3;

/*
Test entries that happened after the 25th insight:
- All provided test entries are valid as they occurred after August 25, 2024.
- The entries are clustered closely together in terms of time on each date, suggesting they might be from a batch or series of tests performed around the same time.
- No specific "age" data is provided, so we can't analyze the duration or timing of the tests relative to any specific criteria.
- The entries are close together in both date and time, which could indicate regular or automated testing.



~ RESULTS

[
  {
    "my_date": "2024-08-27",
    "my_time": "13:33:39",
    "my_dt": "2024-08-27 13:33:39",
    "age": null
  },
  {
    "my_date": "2024-08-27",
    "my_time": "13:33:53",
    "my_dt": "2024-08-27 13:33:53",
    "age": null
  },
  {
    "my_date": "2024-08-28",
    "my_time": "13:41:26",
    "my_dt": "2024-08-28 13:41:26",
    "age": null
  }
]

*/