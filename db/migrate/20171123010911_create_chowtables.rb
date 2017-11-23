class CreateChowtables < ActiveRecord::Migration
  def change
    create_table :chowtables do |t|
      t.integer :number
      t.string :type
    end
  end
end
