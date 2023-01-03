class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments
  
   mount_uploader :avatar, AvatarUploader
  validates :when_diary, presence: true
end
