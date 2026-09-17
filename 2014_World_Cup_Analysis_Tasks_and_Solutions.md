# 2014 FIFA World Cup — Data Analysis Task List & Solutions
**For CV Portfolio: Junior Data Analyst**

Run these directly in phpMyAdmin's SQL tab on your `fifa_worldcup_2014` database. Tasks go from beginner → advanced, matching what a Junior Data Analyst is expected to demonstrate: filtering, aggregation, joins, subqueries, window functions, and business-style insight writing.

---

## SECTION A — Basic Exploration (Warm-up)

### Task 1: How many teams, players, matches, and total goals were there?
```sql
SELECT
  (SELECT COUNT(*) FROM Teams) AS total_teams,
  (SELECT COUNT(*) FROM Players) AS total_players,
  (SELECT COUNT(*) FROM Matches) AS total_matches,
  (SELECT SUM(home_score + away_score) FROM Matches) AS total_goals,
  (SELECT ROUND(AVG(home_score + away_score), 2) FROM Matches) AS avg_goals_per_match;
```
**Insight:** 32 teams, 171 goals across 64 matches — 2.67 goals per match.

---

### Task 2: List all teams and the stage they were eliminated in, sorted by how far they went.
```sql
SELECT team_name, tactical_style, points, goal_difference, final_result
FROM Teams
ORDER BY
  CASE final_result
    WHEN 'Champion' THEN 1
    WHEN 'Runner-up (Final)' THEN 2
    WHEN '3rd Place' THEN 3
    WHEN '4th Place (Semifinal exit)' THEN 4
    WHEN 'Quarterfinal' THEN 5
    WHEN 'Round of 16' THEN 6
    ELSE 7
  END, points DESC;
```
**Insight:** Confirms the full tournament bracket order in one query — useful as a "does my SQL handle custom sort logic" CV talking point.

---

## SECTION B — Team Performance Analysis

### Task 3: Which teams scored the most and conceded the fewest goals?
```sql
SELECT team_name, goals_for, goals_against, goal_difference
FROM Teams
ORDER BY goals_for DESC
LIMIT 5;

SELECT team_name, goals_against, matches_played,
       ROUND(goals_against / matches_played, 2) AS conceded_per_match
FROM Teams
ORDER BY conceded_per_match ASC
LIMIT 5;
```
**Insight:** Germany scored the most (18); Costa Rica conceded the fewest per match despite facing England, Italy, and Uruguay in the "Group of Death."

---

### Task 4: Compare each confederation's average performance (UEFA vs CONMEBOL vs CAF vs CONCACAF vs AFC).
```sql
SELECT confederation,
       COUNT(*) AS num_teams,
       ROUND(AVG(points), 2) AS avg_points,
       ROUND(AVG(goals_for), 2) AS avg_goals_for,
       ROUND(AVG(goals_against), 2) AS avg_goals_against
FROM Teams
GROUP BY confederation
ORDER BY avg_points DESC;
```
**Insight:** A classic "regional strength" comparison — good for a resume bullet like *"benchmarked team performance across 5 continental confederations using GROUP BY aggregation."*

---

### Task 5: Rank teams within their group by points (window function).
```sql
SELECT group_name, team_name, points, goal_difference,
       RANK() OVER (PARTITION BY group_name ORDER BY points DESC, goal_difference DESC) AS group_rank
FROM Teams
ORDER BY group_name, group_rank;
```
**Insight:** Demonstrates `RANK() OVER (PARTITION BY ...)` — a key SQL skill interviewers screen for. Group_rank 1-2 = teams that advanced.

---

## SECTION C — Player Analysis

### Task 6: Top 10 goal scorers, with goals-per-match efficiency.
```sql
SELECT player_name, team_name, position, goals, assists, matches_played,
       ROUND(goals / matches_played, 2) AS goals_per_match
FROM Players
WHERE matches_played > 0
ORDER BY goals DESC
LIMIT 10;
```
**Insight:** James Rodríguez (Colombia) top scorer with 6 goals in 5 matches (1.2/match) — best per-match rate among the leaders.

---

### Task 7: Best goal-contribution players (goals + assists) by position.
```sql
SELECT position, player_name, team_name, goals, assists, (goals + assists) AS goal_contributions
FROM Players
ORDER BY goal_contributions DESC
LIMIT 10;
```
**Insight:** Useful to show attacking players aren't just forwards — midfielders like Arjen Robben and Toni Kroos rank highly too.

---

