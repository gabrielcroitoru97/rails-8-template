# == Schema Information
#
# Table name: work_locations
#
#  id                          :bigint           not null, primary key
#  address                     :string
#  average_rating              :float
#  city                        :string
#  crowding_average            :integer
#  description                 :text
#  friday_closed               :boolean
#  friday_closing_time         :time
#  friday_opening_time         :time
#  latitude                    :string
#  longitude                   :string
#  membership                  :boolean
#  monday_closed               :boolean
#  monday_closing_time         :time
#  monday_opening_time         :time
#  name                        :string
#  noise_average               :integer
#  outlet_availability_average :integer
#  phone_number                :string
#  requires_purchase           :boolean
#  saturday_closed             :boolean
#  saturday_closing_time       :time
#  saturday_opening_time       :time
#  state                       :string
#  sunday_closed               :boolean
#  sunday_closing_time         :time
#  sunday_opening_time         :time
#  thursday_closed             :boolean
#  thursday_closing_time       :time
#  thursday_opening_time       :time
#  tuesday_closed              :boolean
#  tuesday_closing_time        :time
#  tuesday_opening_time        :time
#  website                     :string
#  wednesday_closed            :boolean
#  wednesday_closing_time      :time
#  wednesday_opening_time      :time
#  wifi_speed_average          :integer
#  zip_code                    :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  location_type_id            :integer
#  owner_id                    :integer
#
class WorkLocation < ApplicationRecord

  has_many  :comments, foreign_key: "location_id", dependent: :destroy
  has_many  :ratings, foreign_key: "location_id", dependent: :destroy
  has_many :images, through: :ratings
  has_many  :favorite_places, foreign_key: "place_id", dependent: :destroy
  belongs_to :owner, class_name: "User"
  belongs_to :location_type

  validates :zip_code, presence: true
  validates :state, presence: true
  validates :name, presence: true
  #validates :longitude, presence: true
  #validates :latitude, presence: true
  validates :location_type_id, presence: true
  validates :city, presence: true
  validates :address, presence: true

end
