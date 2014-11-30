class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      # Buyer info
      t.string :buyer_email
      t.string :buyer_full_name
      t.string :buyer_address
      t.string :buyer_postcode

      # Purchase and payment info
      t.string :item
      t.integer :price_in_full_units
      t.boolean :paid, default: false
      t.boolean :shipped, default: false
    end
  end
end
