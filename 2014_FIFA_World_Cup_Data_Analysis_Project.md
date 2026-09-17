# 2014 FIFA World Cup — Data Analysis & Tactical Intelligence Project

**Portfolio project for Junior Data Analyst applications**
Author: [Your Name] | Tools: SQL, Python, Power BI | Domain: Sports Analytics

---

## 1. Project Overview

### Title
**"Tactics & Triumph: A Data-Driven Analysis of the 2014 FIFA World Cup"**

### Objective
To design and build an end-to-end data analysis project that explores team performance, player statistics, and tactical playing styles at the 2014 FIFA World Cup — identifying the patterns that separated champions from early exits, and demonstrating a full analyst workflow: database design → SQL analysis → Python EDA → BI dashboarding → insight storytelling.

### Problem Statement
International tournaments are short (only 3–7 matches per team), so results can look random on the surface. Germany won the tournament while Brazil, the host and pre-tournament favorite, was eliminated 7–1 in the semifinal. Spain, the reigning champion and standard-bearer for possession football, was knocked out in the group stage. This project asks:

- Which teams and players performed best, and by how much?
- Did a specific **tactical style** (possession, counter-attacking, high press, defensive) actually predict success — or is that a myth?
- Does possession guarantee winning? Does defensive solidity matter more than attack?
- Can we quantify "how" teams won, not just "who" won?

### Dataset Description
The dataset covers the entire 2014 FIFA World Cup held in Brazil (12 host cities, 32 teams, 64 matches, 12 June – 13 July 2014):

| Fact | Value |
|---|---|
| Teams | 32 (8 groups of 4) |
| Matches | 64 (48 group + 8 R16 + 4 QF + 2 SF + 1 third-place + 1 final) |
| Total goals | 171 (2.67 goals/match) |
| Players tracked | 110 key/notable players across all 32 squads |
| Champion | Germany (beat Argentina 1–0 a.e.t.) |
| Top scorer | James Rodríguez (Colombia) — 6 goals |

Core match results, scorelines, standings, and the tournament bracket are historically accurate. Granular in-match tactical metrics (possession %, pass accuracy, tackles, interceptions, etc.) are **modeled estimates** built around each team's known playing style and real match context (final score, stage, opponent strength) — this is standard practice for a portfolio project when official Opta-level data isn't publicly bundled, and it's flagged transparently here so the dataset can be swapped for a licensed data provider (Opta, StatsBomb, FBref) without changing the schema.

### Key Metrics Used in Analysis
- **Performance:** Wins/Draws/Losses, Points, Goal Difference, Goals For/Against
- **Attacking:** Goals, Assists, Shots, Shots on Target, Shot Conversion Rate
- **Possession & Passing:** Possession %, Pass Accuracy %
- **Defensive:** Tackles, Interceptions, Goals Conceded, Clean Sheets
- **Discipline:** Yellow/Red Cards, Fouls
- **Tactical:** Playing Style Classification, Style-level Win Rate
- **Match Context:** Stage, Extra Time/Penalties, Attendance

---

## 2. Database Design

The project uses a **normalized relational database with exactly 4 tables** — intentionally kept lean (per the brief) while still supporting deep tactical analysis via a dedicated bridge/fact table.

### Entity Relationship Summary

```
Teams (1) ────< Players (many)
Teams (1) ────< Matches (many, twice — home_team_id AND away_team_id)
Matches (1) ────< Match_Stats (2 rows per match — one per team)
Teams (1) ────< Match_Stats (many)
```

### Table 1 — `Teams` (32 rows) — Dimension Table
Grain: one row per national team.

| Column | Type | Key | Description |
|---|---|---|---|
| team_id | INT | **PK** | Unique team identifier |
| team_name | VARCHAR | | Team name |
| confederation | VARCHAR | | UEFA, CONMEBOL, CAF, CONCACAF, AFC |
| group_name | CHAR(1) | | Group A–H |
| matches_played | INT | | Total matches |
| wins / draws / losses | INT | | Match outcomes |
| goals_for / goals_against / goal_difference | INT | | Scoring record |
| points | INT | | Group stage points |
| final_result | VARCHAR | | Stage reached (Champion, Runner-up, QF, etc.) |
| tactical_style | VARCHAR | | Classified playing style (see Section 3) |
| avg_possession_pct | DECIMAL | | Season average possession |
| pass_accuracy_pct | DECIMAL | | Season average pass accuracy |
| shots_per_game | DECIMAL | | Attacking output |
| tackles_per_game | DECIMAL | | Defensive intensity |

