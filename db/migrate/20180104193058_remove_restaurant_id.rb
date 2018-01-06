class RemoveRestaurantId < ActiveRecord::Migration
  def change
    remove_column :users, :restaurant_id
  end
end
