class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :email, presence: true
  has_many :foods
end
