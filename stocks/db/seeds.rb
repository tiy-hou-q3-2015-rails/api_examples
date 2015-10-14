jwo = User.create email: "jesse@comal.io", password: "12345678"
bwo = User.create email: "brian@comal.io", password: "12345678"


#["ABC", "BMW", "IBM", "XOM"]

google = Company.create! name: "Alphabet", ticker_symbol: "GOOG", last_price: 500
bmw = Company.create! name: "BMW", ticker_symbol: "BMW", last_price: 100
ibm = Company.create! name: "IBM", ticker_symbol: "IBM", last_price: 60
exxon = Company.create! name: "ExxonMobil", ticker_symbol: "XOM", last_price: 125

Company.all.each do |company|
  # 50.times do
  #   # new_stock_price = company.last_price * rand(0.95..1.05)
  #   # company.sales.create quantity: 5000, price: new_stock_price
  #   # company.update last_price: new_stock_price
  # end

  jwo.portfolios.create company: company, quantity: 500
  bwo.portfolios.create company: company, quantity: 500
  bwo.bids.create company: company, quantity: 500, price: company.last_price * rand(0.95..1.05)

  # google_bid = jwo.bids.create company: google, quantity: 500, price: 400
  # Sale.create! user: bwo, bid: google_bid, quantity: 500, price: 400
  # company.update last_price: 500
  # # transfer to bwo from jwo
  # jwo_google_holdings = jwo.portfolios.find_by company_id: google.id
  # jwo_google_holdings.destroy
  # bwo.portfolios.create company: google, quantity: 500

end
