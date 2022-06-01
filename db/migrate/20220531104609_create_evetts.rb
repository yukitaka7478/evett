class CreateEvetts < ActiveRecord::Migration[6.0]
  def change
    create_table :evetts do |t|
      t.string     :name,         null: false
      t.text       :text,         null: false
      t.integer    :price,        null: false
      t.date       :limit_date
      t.integer    :share_area_id
      t.references :user,         null: false, foreign_key: true 
      t.timestamps
    end
  end
end