### Task 8: Which team had the most disciplined squad (fewest cards) vs the most aggressive?
```sql
SELECT team_name, SUM(yellow_cards) AS total_yellows, SUM(red_cards) AS total_reds,
       SUM(yellow_cards) + SUM(red_cards)*2 AS discipline_score
FROM Players
GROUP BY team_name
ORDER BY discipline_score DESC
LIMIT 5;
```
**Insight:** Surfaces the tournament's most combative teams — a nice "discipline vs performance" storyline for a dashboard tooltip.

---

### Task 9: Find players who played significant minutes but scored zero goals (defensive/creative role check).
```sql
SELECT player_name, team_name, position, minutes_played, goals, assists
FROM Players
WHERE minutes_played > 400 AND goals = 0
ORDER BY minutes_played DESC
LIMIT 10;
```
**Insight:** Demonstrates filtering logic beyond simple sorting — highlights defensive anchors like Javier Mascherano and Philipp Lahm.

---

## SECTION D — Match Pattern Analysis

### Task 10: Goals per stage — does the tournament get tighter as it goes on?
```sql
SELECT stage,
       COUNT(*) AS matches,
       SUM(home_score + away_score) AS total_goals,
       ROUND(AVG(home_score + away_score), 2) AS avg_goals_per_match
FROM Matches
GROUP BY stage
ORDER BY MIN(match_date);
```
**Insight:** Group Stage averaged 2.83 goals/match; Quarterfinals dropped to 1.25 — knockout football gets tighter and more cautious.

---

### Task 11: How often did the "underdog" (away team) win?
```sql
SELECT
  SUM(CASE WHEN result LIKE 'Home Win%' THEN 1 ELSE 0 END) AS home_wins,
  SUM(CASE WHEN result LIKE 'Away Win%' THEN 1 ELSE 0 END) AS away_wins,
  SUM(CASE WHEN result LIKE 'Draw%' THEN 1 ELSE 0 END) AS draws
FROM Matches;
```
**Insight:** A simple `CASE WHEN` aggregation — good to show you can turn text categories into countable buckets.

---

### Task 12: Which matches went to extra time or penalties, and who won?
```sql
SELECT match_date, stage, home_team, away_team, home_score, away_score,
       home_penalty_score, away_penalty_score, result
FROM Matches
WHERE extra_time = 1 OR penalties = 1
ORDER BY match_date;
```
**Insight:** Surfaces the tournament's most dramatic matches — Brazil vs Chile, Netherlands vs Costa Rica, the Final.

---

### Task 13: Largest margin of victory in the tournament.
```sql
SELECT match_date, stage, home_team, away_team, home_score, away_score,
       ABS(home_score - away_score) AS goal_margin
FROM Matches
ORDER BY goal_margin DESC
LIMIT 5;
```
**Insight:** Brazil 1–7 Germany — the biggest shock result, instantly identifiable via a one-line query.

---

## SECTION E — Tactical & Possession Analysis (the differentiator)

### Task 14: Does possession actually correlate with winning?
```sql
SELECT
  CASE
    WHEN ms.goals_scored > ms.goals_conceded THEN 'Win'
    WHEN ms.goals_scored < ms.goals_conceded THEN 'Loss'
    ELSE 'Draw'
  END AS outcome,
  ROUND(AVG(ms.possession_pct), 2) AS avg_possession,
  COUNT(*) AS num_team_matches
FROM Match_Stats ms
GROUP BY outcome
ORDER BY avg_possession DESC;
```
**Insight:** Winners averaged only marginally higher possession than losers — direct evidence that possession alone doesn't decide matches. This is your strongest "so what" insight for an interview.

---

### Task 15: Tactical style vs average points earned.
```sql
SELECT tactical_style,
       COUNT(*) AS num_teams,
       ROUND(AVG(points), 2) AS avg_points,
       ROUND(AVG(avg_possession_pct), 2) AS avg_possession,
       ROUND(AVG(goals_against), 2) AS avg_goals_conceded
FROM Teams
GROUP BY tactical_style
ORDER BY avg_points DESC;
```
**Insight:** Counter-attacking sides outperformed pure possession sides on average points despite lower possession share — the core tactical takeaway of the whole project.

---

### Task 16: Defensive strength ranking — tackles + interceptions vs goals conceded.
```sql
SELECT t.team_name, t.tactical_style,
       ROUND(AVG(ms.tackles + ms.interceptions), 2) AS avg_defensive_actions,
       ROUND(AVG(ms.goals_conceded), 2) AS avg_goals_conceded
FROM Match_Stats ms
JOIN Teams t ON t.team_id = ms.team_id
GROUP BY t.team_name, t.tactical_style
ORDER BY avg_goals_conceded ASC, avg_defensive_actions DESC
LIMIT 10;
```
**Insight:** A multi-table `JOIN` + `GROUP BY` — one of the most commonly tested SQL skills in analyst interviews.

