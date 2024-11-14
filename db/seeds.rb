require "csv"


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Category.delete_all
Product.delete_all
ProductCategory.delete_all

# Load CSV file 
filename = Rails.root.join("db/cosmetic_p.csv")
csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")


products.each do |product|
    # Create new product
    new_product = Product.create(
        product_name: product["name"],
        brand: product["brand"],
        price: product["price"].to_d,
        ranking: product["rank"].to_d,
        ingredients: product["ingredients"]
    )

    # Create or find associated category
    category_name = product["Label"]
    category = Category.find_or_create_by(category_type: category_name)

    # Create association for ProductCategory
    ProductCategory.create(product: new_product, category: category)
end

puts "There are #{Category.count} Categories"
puts "There are #{Product.count} Products"
puts "There are #{ProductCategory.count} ProductCategories"


