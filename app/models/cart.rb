class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_drug(drug)
    current_item = line_items.find_by(drug_id: drug.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(drug_id: drug.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

end
