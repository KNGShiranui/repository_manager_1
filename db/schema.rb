# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_19_110408) do

  create_table "assignees", force: :cascade do |t|
    t.integer "issue_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_assignees_on_issue_id"
    t.index ["user_id"], name: "index_assignees_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.integer "repository_id"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_branches_on_parent_id"
    t.index ["repository_id"], name: "index_branches_on_repository_id"
  end

  create_table "commits", force: :cascade do |t|
    t.string "message"
    t.integer "branch_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_commits_on_branch_id"
    t.index ["user_id"], name: "index_commits_on_user_id"
  end

  create_table "diffs", force: :cascade do |t|
    t.integer "old_file_id"
    t.integer "new_file_id"
    t.text "diff_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["new_file_id"], name: "index_diffs_on_new_file_id"
    t.index ["old_file_id"], name: "index_diffs_on_old_file_id"
  end

  create_table "fileobjects", force: :cascade do |t|
    t.integer "branch_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_fileobjects_on_branch_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "repository_id"
    t.string "status"
    t.string "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repository_id"], name: "index_issues_on_repository_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.string "access_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "repository_holder_teams", force: :cascade do |t|
    t.integer "repository_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repository_id"], name: "index_repository_holder_teams_on_repository_id"
    t.index ["team_id"], name: "index_repository_holder_teams_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_teams_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assignees", "issues"
  add_foreign_key "assignees", "users"
  add_foreign_key "branches", "branches", column: "parent_id"
  add_foreign_key "branches", "repositories"
  add_foreign_key "commits", "branches"
  add_foreign_key "commits", "users"
  add_foreign_key "diffs", "files", column: "new_file_id"
  add_foreign_key "diffs", "files", column: "old_file_id"
  add_foreign_key "fileobjects", "branches"
  add_foreign_key "issues", "repositories"
  add_foreign_key "repositories", "users"
  add_foreign_key "repository_holder_teams", "repositories"
  add_foreign_key "repository_holder_teams", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "users", column: "owner_id"
end
