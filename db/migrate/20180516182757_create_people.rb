class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :preceding_titles
      t.string :picture_uri
      t.string :main_phone_number
      t.string :main_email
      t.string :consultation_hour_info

      t.timestamps
    end
  end
end
