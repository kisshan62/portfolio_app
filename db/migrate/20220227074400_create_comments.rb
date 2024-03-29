class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :goal

      t.timestamps
    end
  end
end
