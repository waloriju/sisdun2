class Product < ActiveRecord::Base
  belongs_to :category
  SALE_TYPES = [ "Unitario", "Fracionado" ]
  validates :title, presence: true,
                    uniqueness: true
  validates :price, presence: true,
                    numericality: {greater_than_or_equal_to: 0.01}
  validates :category_id, presence: true
  validates :sale_type, inclusion: SALE_TYPES
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.latest
    Product.order(:updated_at).last
  end
end
