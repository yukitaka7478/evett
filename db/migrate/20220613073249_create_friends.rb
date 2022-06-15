class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :followed_id
      t.integer :following_id

      t.timestamps
    end
    add_index :friends, :followed_id
    add_index :friends, :following_id
    add_index :friends, [:following_id, :followed_id], unique: true
  end
end
