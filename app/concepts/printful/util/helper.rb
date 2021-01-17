module Printful::Util
  module Helper
    SPREE_TYPES =
      {
        'size' => %w[XS S M L XL 2XL 3XL 4XL],
        'color' => %w[]
      }

    SPREE_COLOR_NAMES =
      [
        { "Aqua" => "008db5"},
        { "Army" => "4e4737"},
        { "Ash" => "EEF0F2"},
        { "Asphalt" => "52514f"},
        { "Athletic Heather" => "a8abb2"},
        { "Autumn" => "c85313"},
        { "Berry" => "c02773"},
        { "Black Heather" => "2A282B"},
        { "Black" => "0c0c0c"},
        { "Brown" => "322622"},
        { "Burnt Orange" => "ed8043"},
        { "Dark Grey Heather" => "3E3C3D"},
        { "Forest" => "223e25"},
        { "Gold" => "ff9e00"},
        { "Heather Blue" => "86A9C9"},
        { "Heather Deep Teal" => "487485"},
        { "Heather Dust" => "e0cbb7"},
        { "Heather Forest" => "4F5549"},
        { "Heather Midnight Navy" => "35353F"},
        { "Heather Mint" => "72D3B4"},
        { "Heather Orange" => "D96E51"},
        { "Heather Orchid" => "b17e85"},
        { "Heather Prism Dusty Blue" => "a1c3b8"},
        { "Heather Prism Ice Blue" => "c0e3e4"},
        { "Heather Prism Lilac" => "d9b0cb"},
        { "Heather Prism Mint" => "aad4b7"},
        { "Heather Prism Peach" => "eec1b3"},
        { "Heather Raspberry" => "FC667D"},
        { "Heather True Royal" => "5F98E6"},
        { "Kelly" => "1a9462"},
        { "Leaf" => "5c9346"},
        { "Light Blue" => "cfd5e1"},
        { "Lilac" => "f4b9d3"},
        { "Mauve" => "bf6e6e"},
        { "Mustard" => "eda027"},
        { "Navy" => "212642"},
        { "Ocean Blue" => "5ca4c5"},
        { "Olive" => "5b642f"},
        { "Oxblood Black" => "2c1013"},
        { "Pink" => "fdbfc7"},
        { "Red" => "b90116"},
        { "Silver" => "e3e3dd"},
        { "Soft Cream" => "f4e5d7"},
        { "Steel Blue" => "668ea7"},
        { "True Royal" => "01408d"},
        { "White" => "e2e3de"},
        { "Yellow" => "ffd35c"}
      ]

    class << self
      def request(url:)
        base_uri = 'https://api.printful.com'
        api_key = Rails.application.credentials.dig(:printful, :api_key)
        headers = { 'Authorization': 'Basic ' + Base64.encode64(api_key) }
        HTTParty.get("#{base_uri}/#{url}", headers: headers)
      end

      def post_request(url:, body:)
        base_uri = 'https://api.printful.com'
        api_key = Rails.application.credentials.dig(:printful, :api_key)
        headers = { 'Authorization': 'Basic ' + Base64.encode64(api_key) }
        HTTParty.post("#{base_uri}/#{url}", body: body.to_json, headers: headers)
      end

      def create_colors_from_constant
        SPREE_COLOR_NAMES.each do |color|
          ColorTable.find_or_create_by(colorname: color.keys.first, hex: color.values.first)
        end
      end

    end
  end
end
