class TaskDecorator < Draper::Decorator
  delegate_all

  def formatted_total_time
    total_time = object.timers.sum(:total_time)
    hours = (total_time / 3600).to_i
    minutes = ((total_time % 3600) / 60).to_i
    seconds = (total_time % 60).to_i
    format('%<hours>02d:%<minutes>02d:%<seconds>02d', hours: hours, minutes: minutes, seconds: seconds)
  end
end
