class Contact < ActiveRecord::Base
  before_save { email.downcase! }
  belongs_to :contactable, polymorphic: true
  has_one :customer, as: :contactable
  has_one :company,  as: :contactable

  VALID_PHONE_REGEX = /(\(11\) [9][0-9]{4}-[0-9]{4})|(\(1[2-9]\) [5-9][0-9]{3}-[0-9]{4})|(\([2-9][1-9]\) [5-9][0-9]{3}-[0-9]{4})/
  validates :phone1, presence: true,
                     format: { with: VALID_PHONE_REGEX }
  validates :phone2, format: { with: VALID_PHONE_REGEX },
                     allow_nil: true,
                     allow_blank: true
  validates :phone3, format: { with: VALID_PHONE_REGEX },
                     allow_nil: true,
                     allow_blank: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    allow_nil: true,
                    allow_blank: true

end