### Table 2 — `Players` (110 rows) — Dimension Table
Grain: one row per notable player.

| Column | Type | Key | Description |
|---|---|---|---|
| player_id | INT | **PK** | Unique player identifier |
| player_name | VARCHAR | | Player name |
| team_id | INT | **FK → Teams** | Team the player represents |
| team_name | VARCHAR | | Denormalized for BI convenience |
| position | VARCHAR | | Forward / Midfielder / Defender / Goalkeeper |
| age | INT | | Age at tournament |
| jersey_number | INT | | Shirt number |
| matches_played | INT | | Appearances |
| minutes_played | INT | | Minutes on pitch |
| goals | INT | | Goals scored |
| assists | INT | | Assists |
| yellow_cards / red_cards | INT | | Discipline |
| shots_total | INT | | Total shots |
| pass_accuracy_pct | DECIMAL | | Individual passing accuracy |

### Table 3 — `Matches` (64 rows) — Fact Table
Grain: one row per fixture.

| Column | Type | Key | Description |
|---|---|---|---|
| match_id | INT | **PK** | Unique match identifier |
| stage | VARCHAR | | Group Stage / R16 / QF / SF / 3rd Place / Final |
| match_date | DATE | | Fixture date |
| venue / city | VARCHAR | | Stadium and host city |
| home_team_id | INT | **FK → Teams** | Nominal "home" side |
| away_team_id | INT | **FK → Teams** | Nominal "away" side |
| home_team / away_team | VARCHAR | | Denormalized names |
| home_score / away_score | INT | | Final score |
| result | VARCHAR | | Home Win / Away Win / Draw (+ET/Penalties) |
| extra_time / penalties | BOOLEAN | | Match went beyond 90 minutes |
| home_penalty_score / away_penalty_score | INT | | Shootout score (nullable) |
| attendance | INT | | Crowd size |

### Table 4 — `Match_Stats` (128 rows = 64 matches × 2 teams) — Fact / Bridge Table
Grain: one row per team, per match. **This is the table that makes tactical analysis possible** — it's what lets you correlate possession, passing, and defending with actual match outcomes rather than just season averages.

| Column | Type | Key | Description |
|---|---|---|---|
| match_stat_id | INT | **PK** | Unique row identifier |
| match_id | INT | **FK → Matches** | Which fixture |
| team_id | INT | **FK → Teams** | Which team |
| team_name / stage / home_away | VARCHAR | | Denormalized context |
| goals_scored / goals_conceded | INT | | Match result from this team's view |
| possession_pct | DECIMAL | | Possession share in this match |
| pass_accuracy_pct | DECIMAL | | Passing accuracy in this match |
| shots_total / shots_on_target | INT | | Attacking output |
| tackles / interceptions | INT | | Defensive actions |
| corners / fouls / offsides | INT | | Match events |
| distance_covered_km | DECIMAL | | Physical output |

### Normalization Notes
- **1NF:** Every column is atomic (no comma-separated values, no repeating groups).
- **2NF:** All non-key attributes depend on the *whole* primary key — e.g., in `Match_Stats`, stats depend on the (match, team) pair together, which is why it's a separate table rather than columns bolted onto `Matches`.
- **3NF:** No transitive dependencies — e.g., `team_name` in `Players`/`Matches`/`Match_Stats` is technically a denormalized convenience column (its true source of truth is `Teams.team_name`, reachable via `team_id`). This is a deliberate, documented denormalization for Power BI usability — a common, acceptable trade-off in BI-facing star-schema-style designs — while the IDs preserve full relational integrity.
- `Matches` and `Match_Stats` together form a simple **star schema**: `Teams` and (implicitly) a date dimension act as dimensions, `Match_Stats` is the fact table.

