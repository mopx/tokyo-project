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

ActiveRecord::Schema.define(:version => 11) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "ward_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "vision_id"
    t.integer  "account_id"
    t.string   "flickr_id"
    t.text     "description_en"
    t.text     "description_es"
    t.text     "description_jp"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "is_published"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "schedule_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "account_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "is_published"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "visions", :force => true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "body"
    t.integer  "area_id"
    t.integer  "account_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "wiki_url"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "wards", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
