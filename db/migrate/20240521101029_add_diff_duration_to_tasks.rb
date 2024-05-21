class AddDiffDurationToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :hours, :integer
    add_column :tasks, :minutes, :integer
    add_column :tasks, :seconds, :integer
  end
end
