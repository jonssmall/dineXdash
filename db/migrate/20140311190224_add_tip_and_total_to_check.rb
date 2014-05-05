class AddTipAndTotalToCheck < ActiveRecord::Migration
  def change
  	add_column :checks, :tip, :integer
  	add_column :checks, :total, :decimal, precision: 9, scale: 2
  end
end
