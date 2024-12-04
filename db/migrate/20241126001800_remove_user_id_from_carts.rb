class RemoveUserIdFromCarts < ActiveRecord::Migration[7.2]
  def change
    remove_column :carts, :user_id
  end
end
