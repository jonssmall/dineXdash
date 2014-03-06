class ChangeUserToOwner < ActiveRecord::Migration
  def change
  	change_table :restaurants do |t|
  		t.rename :user_id, :owner_id
  	end
  end
end
