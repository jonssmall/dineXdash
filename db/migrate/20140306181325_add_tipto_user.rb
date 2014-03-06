class AddTiptoUser < ActiveRecord::Migration
  def change
  	add_column :users, :tip, :integer, default: 15
  end
end
