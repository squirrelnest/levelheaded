class Restaurant < ActiveRecord::Base

  has_many :chowtables
  has_many :users

  validates :phone, uniqueness: true
  validates :phone, numericality: true

  def wobbliness
    if chowtables.joins(:reviews).count == 0
      return nil;
    else
      chowtables.joins(:reviews).average(:wobble).round(1)
    end
    # if self.chowtables.count > 0
    #   sum = 0
    #   divisor = 0
    #   self.chowtables.each do |table|
    #     table.reviews.each do |review|
    #       sum += review.wobble
    #       divisor += 1
    #     end
    #   end
    #   if sum > 0
    #     sum / divisor
    #   else
    #     0
    #   end
    # end
  end

  def formatted_phone(phone)
    "(" + phone.to_s[0..2] + ") " + phone.to_s[3..5] + "-" + phone.to_s[6..9]
  end

end
