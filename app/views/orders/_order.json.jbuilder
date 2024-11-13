json.extract! order, :id, :total_amount, :order_date, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
