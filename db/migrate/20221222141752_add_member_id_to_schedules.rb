class AddMemberIdToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :member_id, :integer
  end
end
