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

ActiveRecord::Schema.define(version: 20170427212844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_favorites_on_show_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "show_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_votes", default: 0
    t.index ["show_id"], name: "index_reviews_on_show_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "shows", force: :cascade do |t|
    t.string   "title",                                                                                                 null: false
    t.integer  "average_rating"
    t.datetime "created_at",                                                                                            null: false
    t.datetime "updated_at",                                                                                            null: false
    t.string   "image_url",      default: "http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg", null: false
    t.string   "description",    default: "",                                                                           null: false
    t.string   "premiere_date",  default: "",                                                                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                                                         null: false
    t.string   "encrypted_password",     default: "",                                                                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                                                                  null: false
    t.datetime "updated_at",                                                                                                  null: false
    t.string   "username",                                                                                                    null: false
    t.string   "first_name",                                                                                                  null: false
    t.string   "last_name",                                                                                                   null: false
    t.boolean  "admin",                  default: false
    t.string   "avatar",                 default: "http://www.rutlandherald.com/wp-content/uploads/2017/03/default-user.png"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.boolean "vote_value", default: false, null: false
    t.integer "value",      default: 0,     null: false
    t.index ["review_id"], name: "index_votes_on_review_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

end
