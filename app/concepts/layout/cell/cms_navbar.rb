module Layout::Cell
  class CmsNavbar < Trailblazer::Cell
    def categories
      Comfy::Cms::Category.where.not(label: 'wysiwyg')
    end
  end
end
