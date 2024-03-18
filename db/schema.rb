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

ActiveRecord::Schema[7.1].define(version: 2024_03_17_103916) do
  create_table "job_applications", force: :cascade do |t|
    t.integer "job_seeker_id", null: false
    t.integer "job_post_id", null: false
    t.string "status", default: "Not Seen", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_post_id"], name: "index_job_applications_on_job_post_id"
    t.index ["job_seeker_id"], name: "index_job_applications_on_job_seeker_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "created_by"
    t.integer "updated_by"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "index_job_posts_on_created_by_id"
    t.index ["updated_by_id"], name: "index_job_posts_on_updated_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "job_applications", "job_posts"
  add_foreign_key "job_applications", "users", column: "job_seeker_id"
  add_foreign_key "job_posts", "users", column: "created_by_id"
  add_foreign_key "job_posts", "users", column: "updated_by_id"
end
