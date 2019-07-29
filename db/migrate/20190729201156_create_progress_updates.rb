class CreateProgressUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :progress_updates do |t|
      t.string :content
      t.integer :user_goal_id
      t.timestamps
    end
  end
end
