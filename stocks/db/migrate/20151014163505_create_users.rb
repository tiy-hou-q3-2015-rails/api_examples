class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :balance_in_cents, default: (50_000 * 100)

      t.timestamps null: false
    end
  end
end
