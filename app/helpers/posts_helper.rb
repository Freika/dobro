module PostsHelper
  def markdown(source)
    Kramdown::Document.new(source).to_html.html_safe
  end

  def status_label(post)
    if post.status == 'daily'
      content_tag(:span, 'Daily', class: 'label label-primary')
    elsif post.status == 'weekly'
      content_tag(:span, 'Weekly', class: 'label label-info')
    elseif post.status == 'monthly'
      content_tag(:span, 'Monthly', class: 'label label-success')
    else
      puts "There is no any status"
    end
  end
end
