class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :buyer_email
      t.string :buyer_full_name
      t.string :buyer_address
      t.string :buyer_postcode
      t.integer :price_in_full_units

      t.string :item
      t.boolean :shipped, default: false
    end
  end
end
