class AddMetadataToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :serving_number, :integer
    add_column :recipes, :total_time, :string
  end
end
