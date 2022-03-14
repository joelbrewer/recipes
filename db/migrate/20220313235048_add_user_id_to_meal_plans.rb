class AddUserIdToMealPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :meal_plans, :user_id, :integer
  end
end