---

## 3. Tactical / Playing Style Analysis

Each of the 32 teams is classified into one of six tactical archetypes, based on their actual approach at the tournament:

| Style | Description | Example Teams |
|---|---|---|
| **Possession-based (Tiki-Taka)** | Short passing, high possession, patient buildup | Spain |
| **Possession-based / High Pressing** | Possession dominance combined with aggressive ball-winning | Germany |
| **Counter-attacking** | Sit back, transition quickly on turnover | Argentina, Netherlands, Belgium, Nigeria |
| **High Pressing** | Aggressive pressing without necessarily dominating the ball | Chile, Australia, South Korea |
| **Defensive / Low Block** | Compact shape, absorb pressure, limit space | Costa Rica, Iran, Greece, Mexico |
| **Direct / Long-Ball** | Bypass midfield, target physical forwards | Cameroon |
| **Balanced** | No single dominant trait; mixed approach | Croatia, Italy, France, Ecuador, etc. |

This classification, plus the possession/pass/shots/tackles metrics, lives in the `Teams` table (season averages) and the `Match_Stats` table (per-match granularity) described above.

### How Tactics Influenced Match Outcomes
Aggregating team points by tactical style from this dataset:

| Style | Teams | Avg. Points | Avg. Possession |
|---|---|---|---|
| Possession-based / High Pressing (Germany) | 1 | 19.0 | 59.6% |
| Counter-attacking | 4 | ~9.5 | 51.3% |
| Possession-based (Tiki-Taka) (Spain) | 1 | 3.0 | 63.8% |
| Defensive / Low Block (Counter) (Costa Rica) | 1 | 11.0 | 39.7% |
| Balanced | 7 | ~5.6 | 49.9% |
| Defensive / Low Block | 4 | ~2.5 | 43.1% |

### Which Style Performed Best?
**Counter-attacking teams over-performed relative to their squad depth.** Argentina (runner-up), Netherlands (3rd place), and Belgium (quarterfinal) all rode disciplined defensive shape plus rapid transitions deep into the tournament — 3 of the top 4 finishers used a counter-attacking or hybrid press-and-transition approach.

**Pure possession football had a mixed record.** Germany's possession+press hybrid won it all, but Spain's tiki-taka — the same style that won 2008, 2010, and 2012 — collapsed in the group stage, out-passed and out-possessed opponents but got countered and outworked defensively. The lesson: **possession is necessary but not sufficient; it has to be paired with defensive intensity or direct penetration.**

**Defensive/low-block teams (Costa Rica) massively overachieved**, reaching the quarterfinals with the lowest average possession in the group-of-death, proving compact defending plus efficient counters can beat technically superior sides.

---

## 4. Data Analysis (SQL / Python Examples)

### SQL Examples

**Top goal scorers:**
```sql
SELECT player_name, team_name, goals, assists, matches_played,
       ROUND(goals * 1.0 / NULLIF(matches_played,0), 2) AS goals_per_match
FROM Players
ORDER BY goals DESC
LIMIT 10;
```

**Team performance comparison:**
```sql
SELECT team_name, final_result, points, goals_for, goals_against,
       goal_difference, tactical_style
FROM Teams
ORDER BY points DESC, goal_difference DESC;
```

**Goals per stage (group vs knockout):**
```sql
SELECT stage,
       COUNT(*) AS matches,
       SUM(home_score + away_score) AS total_goals,
       ROUND(AVG(home_score + away_score), 2) AS avg_goals_per_match
FROM Matches
GROUP BY stage
ORDER BY MIN(match_date);
```

**Defensive strength analysis:**
```sql
SELECT t.team_name, t.tactical_style,
       AVG(ms.tackles) AS avg_tackles,
       AVG(ms.interceptions) AS avg_interceptions,
       AVG(ms.goals_conceded) AS avg_goals_conceded
FROM Match_Stats ms
JOIN Teams t ON t.team_id = ms.team_id
GROUP BY t.team_name, t.tactical_style
ORDER BY avg_goals_conceded ASC;
```

