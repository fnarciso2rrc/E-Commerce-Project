class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.float :subtotal
      t.float :total

      t.timestamps
    end
  end
end
