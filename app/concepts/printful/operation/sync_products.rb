module Printful::Operation
  class SyncProducts < Trailblazer::Operation
    step :sync_products, fast_track: true

    def sync_products(ctx, old_products:, old_products_printful_response:, **)

      old_products_printful_response.each do |product|
        old_product = old_products.find_by(printful_id: product[:id])
        next if old_product.blank?
        old_product.available_on = ::Date.today - 1.day
        old_product.shipping_category = ::Spree::ShippingCategory.find_or_create_by(name: 'Default')
        old_product.name = product['name']
        old_product.description = product['name']

        unless old_product.images.last.attachment_file_name == product['thumbnail_url']
          old_product.images.last.delete
          image = old_product.images.build
          image.attachment.attach(io: URI.open(product['thumbnail_url']), filename: product['thumbnail_url'])
          image.save
        end

        ::Printful::Operation::SyncVariants.(printful_id: old_product.printful_id)

        old_product.price = old_product.reload.master.cost_price || product['retail_price'] || 100
        old_product.save
      end
    end
  end
end
