class CnpjValidator < ActiveModel::EachValidator
  def is_cnpj?(value)
    match = value.gsub(/\D/, "").scan(/\d/).collect(&:to_i)

    if match.size == 14
      match = match.collect{|x| x.to_i}
      sum = match[0] * 5 + match[1] * 4 + match[2] * 3 + match[3] * 2 + match[4] * 9 + match[5] * 8 + match[6] * 7 + match[7] * 6 + match[8] * 5 + match[9] * 4 + match[10] * 3 + match[11] * 2
      sum = sum - (11 * (sum / 11))
      m = (sum == 0 || sum == 1) ? 0 : 11 - sum

      if m == match[12]
        sum = match[0] * 6 + match[1] * 5 + match[2] * 4 + match[3] * 3 + match[4] * 2 + match[5] * 9 + match[6] * 8 + match[7] * 7 + match[8] * 6 + match[9] * 5 + match[10] * 4 + match[11] * 3 + match[12] * 2
        sum = sum - (11 * (sum / 11))
        n = (sum == 0 || sum == 1) ? 0 : 11 - sum

        return n == match[13]
      end
    end

   false
  end

  def validate_each(record, attribute, value)
    unless is_cnpj?(value)
      message = I18n.translate("errors.messages.invalid")
      record.errors[attribute] << message
    end
  end
end

class Company < ActiveRecord::Base
  validates :company_name, presence: true,
                           uniqueness: true
  validates :trading_name, presence: true
  VALID_CNPJ_REGEX = /\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}/
  validates :cnpj, presence: true,
                   uniqueness: true,
                   format: { with: VALID_CNPJ_REGEX },
                   exclusion: { in: %w(11.111.111/1111-11 22.222.222/2222-22 33.333.333/3333-33 44.444.444/4444-44 55.555.555/5555-55 66.666.666/6666-66 77.777.777/7777-77 88.888.888/8888-88 99.999.999/9999-99 00.000.000/0000-00) },
                   cnpj: true
end
