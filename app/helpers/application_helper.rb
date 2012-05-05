module ApplicationHelper

  # Use within views to set the page's HTML title
  def title(title = nil)
    default = ""

    if title
      content_for(:title) { title }
    else
      content_for?(:title) ? content_for(:title) : default
    end
  end

  # Use within views to set the page's HTML meta description
  def description(text)
    content_for(:description) { text }
  end

  # Displays all flash messages in appropriately named divs for easy styling
  def flash_messages
    messages = flash.keys.collect { |key| flash_message(key, flash[key]) }
    content_tag(:div, messages.to_s.html_safe, :id => "flash-messages")
  end

  # Format a single flash message
  def flash_message(type, message)
    content_tag(:div, :class => "flash-message #{type.to_s}") do
      content_tag :p, message
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:filter_html => true, :safe_links_only => true, :hard_wrap => true), autolink: true, no_intra_emphasis: true)
    markdown.render(text).html_safe
  end

  def price(pounds, pence)
    if pence.present?
      p = pence.to_s.size < 2 ? "0#{pence}" : pence
    end

    if pounds.to_i > 0
      return "&pound;#{pounds}.#{p}".html_safe
    elsif pence.to_i > 0
      return "#{pence}p"
    else
      return "-"
    end
  end
end
