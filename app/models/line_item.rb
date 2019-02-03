class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :drug
  belongs_to :cart

  def total_price
    drug.price * quantity
  end
end
