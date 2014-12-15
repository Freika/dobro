module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Dobro"
    end
  end

  def nice_russian_date(date)
    if date == Date.today
      "Сегодня, #{Russian::strftime(date, '%e %B')}"
    elsif date == Date.yesterday
      "Вчера, #{Russian::strftime(date, '%e %B')}"
    else
      Russian::strftime(date, '%e %B %Y')
    end
  end
end
