class Restaurant < ActiveRecord::Base

  serialize :address_hash

  has_many :chowtables
  has_many :users

  validates :phone, uniqueness: true

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
