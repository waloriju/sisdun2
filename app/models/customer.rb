class Customer < ActiveRecord::Base

  validates :first_name,  presence: true,
                          length: { maximum: 30 }
  validates :last_name, presence:true,
                        length: { maximum: 70 }
  validates :gender,  presence: true,
                      inclusion: { in: %w( male female ) }
  validates :cpf, presence: true,
                  uniqueness: true
  validates :birth_date,  presence: true
end