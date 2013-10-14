class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  belongs_to :city
  has_one :customer, :as => :addressable
  has_one :company, :as => :addressable
  validates :line1, presence: true
  validates :line2, presence: true
  validates :number, presence: true,
                     length: { maximum: 7 }
  validates :city_id, presence: true

  VALID_CEP_REGEX = /\d{5}\-\d{3}/
  validates :postal_code, presence: true,
                          format: { with: VALID_CEP_REGEX }
end
