class UpdateNotesType < ActiveRecord::Migration[7.0]
  def change
    change_column :meal_plans, :mon_notes, :text
    change_column :meal_plans, :tue_notes, :text
    change_column :meal_plans, :wed_notes, :text
    change_column :meal_plans, :thu_notes, :text
    change_column :meal_plans, :fri_notes, :text
    change_column :meal_plans, :sat_notes, :text
    change_column :meal_plans, :sun_notes, :text
  end
end
