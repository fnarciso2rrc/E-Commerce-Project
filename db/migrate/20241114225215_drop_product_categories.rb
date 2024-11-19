class DropProductCategories < ActiveRecord::Migration[7.2]
  def change
    drop_table :product_categories
  end
end