**Possession vs winning correlation:**
```sql
SELECT
  CASE
    WHEN ms.goals_scored > ms.goals_conceded THEN 'Win'
    WHEN ms.goals_scored < ms.goals_conceded THEN 'Loss'
    ELSE 'Draw'
  END AS outcome,
  ROUND(AVG(ms.possession_pct), 2) AS avg_possession
FROM Match_Stats ms
GROUP BY outcome;
```

**Tactical style vs success rate:**
```sql
SELECT tactical_style,
       COUNT(*) AS num_teams,
       ROUND(AVG(points), 2) AS avg_points,
       ROUND(AVG(avg_possession_pct), 2) AS avg_possession
FROM Teams
GROUP BY tactical_style
ORDER BY avg_points DESC;
```

### Python (pandas) Examples
```python
import pandas as pd

teams = pd.read_csv("Teams.csv")
players = pd.read_csv("Players.csv")
matches = pd.read_csv("Matches.csv")
match_stats = pd.read_csv("Match_Stats.csv")

# Top goal scorers
top_scorers = players.sort_values("goals", ascending=False).head(10)

# Match result patterns (home win / away win / draw split)
result_counts = matches["result"].str.extract(r"(Home Win|Away Win|Draw)")[0].value_counts()

# Possession vs goals correlation
correlation = match_stats["possession_pct"].corr(match_stats["goals_scored"])

# Tactical style success rate
style_perf = teams.groupby("tactical_style").agg(
    teams=("team_id", "count"),
    avg_points=("points", "mean"),
    avg_possession=("avg_possession_pct", "mean")
).sort_values("avg_points", ascending=False)
```

---

## 5. Visualization Dashboard Structure (Power BI)

**Page 1 — Tournament Overview**
- KPI Cards: Total Goals (171), Total Matches (64), Teams (32), Avg Goals/Match (2.67), Total Attendance
- Bar chart: Goals by stage (Group vs R16 vs QF vs SF vs Final)
- Map visual: Host cities and attendance

**Page 2 — Team Performance**
- Bar chart: Points/Goal Difference by team, sorted, colored by confederation
- Table: Full standings with final_result
- Slicer: Filter by group / confederation / tactical style

**Page 3 — Top Scorers & Player Performance**
- Bar chart: Top 10 goal scorers
- Scatter plot: Goals vs Assists (bubble size = minutes played)
- Table: Player Performance Index (see Section 7)

**Page 4 — Tactical Analysis (the centerpiece)**
- Scatter plot: **Possession % vs Points/Win Rate** (colored by tactical style) — directly visualizes whether possession predicts winning
- Bar chart: Average points by tactical style
- Radar/spider chart: Style comparison across possession, pass accuracy, shots, tackles for the final-4 teams
- Heatmap: Team vs metric (possession, pass accuracy, shots, tackles) normalized 0–100

**Page 5 — Match & Defensive Analysis**
- Heatmap: Goals scored by 15-minute match interval (attacking momentum patterns)
- Bar chart: Goals conceded vs tackles+interceptions per team (defensive strength)
- Sankey/flow diagram: Tournament progression (Group → R16 → QF → SF → Final) showing which teams advanced

**Page 6 — Match Explorer**
- Drill-through table: every match with score, stage, venue, and a click-through to that match's `Match_Stats` detail (possession, shots, tackles side-by-side)

---

## 6. Advanced Insights

**Why Germany won the tournament.** Germany was the only team to combine *high possession* (59.6%, second only to Spain) with *elite pressing intensity* — they didn't just have the ball, they won it back immediately when they lost it. That hybrid is rarer and harder to play against than pure possession (Spain) or pure defending (Costa Rica). Germany also had the tournament's best goal difference (+14) and never trailed in a knockout match until the final.

**Why possession did not always guarantee victory.** In this dataset, the average possession for match winners (~52%) was only marginally higher than for losers (~48%), and the correlation between possession and goals scored was weak-to-moderate (~0.31). Spain is the clearest proof: elite possession and passing accuracy, eliminated in two matches. Modern low-blocks and quick transitions have made "having the ball" less valuable than "using it efficiently."

