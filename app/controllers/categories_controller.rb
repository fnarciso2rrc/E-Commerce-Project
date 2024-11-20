class CategoriesController < ApplicationController
  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])

  end

end
