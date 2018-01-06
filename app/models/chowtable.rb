class Chowtable < ActiveRecord::Base

  belongs_to :restaurant
  has_many :reviews
  has_many :users, through: :reviews

  def average
    reviews.average(:wobble).round(1)
    # sum = 0
    # divisor = 0
    # self.reviews.each do |review|
    #   sum += review.wobble
    #   divisor += 1
    # end
    # if sum > 0
    #   sum / divisor
    # else
    #   0
    # end
  end

end
