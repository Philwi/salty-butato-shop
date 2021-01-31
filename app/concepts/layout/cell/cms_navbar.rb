module Layout::Cell
  class CmsNavbar < Trailblazer::Cell
    include ActionView::Helpers::UrlHelper
    include ::Webpacker::Helper
    include ActionView::Helpers::JavaScriptHelper

    def categories
      Comfy::Cms::Category.where.not(label: 'wysiwyg')
    end

    def pages_in_category(category)
      Comfy::Cms::Page.all.select { |page| page.category_ids.include?(category.id) }
    end

    def page_path(full_path)
      "/blog/#{full_path}"
    end
  end
end
