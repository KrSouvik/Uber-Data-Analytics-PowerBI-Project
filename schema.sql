-- ============================================================
-- 2014 FIFA WORLD CUP DATA ANALYSIS PROJECT
-- Relational Database Schema (3NF Normalized, 4 Tables)
-- ============================================================

CREATE TABLE Teams (
    team_id             INT PRIMARY KEY,
    team_name           VARCHAR(50)  NOT NULL,
    confederation       VARCHAR(20)  NOT NULL,   -- UEFA, CONMEBOL, CAF, CONCACAF, AFC
    group_name          CHAR(1)      NOT NULL,   -- A-H
    matches_played      INT NOT NULL,
    wins                INT NOT NULL,
    draws               INT NOT NULL,
    losses              INT NOT NULL,
    goals_for           INT NOT NULL,
    goals_against       INT NOT NULL,
    goal_difference     INT NOT NULL,
    points              INT NOT NULL,
    final_result         VARCHAR(40)  NOT NULL,   -- e.g. Champion, Runner-up, Round of 16...
    tactical_style       VARCHAR(50)  NOT NULL,   -- Possession-based, Counter-attacking, etc.
    avg_possession_pct   DECIMAL(5,2) NOT NULL,
    pass_accuracy_pct    DECIMAL(5,2) NOT NULL,
    shots_per_game        DECIMAL(5,2) NOT NULL,
    tackles_per_game      DECIMAL(5,2) NOT NULL
);

CREATE TABLE Players (
    player_id           INT PRIMARY KEY,
    player_name          VARCHAR(60)  NOT NULL,
    team_id              INT NOT NULL,
    team_name            VARCHAR(50)  NOT NULL,   -- denormalized for BI convenience
    position             VARCHAR(15)  NOT NULL,   -- Forward, Midfielder, Defender, Goalkeeper
    age                  INT NOT NULL,
    jersey_number         INT NOT NULL,
    matches_played        INT NOT NULL,
    minutes_played         INT NOT NULL,
    goals                INT NOT NULL,
    assists              INT NOT NULL,
    yellow_cards          INT NOT NULL,
    red_cards            INT NOT NULL,
    shots_total           INT NOT NULL,
    pass_accuracy_pct     DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Matches (
    match_id             INT PRIMARY KEY,
    stage                VARCHAR(25)  NOT NULL,   -- Group Stage, Round of 16, QF, SF, 3rd Place, Final
    match_date            DATE NOT NULL,
    venue                VARCHAR(40)  NOT NULL,
    city                 VARCHAR(30)  NOT NULL,
    home_team_id           INT NOT NULL,
    away_team_id           INT NOT NULL,
    home_team             VARCHAR(50)  NOT NULL,  -- denormalized for BI convenience
    away_team             VARCHAR(50)  NOT NULL,
    home_score            INT NOT NULL,
    away_score            INT NOT NULL,
    result               VARCHAR(30)  NOT NULL,   -- Home Win / Away Win / Draw (+ET/Penalties)
    extra_time            BOOLEAN NOT NULL,
    penalties            BOOLEAN NOT NULL,
    home_penalty_score      INT,
    away_penalty_score      INT,
    attendance            INT NOT NULL,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Match_Stats (
    match_stat_id         INT PRIMARY KEY,
    match_id              INT NOT NULL,
    team_id               INT NOT NULL,
    team_name             VARCHAR(50)  NOT NULL,  -- denormalized for BI convenience
    stage                 VARCHAR(25)  NOT NULL,
    home_away             VARCHAR(4)   NOT NULL,  -- home / away
    goals_scored           INT NOT NULL,
    goals_conceded          INT NOT NULL,
    possession_pct          DECIMAL(5,2) NOT NULL,
    pass_accuracy_pct        DECIMAL(5,2) NOT NULL,
    shots_total             INT NOT NULL,
    shots_on_target          INT NOT NULL,
    tackles               INT NOT NULL,
    interceptions           INT NOT NULL,
    corners               INT NOT NULL,
    fouls                 INT NOT NULL,
    offsides               INT NOT NULL,
    distance_covered_km       DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- ============================================================
-- NORMALIZATION NOTE
-- Teams  = 1 row per team (32)        -> dimension table
-- Players = many rows per team (110)   -> dimension table, FK to Teams
-- Matches = 1 row per fixture (64)     -> fact table, 2 FKs to Teams (home/away)
-- Match_Stats = 2 rows per match (128) -> fact table, FK to Matches AND Teams
--   This bridge table is what makes tactical analysis possible: it stores
--   per-team, per-match granular data (possession, passing, defending)
--   so tactics can be correlated with match outcomes, not just season averages.
-- Denormalized name columns (team_name, home_team, away_team) are kept
-- deliberately for Power BI usability, but IDs remain the true keys.
-- ============================================================
