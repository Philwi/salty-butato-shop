class ApplicationController < ActionController::Base
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Store
  helper Spree::BaseHelper
  # include Spree::Core::ControllerHelpers
  # include Spree::Core::Engine.routes.url_helpers
  # include Spree::Core::Engine.helpers
  # include Spree::AuthenticationHelpers
  # include Spree::CurrencyHelpers
  # include Spree::BaseHelper
  # include Spree::NavigationHelper
  # helper Spree::NavigationHelper

end
