class AddTimerToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :start_time, :datetime, null: false, default: Time.now
    add_column :tasks, :stop_time, :datetime, null: false, default: Time.now

    change_column :tasks, :duration, :datetime, null: false, default: 0
  end
end
