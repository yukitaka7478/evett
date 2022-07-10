class AddClassToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rank_id, :integer, default: "1", null: false
  end
end
