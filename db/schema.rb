# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190113052121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "home_team_id", null: false
    t.bigint "away_team_id", null: false
    t.integer "season", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "player_stats", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.string "min"
    t.integer "fgm"
    t.integer "fga"
    t.decimal "fg_pct"
    t.integer "fg3m"
    t.integer "fg3a"
    t.decimal "fg3_pct"
    t.integer "ftm"
    t.integer "fta"
    t.decimal "ft_pct"
    t.integer "oreb"
    t.integer "dreb"
    t.integer "reb"
    t.integer "ast"
    t.integer "stl"
    t.integer "blk"
    t.integer "turnover"
    t.integer "pf"
    t.integer "pts"
    t.index ["game_id"], name: "index_player_stats_on_game_id"
    t.index ["player_id"], name: "index_player_stats_on_player_id"
    t.index ["team_id"], name: "index_player_stats_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.string "position", null: false
    t.bigint "team_id", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "conference", null: false
    t.string "division", null: false
    t.string "city", null: false
    t.string "abbreviation", null: false
    t.string "name", null: false
    t.string "full_name", null: false
  end

  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
end
