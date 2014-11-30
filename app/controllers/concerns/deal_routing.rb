module DealRouting
  extend ActiveSupport::Concern

  DEAL_ROUTE_IDS = {
    basic: :tier_1,
    advanced: :tier_2,
    omg: :tier_3
  }

  included do
    def deal
      id = deal_id
      Deal.by_type(DEAL_ROUTE_IDS[id])
    end

    def deal_id_param
      params.require(:id).to_sym
    end

    def deal_id
      id = deal_id_param
      raise ActionController::RoutingError unless DEAL_ROUTE_IDS.has_key?(id)
      id
    end
    helper_method :deal_id
  end
end
