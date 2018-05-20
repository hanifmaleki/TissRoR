class AddtoCourseFavourite < ActiveRecord::Migration[5.2]
  def change
    add_column :favourite_courses, :user_id, :integer
    add_column :favourite_courses, :item_id, :integer
    add_column :favourite_courses, :item_title, :string
    add_column :favourite_courses, :item_type, :string
  end
end
