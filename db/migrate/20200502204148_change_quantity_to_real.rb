class ChangeQuantityToReal < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :quantity, :real
  end
end
