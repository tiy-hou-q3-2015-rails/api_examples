class User < ActiveRecord::Base
  has_secure_password
  has_many :bids
  has_many :portfolios #this is stocks

  def portfolio_balance
    portfolios.map{|p| p.value }.sum
  end

  def balance
    self.balance_in_cents / 100.0
  end

  def balance=(new_balance)
    self.balance_in_cents = new_balance * 100
  end
end
