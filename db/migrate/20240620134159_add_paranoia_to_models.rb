class AddParanoiaToModels < ActiveRecord::Migration[7.1]
  def change
    add_column :project, :deleted_at, :datetime
    add_column :users, :deleted_at, :datetime
    add_column :tasks, :deleted_at, :datetime
    add_column :timers, :deleted_at, :datetime


    add_index :project, :deleted_at
    add_index :users, :deleted_at
    add_index :tasks, :deleted_at
    add_index :timers, :deleted_at
  end
end
