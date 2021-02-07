Cell::Concept.class_eval do
  include ::ActionView::Helpers::UrlHelper
  include ::Cell::Slim # or Cell::Slim, or Cell::Haml after that
end
