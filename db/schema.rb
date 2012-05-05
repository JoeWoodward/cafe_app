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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 17) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.integer  "section_id"
    t.integer  "position"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "menu_items", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price_pound"
    t.integer  "price_pence"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.integer  "category_id"
    t.integer  "position"
  end

  add_index "menu_items", ["slug"], :name => "index_menu_items_on_slug"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "sections", ["slug"], :name => "index_sections_on_slug"

  create_table "specials", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price_pound"
    t.integer  "price_pence"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.integer  "position"
  end

  add_index "specials", ["slug"], :name => "index_specials_on_slug"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                           :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "slug"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"
  add_index "users", ["slug"], :name => "index_users_on_slug"

end
