class DropCartsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :carts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
