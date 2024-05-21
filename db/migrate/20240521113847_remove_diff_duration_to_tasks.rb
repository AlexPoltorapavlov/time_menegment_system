class RemoveDiffDurationToTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :hours
    remove_column :tasks, :minutes
    remove_column :tasks, :seconds
  end
end
