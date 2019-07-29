class CreateUserGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_goals do |t|
      t.integer :user_id
      t.integer :goal_id
      t.string :frequency # daily or weekly
      t.boolean :completion , default: false
      t.text :notes # use simple_format with a ul
      t.timestamps
    end
  end
end
