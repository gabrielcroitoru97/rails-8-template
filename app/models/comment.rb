# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  location_id  :integer
#
class Comment < ApplicationRecord

  belongs_to :location, required: true, class_name: "WorkLocation", foreign_key: "location_id"
  belongs_to :commenter, required: true, class_name: "User", foreign_key: "commenter_id"

  validates :location_id, presence: true
  validates :content, presence: true
  validates :commenter_id, presence: true
  


end
