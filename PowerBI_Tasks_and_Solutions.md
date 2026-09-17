# Power BI Task List — 2014 FIFA World Cup Analysis
**Follow these tasks in order. Each has a clear objective + the exact solution (steps, DAX, or field mapping) so you can complete it and understand what you did.**

Data source: `Teams`, `Players`, `Matches`, `Match_Stats` (from MySQL or the 4 CSVs directly).

---

## PHASE 1 — Data Modeling

### Task 1.1 — Load the data
**Do:** Get Data → MySQL database (or Text/CSV if going the direct-file route) → load all 4 tables.

**Solution / check:** In Model view, confirm you see 4 tables: Teams, Players, Matches, Match_Stats.

### Task 1.2 — Build relationships
**Do:** In Model view, drag to connect:
- `Players[team_id]` → `Teams[team_id]`
- `Matches[home_team_id]` → `Teams[team_id]`
- `Matches[away_team_id]` → `Teams[team_id]`
- `Match_Stats[match_id]` → `Matches[match_id]`
- `Match_Stats[team_id]` → `Teams[team_id]`

**Solution / issue you'll hit:** Power BI allows only ONE **active** relationship at a time between two tables when there are multiple paths. Since `Matches` connects to `Teams` twice (home and away), only one of those two will be active by default (usually `home_team_id`). Leave `away_team_id` as **inactive** — you'll activate it on demand using `USERELATIONSHIP()` in specific measures (Task 1.3).

### Task 1.3 — Create a measure that correctly counts goals regardless of home/away
**Do:** New Measure on `Matches` table.

**Solution:**
```dax
Total Goals = SUM(Matches[home_score]) + SUM(Matches[away_score])
```
This works fine without touching relationships since it sums raw columns. But if you ever build a **team-filtered** goals measure using the inactive away relationship, use:
```dax
Away Goals For (via inactive rel) =
CALCULATE(
    SUM(Matches[away_score]),
    USERELATIONSHIP(Matches[away_team_id], Teams[team_id])
)
```

### Task 1.4 — Add a calculated "Outcome" column to Match_Stats
**Do:** New Column on `Match_Stats`.

**Solution:**
```dax
Outcome =
IF(
    Match_Stats[goals_scored] > Match_Stats[goals_conceded], "Win",
    IF(Match_Stats[goals_scored] < Match_Stats[goals_conceded], "Loss", "Draw")
)
```
This single column is what powers your entire "does possession predict winning" analysis later.

---

## PHASE 2 — Core DAX Measures (KPI cards)

### Task 2.1 — Total Goals, Matches, Teams, Avg Goals/Match
**Solution:**
```dax
Total Goals = SUM(Matches[home_score]) + SUM(Matches[away_score])
Total Matches = COUNTROWS(Matches)
Total Teams = DISTINCTCOUNT(Teams[team_id])
Avg Goals per Match = DIVIDE([Total Goals], [Total Matches])
Total Attendance = SUM(Matches[attendance])
Avg Attendance = AVERAGE(Matches[attendance])
```

### Task 2.2 — Top scorer (dynamic, changes with filters)
**Solution:**
```dax
Top Scorer Goals = MAX(Players[goals])

Top Scorer Name =
CALCULATE(
    SELECTEDVALUE(Players[player_name]),
    TOPN(1, Players, Players[goals], DESC)
)
```

### Task 2.3 — Win / Draw / Loss counts and win rate
**Solution:**
```dax
Total Wins  = CALCULATE(COUNTROWS(Match_Stats), Match_Stats[Outcome] = "Win")
Total Draws = CALCULATE(COUNTROWS(Match_Stats), Match_Stats[Outcome] = "Draw")
Total Losses= CALCULATE(COUNTROWS(Match_Stats), Match_Stats[Outcome] = "Loss")

Win Rate % = DIVIDE([Total Wins], COUNTROWS(Match_Stats))
```

---

## PHASE 3 — Page 1: Tournament Overview

### Task 3.1 — Build KPI cards
**Do:** Insert 5 Card visuals.
**Solution:** Assign `[Total Goals]`, `[Total Matches]`, `[Total Teams]`, `[Avg Goals per Match]`, `[Total Attendance]` — one measure per card.

