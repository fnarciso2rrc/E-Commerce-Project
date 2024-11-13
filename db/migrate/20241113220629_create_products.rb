class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :brand
      t.decimal :price
      t.decimal :ranking
      t.text :ingredients

      t.timestamps
    end
  end
end
