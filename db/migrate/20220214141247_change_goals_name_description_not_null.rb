class ChangeGoalsNameDescriptionNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :goals, :name, false
    change_column_null :goals, :description, false
  end
end
