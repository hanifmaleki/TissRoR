class CreateSearchRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :search_requests do |t|
      t.string :expression
      t.string :type

      t.timestamps
    end
  end
end
