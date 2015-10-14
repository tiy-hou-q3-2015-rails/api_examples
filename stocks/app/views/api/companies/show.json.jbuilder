json.company do
  json.id @company.id
  json.name @company.name
  json.ticker_symbol @company.ticker_symbol
  json.last_price @company.last_price
  json.last_price_in_cents @company.last_price_in_cents
  json.last_price_formatted number_to_currency(@company.last_price)
  json.transactions @company.sales.order("id desc").limit(5) do |sale|
    json.id sale.id
    json.created_at sale.created_at
    json.price sale.price
    json.price_in_cents sale.price_in_cents
    json.price_formatted number_to_currency(sale.price)
    json.quantity sale.quantity
  end
end
