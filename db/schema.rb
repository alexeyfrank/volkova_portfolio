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

ActiveRecord::Schema.define(:version => 20130423173820) do

  create_table "biographies", :force => true do |t|
    t.string   "photo"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "biography_review_translations", :force => true do |t|
    t.integer  "biography_review_id"
    t.string   "locale"
    t.text     "content"
    t.string   "author"
    t.string   "position"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "biography_review_translations", ["biography_review_id"], :name => "index_biography_review_translations_on_biography_review_id"
  add_index "biography_review_translations", ["locale"], :name => "index_biography_review_translations_on_locale"

  create_table "biography_reviews", :force => true do |t|
    t.text     "content"
    t.string   "author"
    t.string   "position"
    t.integer  "biography_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "biography_translations", :force => true do |t|
    t.integer  "biography_id"
    t.string   "locale"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "biography_translations", ["biography_id"], :name => "index_biography_translations_on_biography_id"
  add_index "biography_translations", ["locale"], :name => "index_biography_translations_on_locale"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "client_images", :force => true do |t|
    t.string   "image"
    t.string   "title"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "site"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "main_pages", :force => true do |t|
    t.text     "content"
    t.string   "first_photo"
    t.string   "second_photo"
    t.string   "third_photo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "managers", :force => true do |t|
    t.string   "full_name"
    t.string   "photo"
    t.string   "email"
    t.string   "state"
    t.string   "region"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "file"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_photo_translations", :force => true do |t|
    t.integer  "project_photo_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "project_photo_translations", ["locale"], :name => "index_project_photo_translations_on_locale"
  add_index "project_photo_translations", ["project_photo_id"], :name => "index_project_photo_translations_on_project_photo_id"

  create_table "project_photos", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_translations", :force => true do |t|
    t.integer  "project_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_translations", ["locale"], :name => "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], :name => "index_project_translations_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "preview"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "translations", :force => true do |t|
    t.string   "locale"
    t.string   "key"
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc",        :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "translations", ["locale", "key"], :name => "index_translations_on_locale_and_key", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "state"
  end

end
