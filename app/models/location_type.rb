# == Schema Information
#
# Table name: location_types
#
#  id         :bigint           not null, primary key
#  descriptor :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LocationType < ApplicationRecord
  has_many  :work_locations, class_name: "WorkLocation", foreign_key: "location_type_id", dependent: :destroy
end
