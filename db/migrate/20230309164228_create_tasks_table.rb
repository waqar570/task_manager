class CreateTasksTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :deadline
      t.string :status
      
      t.timestamps
    end
  end
end
