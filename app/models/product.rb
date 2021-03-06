class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, presence: true
  validates :price, presence: true,
                    numericality: {greater_than_or_equal_to: 0.01}
  validates :category_id, presence: true

  def self.latest
    Product.order(:updated_at).last
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Presente em itens do carrinho')
      return false
    end
  end
end
