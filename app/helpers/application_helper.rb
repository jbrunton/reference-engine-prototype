module ApplicationHelper
  def markdownify(text)
    return "" if text.nil?
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    markdown = Redcarpet::Markdown.new(renderer,
        :autolink => true,
        :space_after_headers => true,
        :hard_wrap => true)
    markdown.render(text).html_safe
  end

  def format_date(date)
    date.strftime('%-d %b %Y').html_safe
  end
end
