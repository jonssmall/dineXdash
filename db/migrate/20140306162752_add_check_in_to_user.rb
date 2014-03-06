class AddCheckInToUser < ActiveRecord::Migration
  def change
  	add_column :users, :checked_in, :boolean, default: false
  end
end
