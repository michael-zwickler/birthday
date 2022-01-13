require 'date'

class BirthdayCountdown

  def days_to_birthday(day, month)
    
    feb_day = 0
    if day == 29 && month == 2
      feb_day = 1
      day = 28
    end

    birthday_date = Date.new(Time.now.year, month, day)
    
    if birthday_date - Date.today < 0
      birthday_date = Date.new(Time.now.year + 1, month, day)
    end
    
    result = birthday_date - Date.today
    return result.to_i + feb_day
  end

end