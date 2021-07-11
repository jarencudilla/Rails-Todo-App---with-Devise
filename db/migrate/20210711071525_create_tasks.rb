class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :details
      t.boolean :completed
      t.datetime :deadline
      t.string :category_id

      t.timestamps
    end
    add_index :tasks, :category_id
  end
end
