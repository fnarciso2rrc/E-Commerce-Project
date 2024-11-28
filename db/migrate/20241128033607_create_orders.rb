class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.decimal :total_amount
      t.decimal :subtotal_amount
      t.decimal :tax_amount
      t.string :stripe_payment_id

      t.timestamps
    end
  end
end
