json.array!(@companies) do |company|
  json.extract! company, :company_name, :trading_name, :cnpj
  json.url company_url(company, format: :json)
end