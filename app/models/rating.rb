# == Schema Information
#
# Table name: ratings
#
#  id                           :bigint           not null, primary key
#  comfort_and_workspace_rating :integer
#  content                      :text
#  crowding_rating              :integer
#  noise_rating                 :integer
#  outlet_rating                :integer
#  overall_rating               :integer
#  wifi_rating                  :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  location_id                  :integer
#  user_id                      :integer
#
class Rating < ApplicationRecord

  belongs_to :location, required: true, class_name: "WorkLocation", foreign_key: "location_id"
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  validates :user_id, presence: true
  validates :overall_rating, presence: true
  validates :location_id, presence: true

  has_many :images

end
