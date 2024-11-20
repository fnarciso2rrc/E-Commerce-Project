class ProductsController < ApplicationController
  # before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @categories = Category.all

    keywords = params[:keywords]
    category_id = params.dig(:category, :id)

    @products = Product.all

    if keywords.present?
      @products = @products.where("product_name LIKE ?", "%#{keywords}%")
    end

    if category_id.present?
      @products = @products.where(category_id: category_id)
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

end
