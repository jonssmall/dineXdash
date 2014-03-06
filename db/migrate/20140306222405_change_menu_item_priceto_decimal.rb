class ChangeMenuItemPricetoDecimal < ActiveRecord::Migration
  def change
  	change_column :menu_items, :price, :decimal, precision: 2, scale: 10
  end
end
