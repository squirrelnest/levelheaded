class CreateChowtables < ActiveRecord::Migration
  def change
    create_table :chowtables do |t|
      t.integer :number
      t.string :table_type
      t.integer :restaurant_id
    end
  end
end
