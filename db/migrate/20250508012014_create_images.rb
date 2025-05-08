class CreateImages < ActiveRecord::Migration[8.0]
  def change
    create_table :images do |t|
      t.integer :location_id
      t.integer :poster_id
      t.string :picture

      t.timestamps
    end
  end
end
