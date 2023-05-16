class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :user_id
      t.string :status
      t.datetime :open_time
      t.datetime :close_time

      t.timestamps
    end
    add_index :projects, :title, unique: true
  end
end
