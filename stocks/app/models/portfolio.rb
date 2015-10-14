class Portfolio < ActiveRecord::Base
  belongs_to :company
  belongs_to :user

  def value
    quantity * company.last_price
  end
end
