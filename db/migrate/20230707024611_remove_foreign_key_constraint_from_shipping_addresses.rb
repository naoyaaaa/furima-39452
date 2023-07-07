class RemoveForeignKeyConstraintFromShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :shipping_addresses, :purchase_logs
  end
end
