module Printful::Operation
  class CreateProducts < Trailblazer::Operation
    step :create_new_products, fast_track: true

    def create_new_products(ctx, new_products:, **)
      new_products.each do |product|
        new_product = ::Spree::Product.new
        new_product.printful_id = product['id']
        new_product.available_on = ::Date.today
        new_product.shipping_category = ::Spree::ShippingCategory.find_or_create_by(name: 'Default')
        new_product.name = product['name']
        new_product.description = product['name']
        new_product.price = product['retail_price'] || 100
        new_product.save

        if new_product.save
          image = new_product.reload.images.build
          image.attachment.attach(io: URI.open(product['thumbnail_url']), filename: product['thumbnail_url'])
          image.save

          ::Printful::Operation::CreateVariants.(printful_id: new_product.printful_id)

          new_product.update(price: new_product.reload.master.cost_price)
        end
      end
    end

  end
end