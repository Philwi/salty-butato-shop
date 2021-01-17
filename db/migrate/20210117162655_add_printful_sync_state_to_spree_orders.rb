class AddPrintfulSyncStateToSpreeOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_orders, :printful_sync, :boolean, default: false
  end
end
