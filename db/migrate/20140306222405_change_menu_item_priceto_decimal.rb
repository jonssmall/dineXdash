class ChangeMenuItemPricetoDecimal < ActiveRecord::Migration
  def change
  	change_column :menu_items, :price, :decimal, precision: 9, scale: 2
  end
end
