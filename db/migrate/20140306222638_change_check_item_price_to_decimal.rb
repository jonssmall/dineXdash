class ChangeCheckItemPriceToDecimal < ActiveRecord::Migration
  def change
  	change_column :check_items, :price, :decimal, precision: 2, scale: 10
  end
end
