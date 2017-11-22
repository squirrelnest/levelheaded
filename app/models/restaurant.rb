class Restaurant < ActiveRecord::Base

  has_many :users
  has_many :restaurant_tables
  has_many :tables, through: :restaurant_tables

end
