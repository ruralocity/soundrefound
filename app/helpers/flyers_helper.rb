module FlyersHelper
  def amazon_search_links(band_names)
    content_tag :strong do
      out = 'Buy music on Amazon by '
      out += band_names.map{|name| amazon_search_link(name) }.join(', ')
      out.html_safe
    end
  end

  private

  def amazon_search_link(name)
    link_to name, '#', {type: 'amzn', search: name, category: 'music'}
  end
end