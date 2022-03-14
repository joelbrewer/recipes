class CreateMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_plans do |t|
      t.datetime :start_date
      t.integer :mon_lunch_recipe_id
      t.integer :mon_dinner_recipe_id
      t.integer :mon_notes
      t.integer :tue_lunch_recipe_id
      t.integer :tue_dinner_recipe_id
      t.integer :tue_notes
      t.integer :wed_lunch_recipe_id
      t.integer :wed_dinner_recipe_id
      t.integer :wed_notes
      t.integer :thu_lunch_recipe_id
      t.integer :thu_dinner_recipe_id
      t.integer :thu_notes
      t.integer :fri_lunch_recipe_id
      t.integer :fri_dinner_recipe_id
      t.integer :fri_notes
      t.integer :sat_lunch_recipe_id
      t.integer :sat_dinner_recipe_id
      t.integer :sat_notes
      t.integer :sun_lunch_recipe_id
      t.integer :sun_dinner_recipe_id
      t.integer :sun_notes
    end
  end
end
