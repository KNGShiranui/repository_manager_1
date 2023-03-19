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

ActiveRecord::Schema.define(version: 2023_03_19_131758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignees", force: :cascade do |t|
    t.bigint "issue_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_assignees_on_issue_id"
    t.index ["user_id"], name: "index_assignees_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.bigint "repository_id"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_branches_on_parent_id"
    t.index ["repository_id"], name: "index_branches_on_repository_id"
  end

  create_table "commits", force: :cascade do |t|
    t.string "message"
    t.bigint "branch_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_commits_on_branch_id"
    t.index ["user_id"], name: "index_commits_on_user_id"
  end

  create_table "diffs", force: :cascade do |t|
    t.bigint "old_object_id"
    t.bigint "new_object_id"
    t.text "diff_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["new_object_id"], name: "index_diffs_on_new_object_id"
    t.index ["old_object_id"], name: "index_diffs_on_old_object_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "repository_id"
    t.string "status"
    t.string "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repository_id"], name: "index_issues_on_repository_id"
  end

  create_table "objects", force: :cascade do |t|
    t.bigint "branch_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_objects_on_branch_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.string "access_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "repository_holder_teams", force: :cascade do |t|
    t.bigint "repository_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repository_id"], name: "index_repository_holder_teams_on_repository_id"
    t.index ["team_id"], name: "index_repository_holder_teams_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_teams_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignees", "issues"
  add_foreign_key "assignees", "users"
  add_foreign_key "branches", "branches", column: "parent_id"
  add_foreign_key "branches", "repositories"
  add_foreign_key "commits", "branches"
  add_foreign_key "commits", "users"
  add_foreign_key "diffs", "objects", column: "new_object_id"
  add_foreign_key "diffs", "objects", column: "old_object_id"
  add_foreign_key "issues", "repositories"
  add_foreign_key "objects", "branches"
  add_foreign_key "repositories", "users"
  add_foreign_key "repository_holder_teams", "repositories"
  add_foreign_key "repository_holder_teams", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "users", column: "owner_id"
end
