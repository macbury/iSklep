# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081214100357) do

  create_table "kategorie", :force => true do |t|
    t.string   "nazwa"
    t.integer  "parent_id"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "produkty_count"
  end

  create_table "producenci", :force => true do |t|
    t.string   "nazwa"
    t.string   "permalink"
    t.integer  "produkty_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produkty", :force => true do |t|
    t.string   "nazwa"
    t.text     "opis"
    t.integer  "kategoria_id"
    t.float    "cena"
    t.integer  "producent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.string   "zdjecie_file_name"
    t.string   "zdjecie_content_type"
    t.integer  "zdjecie_file_size"
    t.datetime "zdjecie_updated_at"
  end

  create_table "uzytkownicy", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  add_index "uzytkownicy", ["login"], :name => "index_uzytkownicy_on_login", :unique => true

  create_table "zdjecia", :force => true do |t|
    t.string   "zdjecie_file_name"
    t.string   "zdjecie_content_type"
    t.integer  "zdjecie_file_size"
    t.datetime "zdjecie_updated_at"
    t.integer  "produkt_id"
  end

end
