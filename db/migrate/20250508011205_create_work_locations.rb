class CreateWorkLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :work_locations do |t|
      t.integer :location_type_id
      t.integer :wifi_speed_average
      t.string :address
      t.string :phone_number
      t.string :website
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :longitude
      t.string :latitude
      t.text :description
      t.string :name
      t.float :average_rating
      t.integer :owner_id
      t.integer :crowding_average
      t.integer :noise_average
      t.boolean :requires_purchase
      t.boolean :membership
      t.time :sunday_opening_time
      t.time :monday_opening_time
      t.time :tuesday_opening_time
      t.time :wednesday_opening_time
      t.time :thursday_opening_time
      t.time :friday_opening_time
      t.time :saturday_opening_time
      t.time :sunday_closing_time
      t.time :monday_closing_time
      t.time :tuesday_closing_time
      t.time :wednesday_closing_time
      t.time :thursday_closing_time
      t.time :friday_closing_time
      t.time :saturday_closing_time
      t.boolean :sunday_closed
      t.boolean :monday_closed
      t.boolean :tuesday_closed
      t.boolean :wednesday_closed
      t.boolean :thursday_closed
      t.boolean :friday_closed
      t.boolean :saturday_closed
      t.integer :outlet_availability_average

      t.timestamps
    end
  end
end
