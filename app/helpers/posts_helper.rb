module PostsHelper
  def markdown(source)
    Kramdown::Document.new(source).to_html.html_safe
  end
end
