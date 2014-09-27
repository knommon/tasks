class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :from
      t.integer :to
      t.string :content
      t.integer :priority
      t.integer :status
      t.boolean :read

      t.timestamps
    end
    
    add_index :tasks, [:to, :created_at]
  end
end
