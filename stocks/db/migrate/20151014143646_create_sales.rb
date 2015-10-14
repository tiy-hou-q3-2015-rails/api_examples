class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :company_id
      t.integer :quantity
      t.integer :price_in_cents

      t.timestamps null: false
    end
  end
end
