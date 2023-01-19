class User < ApplicationRecord
  has_many :schedules
  has_many :homemembers
  has_many :diaries
  has_many :comments

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
