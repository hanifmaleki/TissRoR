class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    #create_table :users do |t|
    #  t.string :username
    #  t.string :name
    #  t.string :family
    #  t.string :email#

      #t.timestamps
    #end
    add_column :users, :family, :string
    add_column :users, :username, :string
    add_column :users, :password, :string

  end
end
