class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.decimal :total_amount
      t.date :order_date
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
