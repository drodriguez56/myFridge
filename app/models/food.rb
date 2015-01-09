class Food < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true
  validates :expiration_date, presence: true
  validate :check_date_after_today

  def check_date_after_today
    errors.add(:expiration_date, "Date must be after today") if expiration_date <= Date.today
  end

end
