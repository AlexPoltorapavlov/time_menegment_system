class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.datetime :duration
      t.datetime :start_time
      t.datetime :stop_time
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
