class ProductsController < ApplicationController
  # before_action :set_product, only: %i[ show edit update destroy ]
  # GET /products or /products.json
  def index
    @categories = Category.all
    @cart_item = current_order.cart_items.new

    keywords = params[:keywords]
    category_id = params.dig(:category, :id)

    @products = Product.limit(50)

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
    @cart_item = current_order.cart_items.new

  end

  private
  def product_params
    params.require(:products).permit(:product_name, :price)
  end

end
