# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable




  has_many  :comments, class_name: "Comment", foreign_key: "commenter_id", dependent: :destroy
  has_many  :ratings, class_name: "Rating", foreign_key: "user_id", dependent: :destroy
  has_many  :work_locations, class_name: "WorkLocation", foreign_key: "owner_id", dependent: :destroy
  has_many  :images, class_name: "Image", foreign_key: "poster_id", dependent: :destroy
  has_many  :favorite_places, class_name: "FavoritePlace", foreign_key: "user_id", dependent: :destroy

  has_many :preferred_places, through: :work_locations, source: :favorite_places

  validates :username, presence: true

 
end
