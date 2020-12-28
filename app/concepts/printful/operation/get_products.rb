module Printful::Operation
  class GetProducts < Trailblazer::Operation
    step :get_products, fast_track: true
    step Subprocess(::Printful::Operation::CreateProducts)

    def get_products(ctx, **)
      response = ::Printful::Util::Helper.request(url: '/sync/products')
      return Railway.fail_fast! unless response['code'] == 200

      ctx[:old_products] = response['result'].select { |product| Spree::Product.find_by(printful_id: product['id']) }
      ctx[:new_products] = response['result'].reject { |product| Spree::Product.find_by(printful_id: product['id']) }
      ctx[:response] = response
      true
    end

  end
end