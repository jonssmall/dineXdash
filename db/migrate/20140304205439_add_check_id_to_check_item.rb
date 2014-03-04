class AddCheckIdToCheckItem < ActiveRecord::Migration
  def change
  	add_column :check_items, :check_id, :integer
  end
end
