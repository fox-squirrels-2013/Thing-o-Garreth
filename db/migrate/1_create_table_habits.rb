class CreateTableHabits < ActiveRecord::Migration 
  def change 
    create_table :habits do |t| 
      t.string  :habit_name
      t.string  :habit_description
      t.timestamps 
    end 
  end 
end 
