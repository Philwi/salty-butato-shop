class CmsController < ApplicationController
  def index
    categories =
      Comfy::Cms::Category.where.not(label: 'wysiwyg')

    render html: cell(Cms::Cell::Index, categories), layout: 'application'
  end

  def categorized
    categories =
      if category_id = params[:format]
        Comfy::Cms::Category.where(id: category_id).where.not(label: 'wysiwyg')
      else
        Comfy::Cms::Category.where.not(label: 'wysiwyg')
      end

    render html: cell(Cms::Cell::Index, categories), layout: false
  end
end
