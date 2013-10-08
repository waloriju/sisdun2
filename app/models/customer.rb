class CpfValidator < ActiveModel::EachValidator
  def is_cpf?(value)
    match = value.gsub(/\D/, "").scan(/\d/).collect(&:to_i)

    if match.size == 11
      sum = 10 * match[0] + 9 * match[1] + 8 * match[2] + 7 * match[3] + 6 * match[4] + 5 * match[5] + 4 * match[6] + 3 * match[7] + 2 * match[8]
      sum = sum - (11 * (sum / 11))
      m = (sum == 0 || sum == 1) ? 0 : 11 - sum

      if m == match[9]
        sum = match[0] * 11 + match[1] * 10 + match[2] * 9 + match[3] * 8 + match[4] * 7 + match[5] * 6 + match[6] * 5 + match[7] * 4 + match[8] * 3 + match[9] * 2
        sum = sum - (11 * (sum / 11))
        n = (sum == 0 or sum == 1) ? 0 : 11 - sum

        return n == match[10]
      end
    end

    false
  end

  def validate_each(record, attribute, value)
    unless is_cpf?(value)
      message = I18n.translate("errors.messages.invalid")
      record.errors[attribute] << message
    end
  end
end

class Customer < ActiveRecord::Base
  validates :first_name,  presence: true,
                          length: { maximum: 30 },
                          format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, presence:true,
                        length: { maximum: 70 }
  validates :gender,  presence: true,
                      inclusion: { in: %w( male female ) }
  VALID_CPF_REGEX = /\d{3}\.\d{3}\.\d{3}-\d{2}/
  validates :cpf, presence: true,
                  uniqueness: true,
                  format: { with: VALID_CPF_REGEX },
                  exclusion: { in: %w(123.456.789-09 111.111.111-11 222.222.222-22 333.333.333-33 444.444.444-44 555.555.555-55 666.666.666-66 777.777.777-77 888.888.888-88 999.999.999-99 000.000.000-00)},
                  cpf: true

  validates :birth_date,  presence: true
  def full_name
    self.first_name+" "+self.last_name
  end
end