class CreateCheckItems < ActiveRecord::Migration
  def change
    create_table :check_items do |t|
      t.integer :restaurant_id
      t.string :item_name
      t.text :item_desc
      t.integer :price

      t.timestamps
    end
  end
end