### Task 3.2 — Goals by stage bar chart
**Do:** Clustered column chart.
**Solution:** Axis = `Matches[stage]`, Value = `[Total Goals]`. Sort by match_date (add a "stage order" calculated column if the default alphabetical sort looks wrong):
```dax
Stage Order =
SWITCH(
    Matches[stage],
    "Group Stage", 1, "Round of 16", 2, "Quarterfinal", 3,
    "Semifinal", 4, "Third Place Play-off", 5, "Final", 6
)
```
Then: right-click `stage` column → Sort by column → `Stage Order`.

### Task 3.3 — Map of host cities
**Do:** Map visual. Location = `Matches[city]`. Size = `[Total Attendance]` or count of matches.

---

## PHASE 4 — Page 2: Team Performance

### Task 4.1 — Standings table
**Do:** Table visual.
**Solution:** Columns: `team_name`, `final_result`, `points`, `wins`, `draws`, `losses`, `goals_for`, `goals_against`, `goal_difference`, `tactical_style`. Sort by `points` descending, then `goal_difference` descending.

### Task 4.2 — Points by team, colored by confederation
**Do:** Bar chart.
**Solution:** Axis = `team_name`, Value = `points`, Legend/color = `confederation`. Sort descending by points.

### Task 4.3 — Slicers
**Do:** Add slicers for `group_name`, `confederation`, `tactical_style` so every visual on this page is filterable.

---

## PHASE 5: Page 3 — Players

### Task 5.1 — Top 10 scorers bar chart
**Solution:** Bar chart, Axis = `player_name`, Value = `goals`. Filter pane → Top N filter → Top 10 by `goals`.

### Task 5.2 — Goals vs Assists scatter (bubble = minutes played)
**Solution:** Scatter chart. X = `goals`, Y = `assists`, Size = `minutes_played`, Legend = `position` or `team_name`.

### Task 5.3 — Player Performance Index (PPI) — bonus feature
**Do:** New Column on `Players`.
**Solution:**
```dax
PPI =
(Players[goals] * 4)
+ (Players[assists] * 3)
+ (Players[shots_total] * 1)
+ (Players[pass_accuracy_pct] * 0.1)
- (Players[yellow_cards] * 1)
- (Players[red_cards] * 3)
```
Add a Table or Bar chart ranking players by `PPI` — this is a strong CV talking point ("built a custom composite player-ranking metric").

---

## PHASE 6 — Page 4: Tactical Analysis (the centerpiece — spend the most time here)

### Task 6.1 — Possession vs Points scatter, colored by tactical style
**Do:** Scatter chart on `Teams` table.
**Solution:** X = `avg_possession_pct`, Y = `points`, Legend = `tactical_style`, Size = `goals_for` (optional). This single chart visually proves/disproves "possession = winning."

### Task 6.2 — Avg points by tactical style (bar chart)
**Solution:**
```dax
Avg Points by Style =
CALCULATE(AVERAGE(Teams[points]))
```
Bar chart: Axis = `tactical_style`, Value = `Avg Points by Style` (or just drag `points` in and set aggregation to Average).

### Task 6.3 — Possession vs Outcome (Win/Draw/Loss) — the key insight chart
**Do:** Bar chart using `Match_Stats`.
**Solution:** Axis = `Outcome`, Value = `possession_pct` (aggregation = Average). This recreates the finding: winners averaged ~52% possession vs ~48% for losers — a small gap, visually proving possession alone isn't decisive.

### Task 6.4 — Possession–Goals correlation coefficient (advanced DAX)
DAX has no built-in `CORREL()`, so build it manually — this is a great CV/interview talking point ("implemented Pearson correlation from scratch in DAX").

**Solution:**
```dax
Avg Possession = AVERAGE(Match_Stats[possession_pct])
Avg Goals = AVERAGE(Match_Stats[goals_scored])

Correlation Possession-Goals =
VAR N = COUNTROWS(Match_Stats)
VAR SumXY = SUMX(Match_Stats, Match_Stats[possession_pct] * Match_Stats[goals_scored])
VAR SumX = SUMX(Match_Stats, Match_Stats[possession_pct])
VAR SumY = SUMX(Match_Stats, Match_Stats[goals_scored])
VAR SumX2 = SUMX(Match_Stats, Match_Stats[possession_pct]^2)
VAR SumY2 = SUMX(Match_Stats, Match_Stats[goals_scored]^2)
VAR Numerator = (N * SumXY) - (SumX * SumY)
VAR Denominator =
    SQRT((N * SumX2 - SumX^2) * (N * SumY2 - SumY^2))
RETURN
    DIVIDE(Numerator, Denominator)
```
Put this measure in a Card visual. You should get a weak-to-moderate positive value (~0.3) — matching the finding in the project doc.

