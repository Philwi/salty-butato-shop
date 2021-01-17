module Printful::Order::Operation
  class Sync < Trailblazer::Operation

    step :create_request_message
    step :sync_to_printful

    def create_request_message(ctx, order:, **)
      spree_user = order.user
      ship_address = order.ship_address
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
              name: ship_address.full_name,
              address1: ship_address.address1,
              city: ship_address.city,
              state_code: ship_address.state.abbr,
              country_code: ship_address.country.iso,
              zip: ship_address.zipcode
            },
            items: items          
          }
      end
    end

    def sync_to_printful(ctx, request:, order:, **)
      response = ::Printful::Util::Helper.post_request(url: "orders", body: request)
      if response['code'] == 200
        order.update(printful_sync: true)
      end
    end

  end
end

