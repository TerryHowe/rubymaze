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

ActiveRecord::Schema.define(version: 20170510163551) do

  create_table "passages", force: :cascade do |t|
    t.integer "source_id"
    t.integer "destination_id"
    t.integer "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_passages_on_destination_id"
    t.index ["source_id"], name: "index_passages_on_source_id"
    t.index [nil, "direction"], name: "index_passages_on_source_and_direction", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["x", "y"], name: "index_rooms_on_x_and_y", unique: true
  end

end
