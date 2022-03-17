class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :title
      t.string :description
      t.integer :goal_id
      t.belongs_to :goal, foreign_key: true
      t.date :start_date
      t.date :due_date
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
