class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family, :string
    add_column :users, :username, :string
    add_column :users, :password, :string
  end
end