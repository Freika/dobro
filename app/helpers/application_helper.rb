module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Dobro"      
    end
  end
end
