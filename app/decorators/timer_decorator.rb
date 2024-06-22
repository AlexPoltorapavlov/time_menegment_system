class TimerDecorator < Draper::Decorator
  delegate_all

  def formatted_time
    helpers.formatted_time(total_time)
  end
end
