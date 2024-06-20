class TimerDecorator < Draper::Decorator
  delegate_all

  def formatted_time
    hours = (total_time / 3600).to_i
    minutes = ((total_time % 3600) / 60).to_i
    seconds = (total_time % 60).to_i
    format('%<hours>02d:%<minutes>02d:%<seconds>02d', hours: hours, minutes: minutes, seconds: seconds)
  end
end
