class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :member
  
  validates :start_time, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :whoschedule, presence: true
end
