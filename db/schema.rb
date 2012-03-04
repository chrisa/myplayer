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

ActiveRecord::Schema.define(:version => 20120304075634) do

  create_table "feeds", :force => true do |t|
    t.text "name"
    t.text "url"
  end

  create_table "programmes", :force => true do |t|
    t.text     "ep_pid"
    t.text     "ver_pid"
    t.text     "title"
    t.text     "summary"
    t.text     "channel"
    t.datetime "broadcast"
    t.text     "uri"
    t.integer  "feed_id"
    t.text     "image_url"
    t.integer  "duration"
    t.datetime "expires"
  end

end
