class Member < ApplicationRecord
  belongs_to :user
  has_many :schedules
  
  validates :name, presence: true
end
