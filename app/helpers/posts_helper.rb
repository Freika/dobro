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

  def new_post_or_update_today
    unless current_user.posts.count > 0
      link_to 'Создать новый день?', new_post_path, class: 'btn btn-success'
    else
      if current_user.posts.last.created_at.to_date == Time.zone.today
        link_to 'Отредактировать сегодняшний день?', edit_post_path(current_user.posts.last), class: 'btn btn-primary'
      end
    end
  end

end
