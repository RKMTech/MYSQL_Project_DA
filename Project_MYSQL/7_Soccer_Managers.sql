/*
QUESTION : Find the managers who paid registeration fees for their teams
WHY ? We want to know the teams that are already in the tournament
BONUS : Include the soccer teams name
*/

SELECT
    manager_name,
    team_name
FROM soccer_manager
JOIN soccer_team
ON soccer_manager.soccer_id = soccer_team.soccer_id
WHERE payment = 1

/*
The managers who paid registeration fees for their teams insight:
- Administrative Compliance: Ensuring that registration fees are paid is crucial for team participation in leagues and competitions. Managers should be diligent in handling these fees to avoid disruptions.
- Operational Status: Teams with unpaid registration fees might encounter operational challenges, which could affect their performance and standing in their respective tournament.
- To ensure accurate compliance, further investigation into each team’s registration status is recommended.



~ RESULTS

[
  {
    "manager_name": "ancelotti",
    "team_name": "real_madrid"
  },
  {
    "manager_name": "pep",
    "team_name": "man_city"
  },
  {
    "manager_name": "ronaldo",
    "team_name": "alnasarr"
  },
  {
    "manager_name": "buffon",
    "team_name": "juventus"
  }
]

*/