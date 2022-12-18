class Schedule < ApplicationRecord
  belongs_to :user
  
  validates :start_time, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
