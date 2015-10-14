class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :company_id
      t.integer :quantity
      t.integer :price_in_cents
      t.integer :user_id
      t.boolean :open, default: true

      t.timestamps null: false
    end
  end
end
