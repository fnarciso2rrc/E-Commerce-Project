class UpdateCustomers < ActiveRecord::Migration[7.2]
  def change
        add_reference :customers, :province, foreign_key: true

        remove_column :customers, :username, :string

        remove_column :customers, :address, :string

        add_column :customers, :street_address, :string

        add_column :customers, :city, :string

        add_column :customers, :postal_code, :string
  end
end