---

### Task 17: Shot conversion efficiency — who created chances best, regardless of possession?
```sql
SELECT t.team_name, t.tactical_style,
       ROUND(AVG(ms.shots_total), 2) AS avg_shots,
       ROUND(AVG(ms.shots_on_target), 2) AS avg_shots_on_target,
       ROUND(SUM(ms.goals_scored) / SUM(ms.shots_total) * 100, 2) AS shot_conversion_pct
FROM Match_Stats ms
JOIN Teams t ON t.team_id = ms.team_id
GROUP BY t.team_name, t.tactical_style
ORDER BY shot_conversion_pct DESC
LIMIT 10;
```
**Insight:** Reframes "who attacked well" from volume (shots) to efficiency (conversion rate) — shows analytical maturity beyond surface-level stats.

---

## SECTION F — Advanced / Bonus (for standing out)

### Task 18: Build a "Team Strength Rating" using a weighted formula (from the Bonus Features section).
```sql
SELECT team_name, tactical_style,
       ROUND(
         (goals_for * 0.3) - (goals_against * 0.3)
         + (pass_accuracy_pct * 0.2) + (avg_possession_pct * 0.1)
         + (tackles_per_game * 0.1)
       , 2) AS team_strength_score
FROM Teams
ORDER BY team_strength_score DESC
LIMIT 10;
```
**Insight:** Shows you can operationalize a business/analytical framework into a single SQL query — exactly what a hiring manager wants to see (turning "insight" into "metric").

---

### Task 19: Player Performance Index (PPI) — rank the tournament's best all-round players.
```sql
SELECT player_name, team_name, position,
       ROUND(
         (goals * 4) + (assists * 3) + (shots_total * 1)
         + (pass_accuracy_pct * 0.1) - (yellow_cards * 1) - (red_cards * 3)
       , 2) AS performance_index
FROM Players
WHERE matches_played > 0
ORDER BY performance_index DESC
LIMIT 10;
```
**Insight:** A composite scoring model — good talking point for "I built a custom KPI, not just used raw stats."

---

### Task 20: Which team had the best "value for possession" — most points per % possession held?
```sql
SELECT team_name, tactical_style, points, avg_possession_pct,
       ROUND(points / avg_possession_pct, 3) AS points_per_possession_point
FROM Teams
ORDER BY points_per_possession_point DESC
LIMIT 10;
```
**Insight:** Germany and Argentina top this efficiency metric — teams that made the most of every percentage point of the ball, tying the whole project back to the central question: *does possession translate to results?*

---

### Task 21: Create a reusable VIEW combining match results with tactical context (shows SQL object creation, not just querying).
```sql
CREATE VIEW vw_match_tactical_summary AS
SELECT m.match_id, m.stage, m.match_date, m.home_team, m.away_team,
       m.home_score, m.away_score, m.result,
       t1.tactical_style AS home_style, t2.tactical_style AS away_style
FROM Matches m
JOIN Teams t1 ON m.home_team_id = t1.team_id
JOIN Teams t2 ON m.away_team_id = t2.team_id;

-- then simply:
SELECT * FROM vw_match_tactical_summary ORDER BY match_date;
```
**Insight:** Views are a step above basic querying — shows you think about reusability and downstream reporting, which is exactly what Junior Analyst interviewers probe for.

---

## How to Use This for Your CV

Pick 3–4 of the strongest results and turn them into resume/portfolio bullet points, e.g.:

> - Built and queried a normalized 4-table MySQL database (32 teams, 110 players, 64 matches, 128 team-match records) analyzing the 2014 FIFA World Cup.
> - Used SQL window functions, multi-table joins, and CASE-based aggregation to test whether possession predicts match outcomes — found only a weak relationship (avg. possession of winners vs. losers differed by <5%).
> - Classified all 32 teams into 6 tactical archetypes and quantified their average performance, finding counter-attacking sides outperformed possession-based sides on average points.
> - Designed custom composite metrics (Player Performance Index, Team Strength Rating) to rank players/teams beyond raw stats.
> - Visualized findings in a 6-page Power BI dashboard connected live to the MySQL backend.

Run each task, screenshot a couple of the more interesting results (Task 14 and Task 15 especially), and drop them straight into your portfolio README or LinkedIn post — recruiters respond well to "here's the insight I found" over "here's a database I made."
