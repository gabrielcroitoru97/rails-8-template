# == Schema Information
#
# Table name: images
#
#  id          :bigint           not null, primary key
#  picture     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  comment_id  :integer
#  poster_id   :integer
#
class Image < ApplicationRecord
  mount_uploader :picture, ImageUploader

  belongs_to :comment, required: true
  belongs_to :poster, required: true, class_name: "User", foreign_key: "poster_id"

  validates :poster_id, presence: true
  validates :picture, presence: true
  validates :comment_id, presence: true
end
