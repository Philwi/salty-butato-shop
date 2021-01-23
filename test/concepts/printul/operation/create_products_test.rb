require 'test_helper'

module Printful::Operation
  class CreateProductsTest < ActiveSupport::TestCase
    setup do
      printful_response = 
        {
          "code": 200,
          "result": [
            {
              "id": 211743080,
              "external_id": "600463b8f0b402",
              "name": "Wavegirl Rücken",
              "variants": 43,
              "synced": 43,
              "thumbnail_url": "https://files.cdn.printful.com/files/85c/85cca12744e1a31aee93d642139f20c9_preview.png"
            },
            {
              "id": 211548669,
              "external_id": "6001f1151730a5",
              "name": "Wavegirl klein",
              "variants": 48,
              "synced": 48,
              "thumbnail_url": "https://files.cdn.printful.com/files/c75/c758703a39a8b70229242ba323b753c0_preview.png"
            },
            {
              "id": 211320981,
              "external_id": "6000ba45244d07",
              "name": "Wavegirl Sweater ",
              "variants": 30,
              "synced": 30,
              "thumbnail_url": "https://files.cdn.printful.com/files/fd1/fd1a3173ed1c5319040fa2749225af49_preview.png"
            }
          ]
        }
      @new_products = printful_response['result']
    end

    test "get api response and create products" do
      assert_difference('Spree::Product.count', 3) do 
        result = ::Printful::Operation::CreateProducts.(new_products: new_products)
        assert result.success?
      end
    end

  end
end
