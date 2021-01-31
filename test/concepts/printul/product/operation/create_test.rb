require 'test_helper'
require 'helpers/printful_response_helper'

module Printful::Product::Operation
  class CreateTest < ActiveSupport::TestCase
    include ::PrintfulResponseHelper

    setup do
      @new_products = printful_products_response[:result]
    end

    test "get api response and create products" do
      assert_difference('Spree::Product.count', 3) do
        result = ::Printful::Product::Operation::Create.(new_products: @new_products)
        assert result.success?
      end
    end

  end
end
