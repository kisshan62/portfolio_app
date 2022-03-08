class AddColumnToGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :start_date, :date
    add_column :goals, :due_date, :date
    add_column :goals, :done, :boolean, default: false
  end
end
