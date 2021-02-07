module Layout::Cell
  class MainVideo < Trailblazer::Cell
    include Cell::Slim
    include ActionView::Helpers::AssetTagHelper
    include ActionView::Helpers::TagHelper

  end
end
