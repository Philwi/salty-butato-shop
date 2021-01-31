require 'webmock/minitest'
require 'vcr'

module VcrHelper
  Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }
end
