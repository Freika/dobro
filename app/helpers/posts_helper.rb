module PostsHelper

  def markdown(source)
    Kramdown::Document.new(source).to_html.html_safe
  end

  def available_post_types
    options = {daily: 'Итоги дня'}
    if Time.zone.now.wday == 6 || Time.zone.now.wday == 0
      options[:weekly] = 'Итоги недели'
    end

    if (25..31).include? Time.zone.now.day
      options[:monthly] = 'Итоги месяца'
    end

    if Time.zone.now.month == 12
      options[:yearly] = 'Итоги года'
    end

    if (Time.zone.now.month == 2) && ((25..31).include? Time.zone.now.day)
      options[:winter] = 'Итоги зимы'
    end

    if (Time.zone.now.month == 5) && ((25..31).include? Time.zone.now.day)
      options[:spring] = 'Итоги весны'
    end

    if (Time.zone.now.month == 8) && ((25..31).include? Time.zone.now.day)
      options[:summer] = 'Итоги лета'
    end

    if (Time.zone.now.month == 11) && ((25..31).include? Time.zone.now.day)
      options[:autumn] = 'Итоги осени'
    end
    options
  end

  def status_label(post)
    if post.status == 'daily'
      content_tag(:span, 'Итоги дня', class: 'label label-info')
    elsif post.status == 'weekly'
      content_tag(:span, 'Итоги недели', class: 'label label-warning')
    elsif post.status == 'monthly'
      content_tag(:span, 'Итоги месяца', class: 'label label-success')
    elsif post.status == 'winter'
      content_tag(:span, 'Итоги зимы', class: 'label')
    elsif post.status == 'spring'
      content_tag(:span, 'Итоги весны', class: 'label')
    elsif post.status == 'summer'
      content_tag(:span, 'Итоги лета', class: 'label')
    elsif post.status == 'autumn'
      content_tag(:span, 'Итоги осени', class: 'label')
    else
      puts "There is no any status"
    end
  end

  def last_week
    current_user.posts.where('created_at >= ?', Date.today.beginning_of_week).order(created_at: :desc)
  end

  def last_month
    current_user.posts.where("created_at >= ? AND created_at <= ? ", Date.today.beginning_of_month, Date.today.end_of_month)
  end

  def new_post_or_update_today
    unless current_user.posts.count > 0
      link_to 'Добавить запись?', new_post_path, class: 'btn btn-success'
    else
      if current_user.posts.last.created_at.to_date == Time.zone.today
        link_to 'Отредактировать последнюю запись?', edit_post_path(current_user.posts.last), class: 'btn btn-primary'
      else
        link_to 'Добавить запись?', new_post_path, class: 'btn btn-success'
      end
    end
  end

end
