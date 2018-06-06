class ChangeFavourite < ActiveRecord::Migration[5.2]
  def change
    change_column :favourite_courses, :item_id, :string
    rename_table :favourite_courses, :favourites
  end
end
