#["ABC", "BMW", "IBM", "XOM"]

google = Company.create! name: "Alphabet", ticker_symbol: "GOOG", last_price: 500
bmw = Company.create! name: "BMW", ticker_symbol: "BMW", last_price: 100
ibm = Company.create! name: "IBM", ticker_symbol: "IBM", last_price: 60
exxon = Company.create! name: "ExxonMobil", ticker_symbol: "XOM", last_price: 125

Company.all.each do |company|
  50.times do
    new_stock_price = company.last_price * rand(0.95..1.05)
    company.sales.create quantity: 5000, price: new_stock_price
    company.update last_price: new_stock_price
  end
end
