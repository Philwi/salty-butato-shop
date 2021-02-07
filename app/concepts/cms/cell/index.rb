module Cms::Cell
  class Index < Trailblazer::Cell
    include ActionView::Helpers::UrlHelper
    include ::Webpacker::Helper
    include ActionView::Helpers::JavaScriptHelper

    def pages
      category_ids = model.pluck(:id)
      Comfy::Cms::Page.where(id: category_ids)
    end

    def page_body_without_images(page)
      Nokogiri::HTML(page.content_cache).css('p').map(&:text).first
    end

    def image_from_page(page)
      content = page.content_cache
      doc = Nokogiri::HTML(content)
      img_src = doc.css('img').map{ |i| i['src'] }&.first

      if img_src.present?
        image_tag(img_src)
      else
        image_tag('schneck.jpg')
      end
    end
  end
end
