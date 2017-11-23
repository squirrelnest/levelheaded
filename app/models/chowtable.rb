class Chowtable < ActiveRecord::Base

  belongs_to :restaurant
  has_many :reviews
  has_many :users, through: :reviews

  def average
    sum = 0
    divisor = 0
    self.reviews.each do |review|
      sum += review.wobble
      divisor += 1
    end
    sum / divisor
  end

end
