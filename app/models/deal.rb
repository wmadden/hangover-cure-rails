class Deal
  DEAL_TYPES = {
    tier_1: {
      price: 100
    },
    tier_2: {
      price: 200
    },
    tier_3: {
      price: 300
    }
  }

  def self.by_type(type)
    Deal.new type, DEAL_TYPES[type]
  end

  def initialize(type, attributes)
    @type = type
    @price = attributes[:price]
  end

  attr_reader :type
  attr_reader :price
end
