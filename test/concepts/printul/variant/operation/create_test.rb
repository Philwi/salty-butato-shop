require 'test_helper'
require 'helpers/printful_response_helper'
require 'helpers/vcr_helper'

module Printful::Variant::Operation
  class CreateTest < ActiveSupport::TestCase
    include PrintfulResponseHelper
    include VcrHelper

    setup do
      new_products = printful_products_response[:result]

      assert_difference('Spree::Product.count', 3) do
        result = ::Printful::Product::Operation::Create.(new_products: new_products)
        assert result.success?
      end

      @printful_id = printful_products_response.dig('result', 0, 'id')
    end

    test 'stub printful api and create variants for this product' do
      VCR.use_cassette('printful_variants') do
        assert_difference('Spree::Variant.count', 46) do
          result = ::Printful::Variant::Operation::Create.(printful_id: @printful_id)
          assert result.success?
          assert variant = ::Spree::Variant.find_by(sku: '600463B8EF8A9_Soft-Cream-2XL')
          assert_equal 0.28e2, variant.cost_price
          assert_equal 'EUR', variant.cost_currency
          assert_equal false, variant.track_inventory
          assert_equal 4155, variant.printful_variant_id
          assert_equal 2_402_832_170, variant.printful_sync_variant_id
        end
      end
    end
  end
end
