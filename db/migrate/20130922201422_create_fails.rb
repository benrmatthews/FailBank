class CreateFails < ActiveRecord::Migration
  def change
    create_table :fails do |t|
      t.string :name
      t.string :description
      t.string :lesson
      t.integer :user_id

      t.timestamps
    end
    add_index :fails, [:user_id, :created_at]
  end
end
