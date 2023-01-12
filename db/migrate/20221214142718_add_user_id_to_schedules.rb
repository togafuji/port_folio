class AddUserIdToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules,:user_id,:integer
  end
end
