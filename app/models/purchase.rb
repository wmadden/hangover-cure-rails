class Purchase < ActiveRecord::Base
  has_many :transactions

  validates :buyer_full_name, presence: true
  validates :buyer_email, presence: true
  validates :buyer_address, presence: true
  validates :buyer_postcode, presence: true
  validates :price_in_full_units, presence: true
  validates :item, presence: true

  def self.for_deal(attrs, deal)
    purchase = Purchase.new(attrs)
    purchase.item = deal.type
    purchase.price_in_full_units = deal.price
    purchase
  end

  def commit(nonce)
    return false unless save
    braintree_transaction = BraintreeService.pay(nonce, purchase)
    local_transaction_record = Transaction.create!(
      status: braintree_transaction.status,
      identifier: braintree_transaction.identifier
    )
    local_transaction_record.succeeded?
  end
end
