class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :address

      t.timestamps
    end
  end
end
