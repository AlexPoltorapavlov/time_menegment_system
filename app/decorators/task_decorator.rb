class TaskDecorator < Draper::Decorator
  delegate_all

  def formatted_total_time
    total_time = object.timers.sum(:total_time)
    helpers.formatted_time(total_time)
  end
end
