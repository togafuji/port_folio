class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :member
  
  validates :start_time, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :whoschedule, presence: true
  
  def self.search(keyword)
    where(["title like? OR content like? OR start_time like? OR whoschedule like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
end
