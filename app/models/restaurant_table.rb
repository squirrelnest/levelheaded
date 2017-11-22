class RestaurantTable < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :table

end
