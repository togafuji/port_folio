class AddWhoscheduleToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :whoschedule, :string
  end
end
