# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160621174102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "body"
    t.integer  "score"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.boolean  "is_deleted",  default: false
    t.datetime "deleted_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "post_id"
    t.string   "post_type"
    t.string   "content"
    t.boolean  "is_deleted", default: false
    t.integer  "user_id"
  end

  add_index "comments", ["post_type", "post_id"], name: "index_comments_on_post_type_and_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "flag_statuses", force: :cascade do |t|
    t.string   "result"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "flag_id"
  end

  add_index "flag_statuses", ["flag_id"], name: "index_flag_statuses_on_flag_id", using: :btree

  create_table "flags", force: :cascade do |t|
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "post_type"
  end

  add_index "flags", ["post_type", "post_id"], name: "index_flags_on_post_type_and_post_id", using: :btree
  add_index "flags", ["user_id"], name: "index_flags_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "content"
    t.string   "link"
    t.boolean  "is_read",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "post_histories", force: :cascade do |t|
    t.integer  "post_history_type_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "post_id"
    t.string   "post_type"
  end

  add_index "post_histories", ["post_history_type_id"], name: "index_post_histories_on_post_history_type_id", using: :btree
  add_index "post_histories", ["post_type", "post_id"], name: "index_post_histories_on_post_type_and_post_id", using: :btree
  add_index "post_histories", ["user_id"], name: "index_post_histories_on_user_id", using: :btree

  create_table "post_history_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "action_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "privileges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "name"
    t.integer  "threshold"
  end

  add_index "privileges", ["user_id"], name: "index_privileges_on_user_id", using: :btree

  create_table "privileges_users", id: false, force: :cascade do |t|
    t.integer "privilege_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "privileges_users", ["privilege_id", "user_id"], name: "index_privileges_users_on_privilege_id_and_user_id", using: :btree
  add_index "privileges_users", ["user_id", "privilege_id"], name: "index_privileges_users_on_user_id_and_privilege_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.text     "tags"
    t.integer  "score"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.boolean  "is_deleted",   default: false
    t.datetime "deleted_at"
    t.boolean  "is_closed"
    t.integer  "closed_by_id"
    t.datetime "closed_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "site_settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suspicious_votes", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.boolean  "was_investigated", default: false
    t.integer  "investigated_by"
    t.datetime "investigated_at"
    t.integer  "suspicious_count"
    t.integer  "total_count"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_moderator"
    t.boolean  "is_admin"
    t.integer  "reputation"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "vote_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "post_type"
    t.integer  "recv_user"
  end

  add_index "votes", ["post_type", "post_id"], name: "index_votes_on_post_type_and_post_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "flag_statuses", "flags"
  add_foreign_key "flags", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "post_histories", "post_history_types"
  add_foreign_key "post_histories", "users"
  add_foreign_key "privileges", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "votes", "users"
end
