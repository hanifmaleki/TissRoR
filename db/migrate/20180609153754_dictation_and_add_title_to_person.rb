class DictationAndAddTitleToPerson < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :institue, :institute
    rename_column :theses, :institue, :institute
    rename_column :courses, :trachingContent , :teachingContent
    add_column :people, :title, :string
  end
end
