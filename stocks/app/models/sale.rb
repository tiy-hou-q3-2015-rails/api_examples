class Sale < ActiveRecord::Base
  belongs_to :company
  belongs_to :user #buyer
  belongs_to :bid

  validates :company, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0, less_than: 5000}
  validates :price, presence: true, numericality: {greater_than: 0}

  def price
    self.price_in_cents.to_i / 100.0
  end

  def price=(new_price)
    self.price_in_cents = new_price * 100
  end
end
