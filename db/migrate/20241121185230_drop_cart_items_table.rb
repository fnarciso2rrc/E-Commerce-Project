class DropCartItemsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :cart_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
