class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def product_title_full
    "#{line_item.product.category} #{line_item.product.title}"
  end

  def total_price
    product.price * quantity
  end
end
