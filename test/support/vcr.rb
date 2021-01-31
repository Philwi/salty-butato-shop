require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join 'test', 'vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = false
  config.allow_http_connections_when_no_cassette = true
  # config.filter_sensitive_data("{appid}"){ ENV.fetch("OPENWEATHER_KEY") }
end
