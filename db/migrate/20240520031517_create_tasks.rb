class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.integer :total_time, default: 0, null: false
      t.datetime :last_started_at
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
