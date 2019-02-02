class Drug < ApplicationRecord
  before_create :set_expiration_date

  def set_expiration_date
    self.expiration =  Date.today + 156.days
  end
end
