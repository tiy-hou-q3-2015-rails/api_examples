class Company < ActiveRecord::Base
  has_many :sales

  def last_price
    self.last_price_in_cents / 100.0
  end

  def last_price=(new_price)
    self.last_price_in_cents = new_price * 100
  end
end
