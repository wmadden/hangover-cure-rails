class Transaction < ActiveRecord::Base
  belongs_to :purchase

  validates :identifier, presence: true
  validates :status, presence: true

  def succeeded?
    status == 'authorized'
  end
end
