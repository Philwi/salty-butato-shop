module Layout::Cell
  class MainVideo < Trailblazer::Cell
    include Cell::Slim
    include ActionView::Helpers::AssetTagHelper
    include ActionView::Helpers::TagHelper
    # image tag stuff doesnt work in cells Oo. they wont be rendered


  end
end