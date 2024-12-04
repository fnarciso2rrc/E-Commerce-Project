class CreateProvinces < ActiveRecord::Migration[7.2]
  def change
    create_table :provinces do |t|
      t.string :province_name
      t.string :alpha_code

      t.timestamps
    end
  end
end
