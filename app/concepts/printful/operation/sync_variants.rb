module Printful::Operation
  class SyncVariants < Trailblazer::Operation
    step :get_variants, fast_track: true
    step :find_spree_product
    step :prepare_spree_option_type
    step :create_variants_if_necessary

    def get_variants(ctx, printful_id:, **)
      response = ::Printful::Util::Helper.request(url: "sync/products/#{printful_id}")
      return Railway.fail_fast! unless response['code'] == 200

      ctx[:variants] = response.dig('result', 'sync_variants')
    end

    def find_spree_product(ctx, printful_id:, **)
      ctx[:spree_product] = ::Spree::Product.find_by(printful_id: printful_id)
    end

    def prepare_spree_option_type(ctx, **)
      ::Printful::Util::Helper::SPREE_TYPES.keys.each do |key|
        ::Spree::OptionType.find_or_create_by(
          name: key,
          presentation: key
        )
      end
    end

    def create_variants_if_necessary(ctx, variants:, spree_product:, **)
      variants.each.with_index do |variant, index|
        option_values = create_new_option_values(variant: variant)
        master_variant = index == 0

        create_or_update_variant(
          master_variant: master_variant,
          printful_variant: variant,
          spree_option_values: option_values,
          spree_product: spree_product
        )
      end
    end

    def create_new_option_values(variant:)
      option_values = variant['name'].split(' - ')&.last&.split(' / ')

      option_values.map do |option_value|
        option_type =
          if ::Printful::Util::Helper::SPREE_TYPES['size'].include?(option_value)
            Spree::OptionType.find_by(name: 'size')
          else
            Spree::OptionType.find_by(name: 'color')
          end

        Spree::OptionValue.find_or_create_by(
          name: option_value,
          presentation: option_value,
          option_type: option_type
        )
      end
    end

    def create_or_update_variant(printful_variant:, spree_option_values:, master_variant: false, spree_product:)
      variant = ::Spree::Variant.find_or_create_by(
        sku: printful_variant['sku'],
        is_master: master_variant,
        cost_currency: printful_variant['currency'],
        cost_price: printful_variant['retail_price'],
        printful_variant_id: printful_variant['variant_id'],
        printful_sync_variant_id: printful_variant['id'],
        product: spree_product,
        option_values: spree_option_values,
      ).update(
        sku: printful_variant['sku'],
        is_master: master_variant,
        cost_currency: printful_variant['currency'],
        cost_price: printful_variant['retail_price'],
        printful_variant_id: printful_variant['variant_id'],
        printful_sync_variant_id: printful_variant['id'],
        product: spree_product,
        option_values: spree_option_values,
        price: printful_variant['retail_price']
      )

      if variant.images.blank?
        printful_variant['files'].map do |file|

          new_image = URI.open(file['preview_url'])
          image = variant.images.build
          image.attachment.attach(io: new_image, filename: file['filename'])
          image.attachment_file_name = file['filename']
          image.save
        end
      end
    end

  end
end
