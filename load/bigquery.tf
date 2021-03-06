resource "google_bigquery_dataset" "data_warehouse" {
  dataset_id  = "footy_data_warehouse"
  description = "This is the Footy data warehouse"
  location    = var.location
  project     = var.project

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }
}

resource "google_bigquery_table" "teams_import" {
  dataset_id = google_bigquery_dataset.data_warehouse.dataset_id
  table_id   = "src_teams_import"
  project    = var.project

  external_data_configuration {
    autodetect    = false
    source_format = "CSV"
    schema        = <<EOF
                    [
  { "name": "team_name", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "common_name", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "season", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "country", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "matches_played", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "matches_played_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "matches_played_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "suspended_matches", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "wins", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "wins_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "wins_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draws", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draws_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draws_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "losses", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "losses_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "losses_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "points_per_game", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "points_per_game_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "points_per_game_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "league_position", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "league_position_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "league_position_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "performance_rank", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_scored", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_conceded", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goal_difference", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "total_goal_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "total_goal_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "total_goal_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_scored_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_scored_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_conceded_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_conceded_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goal_difference_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goal_difference_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "minutes_per_goal_scored", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "minutes_per_goal_scored_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "minutes_per_goal_scored_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "minutes_per_goal_conceded",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "minutes_per_goal_conceded_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "minutes_per_goal_conceded_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "clean_sheets", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "clean_sheets_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "clean_sheets_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_count_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "first_team_to_score_count",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "first_team_to_score_count_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "first_team_to_score_count_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "corners_total", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "corners_total_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "corners_total_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "cards_total", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "cards_total_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "cards_total_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "average_possession", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "average_possession_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "average_possession_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_on_target", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_on_target_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_on_target_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_off_target", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_off_target_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "shots_off_target_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fouls", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fouls_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fouls_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_scored_half_time", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "goals_scored_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "goals_conceded_half_time", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "goals_conceded_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goal_difference_half_time",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goal_difference_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goal_difference_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "leading_at_half_time", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "leading_at_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "leading_at_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "draw_at_half_time", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draw_at_half_time_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draw_at_half_time_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "losing_at_half_time", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "losing_at_half_time_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "losing_at_half_time_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "points_per_game_half_time",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "points_per_game_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "points_per_game_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "average_total_goals_per_match",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "average_total_goals_per_match_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "average_total_goals_per_match_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "goals_scored_per_match", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "goals_scored_per_match_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_per_match_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "goals_conceded_per_match", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "goals_conceded_per_match_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_per_match_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "total_goals_per_match_half_time",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "total_goals_per_match_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "total_goals_per_match_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_per_match_half_time",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_per_match_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_per_match_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_per_match_half_time",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_per_match_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_per_match_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "over05_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over35_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over45_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over55_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over05_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over35_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over45_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over55_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over05_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over35_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over45_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over55_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under05_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under15_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under25_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under35_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under45_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under55_count", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under05_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under15_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under25_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under35_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under45_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under55_count_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under05_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under15_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under25_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under35_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under45_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under55_count_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over05_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over35_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over45_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over55_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over05_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over35_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over45_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over55_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over05_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over35_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over45_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over55_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under05_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under15_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under25_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under35_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under45_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under55_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under05_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under15_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under25_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under35_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under45_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under55_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under05_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under15_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under25_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under35_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under45_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "under55_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over05_count_half_time", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over15_count_half_time", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "over25_count_half_time", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "over05_count_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over15_count_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over25_count_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over05_count_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over15_count_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over25_count_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over05_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over15_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over25_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over05_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over15_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over25_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over05_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over15_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over25_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "win_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "win_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "win_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "home_advantage_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "clean_sheet_percentage", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "clean_sheet_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "clean_sheet_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "btts_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_percentage", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "first_team_to_score_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "first_team_to_score_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "first_team_to_score_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "clean_sheet_half_time", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "clean_sheet_half_time_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "clean_sheet_half_time_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "clean_sheet_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "clean_sheet_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "clean_sheet_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "fts_half_time", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_half_time_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_half_time_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "fts_half_time_percentage", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "fts_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "fts_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "btts_half_time", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_half_time_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "btts_half_time_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "btts_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "btts_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "btts_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "leading_at_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "leading_at_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "leading_at_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "draw_at_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "draw_at_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "draw_at_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "losing_at_half_time_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "losing_at_half_time_percentage_home",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "losing_at_half_time_percentage_away",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "corners_per_match", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "corners_per_match_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "corners_per_match_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "cards_per_match", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "cards_per_match_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "cards_per_match_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "over65_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over75_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over85_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over95_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over105_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over115_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over125_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over135_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "xg_for_avg_overall", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "xg_for_avg_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "xg_for_avg_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "xg_against_avg_overall", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "xg_against_avg_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "xg_against_avg_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "prediction_risk", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "goals_scored_min_0_to_10", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "goals_scored_min_11_to_20",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_21_to_30",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_31_to_40",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_41_to_50",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_51_to_60",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_61_to_70",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_71_to_80",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_scored_min_81_to_90",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_0_to_10",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_11_to_20",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_21_to_30",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_31_to_40",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_41_to_50",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_51_to_60",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_61_to_70",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_71_to_80",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "goals_conceded_min_81_to_90",
    "type" : "STRING",
    "mode": "NULLABLE"
  },
  { "name": "draw_percentage_overall", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draw_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "draw_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "loss_percentage_ovearll", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "loss_percentage_home", "type" : "STRING", "mode": "NULLABLE" },
  { "name": "loss_percentage_away", "type" : "STRING", "mode": "NULLABLE" },
  {
    "name": "over145_corners_percentage",
    "type" : "STRING",
    "mode": "NULLABLE"
  }
]

                  EOF

    csv_options {
      quote                 = "\""
      allow_quoted_newlines = true
    }
    source_uris = [
      "gs://${google_storage_bucket.footy_stats_sink.name}/${var.teams_import_wildcard_object}"
    ]
  }
}

resource "google_bigquery_table" "matches_import" {
  dataset_id = google_bigquery_dataset.data_warehouse.dataset_id
  table_id   = "src_matches_import"
  project    = var.project

  external_data_configuration {
    autodetect    = false
    source_format = "CSV"
    schema        = <<EOF
                   [
  { "name": "timestamp", "type": "STRING", "mode": "NULLABLE" },
  { "name": "date_GMT", "type": "STRING", "mode": "NULLABLE" },
  { "name": "status", "type": "STRING", "mode": "NULLABLE" },
  { "name": "attendance", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_name", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_name", "type": "STRING", "mode": "NULLABLE" },
  { "name": "referee", "type": "STRING", "mode": "NULLABLE" },
  { "name": "Game_Week", "type": "STRING", "mode": "NULLABLE" },
  { "name": "Pre_Match_PPG__Home_", "type": "STRING", "mode": "NULLABLE" },
  { "name": "Pre_Match_PPG__Away_", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_ppg", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_ppg", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_goal_count", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_goal_count", "type": "STRING", "mode": "NULLABLE" },
  { "name": "total_goal_count", "type": "STRING", "mode": "NULLABLE" },
  { "name": "total_goals_at_half_time", "type": "STRING", "mode": "NULLABLE" },
  {
    "name": "home_team_goal_count_half_time",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "away_team_goal_count_half_time",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  { "name": "home_team_goal_timings", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_goal_timings", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_corner_count", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_corner_count", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_yellow_cards", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_red_cards", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_yellow_cards", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_red_cards", "type": "STRING", "mode": "NULLABLE" },
  {
    "name": "home_team_first_half_cards",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "home_team_second_half_cards",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "away_team_first_half_cards",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "away_team_second_half_cards",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  { "name": "home_team_shots", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_shots", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_shots_on_target", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_shots_on_target", "type": "STRING", "mode": "NULLABLE" },
  {
    "name": "home_team_shots_off_target",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "away_team_shots_off_target",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  { "name": "home_team_fouls", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_fouls", "type": "STRING", "mode": "NULLABLE" },
  { "name": "home_team_possession", "type": "STRING", "mode": "NULLABLE" },
  { "name": "away_team_possession", "type": "STRING", "mode": "NULLABLE" },
  { "name": "team_a_xg", "type": "STRING", "mode": "NULLABLE" },
  { "name": "team_b_xg", "type": "STRING", "mode": "NULLABLE" },
  {
    "name": "average_goals_per_match_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  { "name": "btts_percentage_pre_match", "type": "STRING", "mode": "NULLABLE" },
  {
    "name": "over_15_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_25_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_35_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_45_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_15_HT_FHG_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_05_HT_FHG_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_15_2HG_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "over_05_2HG_percentage_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "average_corners_per_match_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "average_cards_per_match_pre_match",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  { "name": "odds_ft_home_team_win", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_ft_draw", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_ft_away_team_win", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_ft_over15", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_ft_over25", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_ft_over35", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_ft_over45", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_btts_yes", "type": "STRING", "mode": "NULLABLE" },
  { "name": "odds_btts_no", "type": "STRING", "mode": "NULLABLE" },
  { "name": "stadium_name", "type": "STRING", "mode": "NULLABLE" }
]
                  EOF
    csv_options {
      quote                 = "\""
      allow_quoted_newlines = true
    }
    source_uris = [
      "gs://${google_storage_bucket.footy_stats_sink.name}/${var.matches_import_wildcard_object}"
    ]
  }
}

resource "google_bigquery_table" "total_prediction" {
  dataset_id = google_bigquery_dataset.data_warehouse.dataset_id
  table_id   = "total_prediction"
  project    = var.project

  external_data_configuration {
    autodetect    = false
    source_format = "CSV"
    schema        = <<EOF
                   [
{"name": "home_team_name", "type": "STRING", "mode": "NULLABLE"},
 {"name": "away_team_name", "type": "STRING", "mode": "NULLABLE"},
 {"name": "row_added", "type": "STRING", "mode": "NULLABLE"},
 {"name": "predicted_result", "type": "STRING", "mode": "NULLABLE"},
 {"name": "real_result", "type": "STRING", "mode": "NULLABLE"},
 {"name": "odds_ft_home_team_win", "type": "STRING", "mode": "NULLABLE"},
 {"name": "odds_ft_draw", "type": "STRING", "mode": "NULLABLE"},
 {"name": "odds_ft_away_team_win", "type": "STRING", "mode": "NULLABLE"},
 {"name": "match_id", "type": "FLOAT", "mode": "NULLABLE"},
{"name": "date_time", "type": "STRING", "mode": "NULLABLE"}
    ]
                  EOF
    csv_options {
      quote                 = "\""
      allow_quoted_newlines = true
    }
    source_uris = [
      "gs://${google_storage_bucket.footy_predictions_sink.name}/*"
    ]
  }
}

resource "google_bigquery_table" "total_result_check" {
  dataset_id = google_bigquery_dataset.data_warehouse.dataset_id
  table_id   = "total_result_check"
  project    = var.project

  external_data_configuration {
    autodetect    = false
    source_format = "CSV"
    schema        = <<EOF
[
  {
    "name": "match_id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "date_GMT",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "status",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "home_team_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "away_team_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "real_result",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "possible_win",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "predicted_results",
    "type": "FLOAT",
    "mode": "NULLABLE"
  }
]
EOF
    csv_options {
      quote                 = "\""
      allow_quoted_newlines = true
      skip_leading_rows = 1
    }
    source_uris = [
      "gs://${google_storage_bucket.footy_result_check_over_time_sink.name}/*"
    ]
  }
}