module PurchaseMethods
  extend ActiveSupport::Concern

  included do
    def purchase_attrs
      # TODO: this guard sucks but I don't know how to do it better :(
      return nil unless params[:purchase]
      
      params.require(:purchase).permit *%i(
        buyer_full_name
        buyer_email
        buyer_address
        buyer_postcode
      )
    end

    def purchase
      @_purchase ||= Purchase.for_deal purchase_attrs, deal
    end
    helper_method :purchase
  end
end
