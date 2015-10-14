require 'http'

def fetch_quotes
  data = JSON.parse Http.get("http://localhost:3000/api/companies").to_s
  data["companies"]
end

def console

  puts "--------------------------------"
  puts "|                               |"
  puts "|          IronBrothers         |"
  puts "|                               |"
  puts "--------------------------------"

  puts "List of current quotes:"
  companies = fetch_quotes
  companies.each do |company|
    puts "#{company["ticker_symbol"]}: #{company["last_price_formatted"]}"
  end

  puts "Enter the symbol to buy"
  symbol = gets.chomp.upcase
  company = companies.find{|c| c["ticker_symbol"] == symbol}
  company_id = company["id"]

  puts "What quantity"
  quantity = gets.chomp.to_i
  puts "What price?"
  price = gets.chomp.to_f.round(2)

  transaction_json = {
    transaction: {
      quantity: quantity,
      price: price
    }
  }

  response = Http.post("http://localhost:3000/api/companies/#{company_id}/transactions", json: transaction_json)
  if response.status == 201
    puts "Yay!"
  else
    puts "Could not purchase"
  end

end

while true do
  system('clear')
  console
end