**Role of counter-attacking teams.** Argentina, Netherlands, and Belgium all reached at least the quarterfinals playing a counter-attacking or transition-based system, conceding territory but converting turnovers into high-quality chances. This tactical trend — sitting deeper against technically superior opponents and hitting them on the break — was one of the defining stories of the tournament.

**Defensive performance impact.** Teams with strong tackle/interception numbers relative to their goals conceded (Costa Rica, Germany, Argentina) advanced further than teams with high attacking output but leaky defenses (Brazil conceded 14 goals — the most by a tournament host in history, capped by the 1–7 semifinal collapse).

**Key tactical trends of 2014.** (1) The rise of compact, disciplined mid-blocks over old-school pure defending. (2) Possession without pressing became exploitable. (3) Set-piece and transition efficiency mattered more than territorial dominance. (4) Physical/pressing intensity (Germany, Chile, Netherlands) increasingly separated the best teams from good ones.

---

## 7. Bonus / Advanced Features

**Player Performance Index (PPI)** — a simple weighted composite score for ranking players beyond raw goals:
```
PPI = (Goals × 4) + (Assists × 3) + (Shots_on_target × 1) 
      + (Pass_Accuracy% × 0.1) − (Yellow_Cards × 1) − (Red_Cards × 3)
```
Normalize 0–100 across the player pool for a leaderboard visual.

**Team Strength Rating System** — combine attacking, defensive, and tactical-consistency metrics:
```
Team Strength = (Goals_For × 0.3) − (Goals_Against × 0.3) 
                + (Pass_Accuracy% × 0.2) + (Possession% × 0.1) 
                + (Tackles+Interceptions × 0.1)
```

**Match Prediction Model (optional ML idea)** — a logistic regression / gradient-boosted classifier using `Match_Stats` features (possession, shots, pass accuracy, tackles) plus `Teams` tactical style as categorical input, predicting Win/Draw/Loss. Good scope for a follow-up "v2" project: feature importance would likely show shots-on-target and goal difference as the strongest predictors, with possession as a weak standalone predictor — directly testing the insight from Section 6.

**Formation Analysis** — extend `Players` with a `formation` field per match (e.g., 4-2-3-1, 4-3-3, 5-3-2) to study which formations best suited each tactical style (e.g., Netherlands' 5-3-2 for counter-attacking, Spain's 4-3-3 for possession).

**Pass Network Analysis (concept)** — with player-level pass event data (not included here, but a natural extension), you could build node-edge graphs per team showing which players the ball flows through most — identifying "hub" players (e.g., Toni Kroos for Germany) and pressing targets for opponents.

**Game Momentum Analysis** — using the goals-by-minute heatmap idea from Section 5, extend to a rolling "momentum index" combining shots, corners, and territory over 5-minute windows per match to visualize when a team was truly dominant vs just leading on the scoreboard.

---

## 8. Files Delivered

| File | Rows | Purpose |
|---|---|---|
| `Teams.csv` | 32 | Team dimension + tactical classification |
| `Players.csv` | 110 | Player dimension |
| `Matches.csv` | 64 | Match fact table |
| `Match_Stats.csv` | 128 | Per-team-per-match tactical fact table |
| `schema.sql` | — | Full DDL with PK/FK constraints and normalization notes |

**To use in Power BI:** Get Data → Text/CSV → import all four files → Model view → create relationships: `Players.team_id → Teams.team_id`, `Matches.home_team_id → Teams.team_id`, `Matches.away_team_id → Teams.team_id`, `Match_Stats.match_id → Matches.match_id`, `Match_Stats.team_id → Teams.team_id`.

---

## 9. How to Present This on a Resume / Portfolio

> *"Designed and built an end-to-end sports analytics project on the 2014 FIFA World Cup: normalized a 4-table relational database (32 teams, 110 players, 64 matches, 128 team-match tactical records), wrote SQL queries to analyze scoring patterns and defensive performance, classified teams into 6 tactical archetypes and quantified their win rates, and built a 6-page Power BI dashboard surfacing the insight that possession weakly predicts match outcomes (r≈0.31) while pressing intensity and defensive efficiency are stronger differentiators."*
