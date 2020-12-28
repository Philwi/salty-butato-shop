class AddPrintfulVariantIdToSpreeVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_variants, :printful_variant_id, :integer
  end
end
