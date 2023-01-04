class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
   mount_uploader :avatar, AvatarUploader
  validates :when_diary, presence: true
end
