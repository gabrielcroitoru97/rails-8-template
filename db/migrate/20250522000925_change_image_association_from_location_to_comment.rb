class ChangeImageAssociationFromLocationToComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :location_id, :integer
    add_column :images, :comment_id, :integer
    add_index :images, :comment_id
    add_foreign_key :images, :comments
  end
end
