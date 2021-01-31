require 'test_helper'
require 'helpers/printful_response_helper'

module Printful::Product::Operation
  class SyncTest < ActiveSupport::TestCase
    include ::PrintfulResponseHelper

    setup do
      @new_products = printful_products_response[:result]
      new_synced_products = printful_products_response.dig('result', 0).merge({ name: 'Wavegirl Front' })
      @sync_products = [new_synced_products.stringify_keys]
    end

    test 'get api response and create products and sync the differences' do
      assert_difference('Spree::Product.count', 3) do
        result = ::Printful::Product::Operation::Create.(new_products: @new_products)
        assert result.success?
        product = Spree::Product.find_by(printful_id: 211743080)
        assert_equal 'Wavegirl Rücken', product.name
      end

      assert_no_difference('Spree::Product.count') do
        result = ::Printful::Product::Operation::Sync.(old_products: ::Spree::Product.all, old_products_printful_response: @sync_products)
        assert result.success?
        product = Spree::Product.find_by(printful_id: 211743080)
        assert_equal 'Wavegirl Front', product.name
      end
    end

  end
end
