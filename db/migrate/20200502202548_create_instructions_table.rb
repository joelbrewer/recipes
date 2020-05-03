class CreateInstructionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.integer :recipe_id
      t.text :text
      t.integer :order
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
