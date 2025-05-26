class AddRatingIdToImages < ActiveRecord::Migration[8.0]
  def change
    add_column :images, :rating_id, :integer
  end
end
