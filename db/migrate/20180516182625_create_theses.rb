class CreateTheses < ActiveRecord::Migration[5.2]
  def change
    create_table :theses do |t|
      t.string :type
      t.string :title
      t.string :institue
      t.string :institueName
      t.string :facultyCode
      t.string :keywords
      t.string :language
      t.string :advisor
      t.string :facultyName

      t.timestamps
    end
  end
end
