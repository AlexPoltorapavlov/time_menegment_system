class CreateTimers < ActiveRecord::Migration[7.1]
  def change
    create_table :timers do |t|
      t.datetime :started_at
      t.integer :total_time, default: 0, null: false
      t.references :task, null: false, foreign_key: true
      t.datetime :date_of_timer
      t.timestamps
    end
  end
end
