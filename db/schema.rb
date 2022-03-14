# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_14_001729) do
  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "recipe_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "mon_lunch_recipe_id"
    t.integer "mon_dinner_recipe_id"
    t.text "mon_notes"
    t.integer "tue_lunch_recipe_id"
    t.integer "tue_dinner_recipe_id"
    t.text "tue_notes"
    t.integer "wed_lunch_recipe_id"
    t.integer "wed_dinner_recipe_id"
    t.text "wed_notes"
    t.integer "thu_lunch_recipe_id"
    t.integer "thu_dinner_recipe_id"
    t.text "thu_notes"
    t.integer "fri_lunch_recipe_id"
    t.integer "fri_dinner_recipe_id"
    t.text "fri_notes"
    t.integer "sat_lunch_recipe_id"
    t.integer "sat_dinner_recipe_id"
    t.text "sat_notes"
    t.integer "sun_lunch_recipe_id"
    t.integer "sun_dinner_recipe_id"
    t.text "sun_notes"
    t.integer "user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "instructions"
    t.integer "serving_number"
    t.string "total_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "password_hash"
    t.string "token"
    t.boolean "is_admin", default: false
  end

end
