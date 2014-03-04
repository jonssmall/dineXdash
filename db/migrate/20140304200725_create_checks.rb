class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.datetime :paid_at

      t.timestamps
    end
  end
end
