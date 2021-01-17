module Printful::Operation
  class SyncColors < Trailblazer::Operation
    step :get_used_variants
    step :get_data_from_printful
    step :sync_colors

    def get_used_variants(ctx, **)
      ctx[:printful_variant_ids] = Spree::Variant.all.pluck(:printful_variant_id).uniq.compact
    end

    def get_data_from_printful(ctx, printful_variant_ids:, **)
      ctx[:colors] = 
        printful_variant_ids.map do |printful_variant_id|
          response = ::Printful::Util::Helper.request(url: "products/variant/#{printful_variant_id}")
          next if response['code'] != 200
          next if response.is_a? String
          response.dig('result', 'product', 'options').map(&:values).map(&:fourth)&.compact
        end.compact.flatten
    end

    def sync_colors(ctx, colors:, **)
      if colors.present?
        colors_hash = {}
        colors.each { |color| colors_hash.merge!(color) }
        colors_hash.map { |k, v| { k => v.split(' ')[1..-1].join(' ') } }.each do |color_entry|
          ColorTable.find_or_create_by(hex: color_entry.keys.first, colorname: color_entry.values.first)
        end
      end
    end

  end
end
