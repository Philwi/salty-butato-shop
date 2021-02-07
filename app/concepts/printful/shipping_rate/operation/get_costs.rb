module Printful::ShippingRate::Operation
  class GetCosts < Trailblazer::Operation
    step :create_message
    step :get_costs_from_printful

    def create_message(ctx, order:, **)
      ship_address = order.ship_address || order.user.addresses.first

      items =
        order.line_items.map do |item|
          {
            quantity: item.quantity,
            sync_variant_id: item.variant.printful_sync_variant_id
          }
        end

      if ship_address.present? && items.present?
        ctx[:request] =
          {
            recipient: {
              city: ship_address.city,
              state_code: ship_address.state&.abbr,
              country_code: ship_address.country.iso,
              zip: ship_address.zipcode,
              address1: ship_address.address1
            },
            items: items
          }
      end
      true
    end

    def get_costs_from_printful(ctx, request:, **)
      response = ::Printful::Util::Helper.post_request(url: 'orders', body: request)
      ctx[:response] = response
      if response['code'] == 200
        result = response['result']

        ctx[:costs] = result.dig('costs', 'shipping')
      end
      true
    end
  end
end
