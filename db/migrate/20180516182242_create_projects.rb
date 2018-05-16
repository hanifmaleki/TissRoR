class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :contractBegin
      t.string :contractEnd
      t.string :projectBegin
      t.string :projectEnd
      t.string :projectFrom
      t.string :projectType
      t.string :abstract
      t.string :researchArea
      t.string :institue
      t.string :keywords
      t.string :financier
      t.string :funding

      t.timestamps
    end
  end
end
