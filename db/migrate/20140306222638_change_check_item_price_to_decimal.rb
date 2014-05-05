class ChangeCheckItemPriceToDecimal < ActiveRecord::Migration
  def change
  	change_column :check_items, :price, :decimal, precision: 9, scale: 2
  end
end
