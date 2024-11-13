class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :category_type
      t.text :category_description

      t.timestamps
    end
  end
end
