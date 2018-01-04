class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews
  has_many :restaurants, through: :reviews

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :password, presence: true
  validates :password_digest, presence: true

  def admin?
    name == 'admin'
  end

end
