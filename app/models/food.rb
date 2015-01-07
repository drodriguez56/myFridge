class Food < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  validates :expiration_date, presence: true
end
