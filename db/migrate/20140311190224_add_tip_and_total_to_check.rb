class AddTipAndTotalToCheck < ActiveRecord::Migration
  def change
  	add_column :checks, :tip, :integer
  	add_column :checks, :total, :decimal, precision: 2, scale: 10
  end
end
