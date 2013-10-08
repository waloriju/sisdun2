json.array!(@customers) do |customer|
  json.extract! customer, :first_name, :last_name, :gender, :cpf, :birth_date, :created_at, :updated_at
  json.url customer_url(customer, format: :json)
end