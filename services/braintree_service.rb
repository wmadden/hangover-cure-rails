class BraintreeService
  class Transaction
    def initialize(response)
      @response = response
    end
    attr_reader :response

    def valid?
      response.success?
    end

    def identifier
      response.transaction.id
    end

    def status
      response.transaction.status
    end
  end

  # Makes payment in braintree, creates braintree transaction
  #
  def self.pay(nonce, purchase)
    Transaction.new Braintree::Transaction.sale(
      amount: purchase.price_in_full_units,
      payment_method_nonce: nonce,
      options: { submit_for_settlement: true },
      customer: { email: purchase.email },
      purchase_id: purchase.id,
      custom_fields: {
        purchase_id: purchase.id,
        item: purchase.item,
        buyer_email: purchase.buyer_email
      },
    )
  end
end
