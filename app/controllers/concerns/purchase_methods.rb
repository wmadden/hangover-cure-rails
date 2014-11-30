module PurchaseMethods
  extend ActiveSupport::Concern

  included do
    def purchase_attrs
      params.permit(:purchase)
    end

    def purchase
      @_purchase ||= Purchase.for_deal purchase_attrs, deal
    end
    helper_method :purchase
  end
end
