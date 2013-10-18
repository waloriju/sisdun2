json.array!(@orders) do |order|
  json.extract! order, :customer_id, :company_id
  json.url order_url(order, format: :json)
end