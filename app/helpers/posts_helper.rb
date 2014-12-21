module PostsHelper
  def markdown(source)
    Kramdown::Document.new(source).to_html.html_safe
  end

  def status_label(post)
    if post.status == 'daily'
      content_tag(:span, 'Итоги дня', class: 'label label-info')
    elsif post.status == 'weekly'
      content_tag(:span, 'Итоги недели', class: 'label label-warning')
    elsif post.status == 'monthly'
      content_tag(:span, 'Итоги месяца', class: 'label label-success')
    else
      puts "There is no any status"
    end
  end

  def last_week
    current_user.posts.where('created_at > ?', Date.today.beginning_of_week).order(created_at: :desc)
  end

  def last_month
    current_user.posts.where("created_at >= ? AND created_at <= ? ", Date.today.beginning_of_month, Date.today.end_of_month)
  end

end
