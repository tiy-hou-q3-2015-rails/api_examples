class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  def price
    self.price_in_cents.to_i / 100.0
  end

  def price=(new_price)
    self.price_in_cents = new_price.to_f * 100
  end
end
