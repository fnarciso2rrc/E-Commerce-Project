json.extract! customer, :id, :username, :email, :password, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)
