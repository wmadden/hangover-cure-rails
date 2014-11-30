class TransactionsController < ApplicationController
  include DealRouting
  include PurchaseMethods

  def create
    respond_to do |format|
      if purchase.commit(nonce)
        format.html { render :success }
      else
        format.html { render "deals/#{deal.type}" }
      end
    end
  end

  private

  def transaction_params
    params.permit(:transaction)
  end

  def nonce
    params.require(:payment_method_nonce)
  end

  def deal_id_param
    params.require(:deal_id).to_sym
  end
end
