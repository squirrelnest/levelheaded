class Table < ActiveRecord::Base

  belongs_to :restaurant
  has_many :users

  validates :name, uniqueness: true

end
