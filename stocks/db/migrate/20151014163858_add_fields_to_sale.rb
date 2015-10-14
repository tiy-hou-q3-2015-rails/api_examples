class AddFieldsToSale < ActiveRecord::Migration
  def change
    add_column :sales, :user_id, :integer
    add_column :sales, :bid_id, :integer
  end
end
