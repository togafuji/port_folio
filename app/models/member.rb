class Member < ApplicationRecord
  belongs_to :user
  has_many :schedules

  validates :name：string, presence: true
end
