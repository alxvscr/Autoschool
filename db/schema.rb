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

ActiveRecord::Schema.define(version: 20160324164740) do

  create_table "groups", force: :cascade do |t|
    t.date "starttime", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.date   "drives_since",            null: false
    t.string "licence_num",  limit: 10, null: false
  end

  create_table "instructorvehicle", id: false, force: :cascade do |t|
    t.integer "id_instructor", limit: 4, null: false
    t.integer "id_vehicle",    limit: 4, null: false
  end

  add_index "instructorvehicle", ["id_instructor"], name: "instructorvehicle_ibfk_1", using: :btree
  add_index "instructorvehicle", ["id_vehicle"], name: "instructorvehicle_ibfk_2", using: :btree

  create_table "lection", force: :cascade do |t|
    t.datetime "lection_time",           null: false
    t.integer  "lection_num",  limit: 4, null: false
    t.integer  "lector_id",    limit: 4
    t.integer  "group_id",     limit: 4
  end

  add_index "lection", ["group_id"], name: "lection_ibfk_2", using: :btree
  add_index "lection", ["lector_id"], name: "lection_ibfk_1", using: :btree

  create_table "lectors", force: :cascade do |t|
    t.date "teaches_since", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string  "lastname",    limit: 25, null: false
    t.string  "firstname",   limit: 25, null: false
    t.string  "fathersname", limit: 25, null: false
    t.date    "born",                   null: false
    t.date    "reg_date",               null: false
    t.string  "phone",       limit: 10, null: false
    t.string  "category",    limit: 3,  null: false
    t.integer "group_id",    limit: 4
  end

  add_index "students", ["group_id"], name: "group_id___fk", using: :btree

  create_table "trainings", force: :cascade do |t|
    t.datetime "training_time",                                   null: false
    t.integer  "duration",      limit: 4,                         null: false
    t.integer  "mark",          limit: 4,                         null: false
    t.decimal  "petrol_usage",            precision: 4, scale: 2, null: false
    t.integer  "instructor_id", limit: 4,                         null: false
    t.integer  "vehicle_id",    limit: 4,                         null: false
    t.integer  "student_id",    limit: 4,                         null: false
  end

  add_index "trainings", ["instructor_id"], name: "trainings_ibfk_1", using: :btree
  add_index "trainings", ["student_id"], name: "trainings_ibfk_3", using: :btree
  add_index "trainings", ["vehicle_id"], name: "trainings_ibfk_2", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_num", limit: 10, null: false
    t.string "model",       limit: 20, null: false
    t.string "category",    limit: 3,  null: false
  end

  add_index "vehicles", ["vehicle_num"], name: "vehicle_num", unique: true, using: :btree

  create_table "workers", force: :cascade do |t|
    t.string  "lastname",   limit: 25, null: false
    t.string  "firstname",  limit: 25, null: false
    t.string  "patronymic", limit: 25, null: false
    t.integer "phone",      limit: 4,  null: false
    t.date    "born",                  null: false
  end

  add_foreign_key "instructors", "workers", column: "id", name: "instructors_ibfk_1"
  add_foreign_key "instructorvehicle", "instructors", column: "id_instructor", name: "instructorvehicle_ibfk_1"
  add_foreign_key "instructorvehicle", "vehicles", column: "id_vehicle", name: "instructorvehicle_ibfk_2"
  add_foreign_key "lection", "groups", name: "lection_ibfk_2"
  add_foreign_key "lection", "lectors", name: "lection_ibfk_1"
  add_foreign_key "lectors", "workers", column: "id", name: "lectrors_ibfk_1"
  add_foreign_key "students", "groups", name: "group_id___fk"
  add_foreign_key "trainings", "instructors", name: "trainings_ibfk_1"
  add_foreign_key "trainings", "students", name: "trainings_ibfk_3"
  add_foreign_key "trainings", "vehicles", name: "trainings_ibfk_2"
end
