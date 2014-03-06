class AddQuantityToCheckItem < ActiveRecord::Migration
  def change
    add_column :check_items, :quantity, :integer
  end
end
