class User < ActiveRecord::Base

  has_many :reviews
  has_many :restaurants, through: :reviews

  validates :name, presence: true
  validates :name, uniqueness: true

  def admin?
    id < 10
  end

end
