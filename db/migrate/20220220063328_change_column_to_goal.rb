class ChangeColumnToGoal < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :name, :title
  end
end
