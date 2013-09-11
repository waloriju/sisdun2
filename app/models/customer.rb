class Customer < ActiveRecord::Base

  validates :first_name,  presence: true,
                          length: { maximum: 30 }
  validates :last_name, presence:true,
                        length: { maximum: 70 }
  validates :gender,  presence: true,
                      inclusion: { in: %w( male female ) }
  VALID_CPF_REGEX = /\d{3}\.\d{3}\.\d{3}-\d{2}/
  validates :cpf, presence: true,
                  uniqueness: true,
                  format: { with: VALID_CPF_REGEX }
  validates :birth_date,  presence: true

end