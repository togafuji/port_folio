class RemoveMemberIdFromSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_column :schedules, :member_id, :integer
  end
end
