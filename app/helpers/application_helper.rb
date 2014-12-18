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

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
