class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :chowtable
  belongs_to :restaurant

  validates :wobble, presence: true
  validates :wobble, numericality: true
  validates :wobble, inclusion: 0..5

  validates :chowtable_id, presence: true

end
