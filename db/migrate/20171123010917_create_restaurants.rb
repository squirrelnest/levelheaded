class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
    end
  end
end
