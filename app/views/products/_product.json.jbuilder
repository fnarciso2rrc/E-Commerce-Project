json.extract! product, :id, :product_name, :brand, :price, :ranking, :ingredients, :created_at, :updated_at
json.url product_url(product, format: :json)
