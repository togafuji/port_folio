class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :title, presence: true
  validates :body, presence: true
end
