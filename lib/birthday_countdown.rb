require 'date'

class BirthdayCountdown

  def days_to_birthday(day, month)
    birthday_date = Date.new(Time.now.year, month, day)
    
    if birthday_date - Date.today < 0
      birthday_date = Date.new(Time.now.year + 1, month, day)
    end
    
    result = birthday_date - Date.today
    return result.to_i
  end

end