module Printful::Util
  module Helper
    SPREE_TYPES =
      {
        'shirt-size' => %w[XS S M L XL 2XL 3XL 4XL],
        'shirt-color' => %w[]
      }

    class << self
      def request(url:)
        base_uri = 'https://api.printful.com'
        api_key = Rails.application.credentials.dig(:printful, :api_key)
        headers = { 'Authorization': 'Basic ' + Base64.encode64(api_key) }
        HTTParty.get("#{base_uri}/#{url}", headers: headers)
      end

    end
  end
end