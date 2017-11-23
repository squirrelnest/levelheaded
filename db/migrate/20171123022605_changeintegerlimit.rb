class Changeintegerlimit < ActiveRecord::Migration
  def change
    change_column :restaurants, :phone, :integer, limit: 8
  end
end
