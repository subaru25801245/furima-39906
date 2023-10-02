class AddDetailsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :info, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :del_burden_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :del_day_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end
