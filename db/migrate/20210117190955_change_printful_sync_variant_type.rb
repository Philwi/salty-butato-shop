class ChangePrintfulSyncVariantType < ActiveRecord::Migration[6.0]
  def change
    change_column :spree_variants, :printful_sync_variant_id, :bigint
  end
end
