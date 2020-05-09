class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
