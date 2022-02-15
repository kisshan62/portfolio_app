class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
