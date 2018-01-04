class Restaurant < ActiveRecord::Base

  has_many :chowtables
  has_many :users

  validates :phone, uniqueness: true

  def wobbliness
    if self.chowtables.count > 0
      sum = 0
      divisor = 0
      self.chowtables.each do |table|
        table.reviews.each do |review|
          sum += review.wobble
          divisor += 1
        end
      end
      if sum > 0
        sum / divisor
      else
        0
      end
    # else
    #   self.chowtables.each do |table|
    #     table.reviews.each do |review|
    #       review.wobble
    #     end
    #   end
    #   review.wobble
    end
  end

  def formatted_phone(phone)
    "(" + phone.to_s[0..2] + ") " + phone.to_s[3..5] + "-" + phone.to_s[6..9]
  end

  # validate :street_address_is_unique
  #
  # private
  #
  # def street_address_is_unique(attributes)
  #   # avoid duplicating restaurants by checking if street address already exists in db
  #   Restaurant.all.each do |resto|
  #     !resto.street_address.include?(attributes['street_address'])
  #   end
  # end

end
