module Printful::Operation
  class GetProducts < Trailblazer::Operation
    step :get_products, fast_track: true
    step Subprocess(::Printful::Product::Operation::Create)
    step :create_variants_for_new_products
    step Subprocess(::Printful::Product::Operation::Sync)
    step :sync_variants_from_existing_products
    step :get_deleted_products
    step :update_product_price

    private

    def get_products(ctx, **)
      response = ::Printful::Util::Helper.request(url: '/sync/products')
      return Railway.fail_fast! unless response['code'] == 200

      printful_ids = response['result'].pluck('id')
      old_products = Spree::Product.where(printful_id: printful_ids)
      old_product_printful_ids = old_products.pluck(:printful_id)

      old_products_printful_response =
        response['result'].select { |product| old_product_printful_ids.include?(product['id']) }

      new_products =
        response['result'].reject { |product| old_product_printful_ids.include?(product['id']) }

      ctx[:old_products] = old_products
      ctx[:old_products_printful_response] = old_products_printful_response
      ctx[:new_products] = new_products
      ctx[:printful_ids] = printful_ids
      ctx[:response] = response

      true
    end

    def create_variants_for_new_products(_ctx, new_products:, **)
      new_products.each do |product|
        ::Printful::Variant::Operation::Create.(printful_id: product['id'])
      end
      true
    end

    def sync_variants_from_existing_products(_ctx, old_products:, **)
      old_products.each do |product|
        ::Printful::Variant::Operation::Sync.(printful_id: product['id'])
      end
      true
    end

    def get_deleted_products(_ctx, printful_ids:, **)
      products = Spree::Product.all
      deleted_printful_ids = products.pluck(:printful_id) - printful_ids
      Spree::Product.where(printful_id: deleted_printful_ids).update_all(deleted_at: DateTime.current)
      true
    end

    def update_product_price(_ctx, **)
      Spree::Product.all.each do |product|
        price = product.reload.master.cost_price || product.variants&.sample&.cost_price
        product.update(price: price)
      end
      true
    end
  end
end
