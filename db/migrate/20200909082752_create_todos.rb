require 'date'

class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :content, null: false
      t.boolean :status, default: false
      t.date :due, null: false 
      t.integer :priority, default: 1

      t.timestamps
    end
  end
end
