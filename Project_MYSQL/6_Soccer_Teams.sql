/*
QUESTION : Find the teams that use @gmail.com emails
WHY ? Google is running a competition and we want to inform them
BONUS : The soccer ID must be an even number
*/

SELECT
    *
FROM soccer_team
WHERE team_email LIKE '%@gmail.com'
AND soccer_id % 2 = 0

/*
The teams that use @gmail.com emails and have soccer ID even numbers
- Although there are other teams using emails ending with @gmail.com, unfortunetly they have odd-numbered soccer ID in this data set and do not match this criterion.
- The even-numbered soccer ID (4) is unique in this dataset. If there are more teams with even-numbered IDs, they would also match this criterion. 
- Alnasarr is the only team that meets both criteria.



~ RESULTS

[
  {
    "soccer_id": 4,
    "team_name": "alnasarr",
    "team_email": "aln@gmail.com"
  }
]

*/