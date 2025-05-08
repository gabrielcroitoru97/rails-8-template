class CreateLocationTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :location_types do |t|
      t.string :descriptor

      t.timestamps
    end
  end
end
