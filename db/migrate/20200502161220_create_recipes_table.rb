class CreateRecipesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
