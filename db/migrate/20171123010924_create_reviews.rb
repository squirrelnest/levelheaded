class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :wobble
      t.integer :restaurant_id
      t.integer :user_id
      t.integer :chowtable_id
      t.timestamps
    end
  end
end