### Task 6.5 — Style comparison radar/table for the Final 4
**Do:** Table or Matrix visual, filter to Germany, Argentina, Netherlands, Brazil.
**Solution:** Rows = `team_name`, Values = `avg_possession_pct`, `pass_accuracy_pct`, `shots_per_game`, `tackles_per_game`. (Radar chart isn't native to Power BI — either use a Table, or get the free "Radar Chart" visual from AppSource if you want the exact spider look.)

### Task 6.6 — Team Strength Rating — bonus feature
**Do:** New Column on `Teams`.
**Solution:**
```dax
Team Strength Rating =
(Teams[goals_for] * 0.3)
- (Teams[goals_against] * 0.3)
+ (Teams[pass_accuracy_pct] * 0.2)
+ (Teams[avg_possession_pct] * 0.1)
+ (Teams[tackles_per_game] * 0.1)
```
Bar chart ranking all 32 teams by this rating — compare the ranking to actual `final_result` and talk about where they diverge (that divergence *is* your insight).

---

## PHASE 7 — Page 5: Match & Defensive Analysis

### Task 7.1 — Defensive strength table
**Do:** Table/Matrix, source = `Match_Stats` + `Teams`.
**Solution:** Rows = `team_name`, Values = Average `tackles`, Average `interceptions`, Average `goals_conceded`. Sort by `goals_conceded` ascending to surface the best defenses.

### Task 7.2 — Tournament progression flow
**Do:** Since Power BI has no native bracket visual, use one of:
- A **Sankey Chart** (free from AppSource): Source = `stage`, Destination = next `stage`, filtered to only teams that advanced (add a calculated column `Advanced (Y/N)` on Teams based on `final_result`).
- Simpler alternative: a Matrix with `group_name` → `team_name` → `final_result`, using conditional formatting (green background) on rows that reached knockouts.

**Advanced column solution:**
```dax
Advanced Past Group =
IF(Teams[final_result] = "Group Stage", "No", "Yes")
```

---

## PHASE 8 — Page 6: Match Explorer

### Task 8.1 — Full match table with drill-through
**Do:** Table visual with `match_date`, `home_team`, `home_score`, `away_score`, `away_team`, `stage`, `venue`.
**Solution:** Right-click the table → set up **Drill-through**: create a new hidden page showing that match's two `Match_Stats` rows (possession, shots, tackles side by side) using a Matrix filtered by `match_id`. Add a "Back" button (Insert → Buttons → Back).

---

## PHASE 9 — Polish (do these last, they matter most for how "professional" it looks)

### Task 9.1 — Consistent theme
**Do:** View → Themes → pick or customize one (e.g., team colors: gold/black/green/yellow — World Cup palette). Apply consistently across all 6 pages.

### Task 9.2 — Titles, tooltips, and a home page
**Do:** Add a Page 0 "Home/Cover" with the project title, your name, and 3–4 headline stats as big cards, plus buttons linking to each page.

### Task 9.3 — Written takeaway on the tactical page
**Do:** Add a Text Box on Page 4 with your own 2–3 sentence insight (e.g., *"Possession showed only a weak correlation (r≈0.31) with goals scored — Germany's title-winning combination of high possession AND pressing intensity was rarer, and more effective, than possession alone (see Spain's early exit)."*). Interviewers respond well to seeing you state an insight, not just a chart.

---

## How to List This on Your CV

> **2014 FIFA World Cup Tactical Analysis Dashboard** — Personal Project
> Designed a normalized 4-table SQL database (32 teams, 110 players, 64 matches, 128 team-match records) in MySQL; built 6 DAX measures and 2 calculated columns including a custom Player Performance Index and a manually-implemented Pearson correlation; delivered a 6-page interactive Power BI dashboard revealing that ball possession only weakly predicts match outcomes (r≈0.31), while tactical pressing and defensive efficiency were stronger differentiators of tournament success.

---

## Suggested Order to Actually Build It
1. Phase 1 (modeling) → 2 (measures) → 3 (overview page) — gets you a working file fast.
2. Phase 6 (tactical page) next — it's the differentiator, do it before you run out of energy.
3. Phases 4, 5, 7, 8 — fill in the rest.
4. Phase 9 — polish, always last.
