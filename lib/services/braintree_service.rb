class BraintreeService
  def self.pay(nonce, purchase)
    Braintree::Transaction.sale(
      amount: purchase.price_in_full_units,
      payment_method_nonce: nonce,
      options: { submit_for_settlement: true },
      customer: { email: purchase.buyer_email },
      order_id: purchase.id
    )
  end
end
