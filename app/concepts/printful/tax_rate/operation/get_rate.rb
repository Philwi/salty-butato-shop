module Printful::TaxRate::Operation
  class GetRate < Trailblazer::Operation

    step :create_request
    step :get_tax_rate

    def create_request(ctx, order:, **)
      spree_user = order.user
      ship_address = order.ship_address || spree_user.ship_address || spree_user.addresses.first

      ctx[:request] =
        {
          recipient: {
            city: ship_address.city,
            state_code: ship_address.state.abbr,
            country_code: ship_address.country.iso,
            zip: ship_address.zipcode,
          }
        }
      true
    end

    def get_tax_rate(ctx, request:, **)
      ctx[:response] = response = ::Printful::Util::Helper.post_request(url: "tax/rates", body: request)
      ctx[:tax_rate] =
        if (result = response['result']).present? && result['required']
          result['rate']
        else
          0
        end
    end

  end
end


