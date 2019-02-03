class Order < ApplicationRecord
  validates :address, presence: true
  has_many :line_items, dependent: :destroy

  enum pay_types: {
      "Check" => 0,
      "Credit card" => 1,
      "Cash" => 2
  }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
