class ChangeDefaultDiffDurationToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :hours, 0
    change_column_default :tasks, :minutes, 0
    change_column_default :tasks, :seconds, 0
  end
end
