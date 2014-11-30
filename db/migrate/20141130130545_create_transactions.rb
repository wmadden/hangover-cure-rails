class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer  :purchase_id
      t.string   :identifier
      t.string   :status
      t.timestamps
    end
  end
end
