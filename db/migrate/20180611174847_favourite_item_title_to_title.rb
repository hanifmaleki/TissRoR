class FavouriteItemTitleToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :favourites, :item_title, :title
  end
end
