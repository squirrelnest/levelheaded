class User < ActiveRecord::Base

  has_many :tables
  has_many :restaurant_tables
  has_many :restaurants, through: :restaurant_tables

  validates :name, uniqueness: true

end
