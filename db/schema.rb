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

ActiveRecord::Schema.define(:version => 20101003171223) do

  create_table "items", :force => true do |t|
    t.integer  "scene_id"
    t.string   "type"
    t.string   "source_url"
    t.string   "author"
    t.string   "title"
    t.text     "content"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "device"
    t.datetime "source_created_at"
    t.integer  "rating"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["created_at"], :name => "index_items_on_created_at"
  add_index "items", ["rating"], :name => "index_items_on_rating"
  add_index "items", ["scene_id"], :name => "index_items_on_scene_id"
  add_index "items", ["source_created_at"], :name => "index_items_on_source_created_at"
  add_index "items", ["type"], :name => "index_items_on_type"

  create_table "scenes", :force => true do |t|
    t.integer  "story_id"
    t.string   "scene_type"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "previous_scene_id"
    t.integer  "next_scene_id"
    t.integer  "transport_mode_id"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenes", ["ended_at"], :name => "index_scenes_on_ended_at"
  add_index "scenes", ["name"], :name => "index_scenes_on_name"
  add_index "scenes", ["rating"], :name => "index_scenes_on_rating"
  add_index "scenes", ["scene_type"], :name => "index_scenes_on_scene_type"
  add_index "scenes", ["started_at"], :name => "index_scenes_on_started_at"
  add_index "scenes", ["story_id"], :name => "index_scenes_on_story_id"

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["created_at"], :name => "index_stories_on_created_at"
  add_index "stories", ["name"], :name => "index_stories_on_name"
  add_index "stories", ["updated_at"], :name => "index_stories_on_updated_at"
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "transport_modes", :force => true do |t|
    t.string "name"
  end

  add_index "transport_modes", ["name"], :name => "index_transport_modes_on_name"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                                 :null => false
    t.string   "email"
    t.string   "crypted_password",                      :null => false
    t.string   "password_salt",                         :null => false
    t.string   "persistence_token",                     :null => false
    t.string   "perishable_token"
    t.integer  "login_count",       :default => 0,      :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "role",              :default => "user", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
