class CreateFavouriteCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_courses do |t|

      t.timestamps
    end
  end
end
