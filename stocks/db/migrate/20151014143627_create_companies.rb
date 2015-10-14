class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ticker_symbol
      t.integer :last_price_in_cents

      t.timestamps null: false
    end
  end
end
