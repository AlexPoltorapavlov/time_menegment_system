class ChangeDefaultDurationForTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :duration, 0
  end
end
