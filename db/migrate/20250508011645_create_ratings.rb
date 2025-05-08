class CreateRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :overall_rating
      t.text :content
      t.integer :wifi_rating
      t.integer :crowding_rating
      t.integer :noise_rating
      t.integer :outlet_rating
      t.integer :comfort_and_workspace_rating

      t.timestamps
    end
  end
end
