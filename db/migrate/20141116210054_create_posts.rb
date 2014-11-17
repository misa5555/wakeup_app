class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :wakeup_time
      t.integer :user_id, null: false
      t.text :memo
      t.timestamps
    end
  end
end
