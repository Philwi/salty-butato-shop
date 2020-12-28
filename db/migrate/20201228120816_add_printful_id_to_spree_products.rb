class AddPrintfulIdToSpreeProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_products, :printful_id, :integer
  end
end
