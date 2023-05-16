class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :project_id
      t.string :status
      t.datetime :open_time
      t.datetime :close_time

      t.timestamps
    end
  end
end
