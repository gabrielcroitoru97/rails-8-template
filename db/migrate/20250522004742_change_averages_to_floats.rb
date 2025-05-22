class ChangeAveragesToFloats < ActiveRecord::Migration[8.0]
  def change
    change_column :work_locations, :wifi_speed_average, :float
    change_column :work_locations, :average_rating, :float
    change_column :work_locations, :crowding_average, :float
    change_column :work_locations, :noise_average, :float
    change_column :work_locations, :outlet_availability_average, :float
    add_column :work_locations, :comfort_and_workspace_rating, :float
  end
end
