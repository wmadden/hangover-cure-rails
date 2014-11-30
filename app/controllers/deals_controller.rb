class DealsController < ApplicationController
  include DealRouting
  include PurchaseMethods

  def index
  end

  def show
    render deal.type
  end
end
