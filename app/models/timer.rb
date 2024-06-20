class Timer < ApplicationRecord
  acts_as_paranoid

  belongs_to :task

  scope :sorted_by, lambda { |sort_option|
    case sort_option
    when 'total_time'
      order(total_time: :desc)
    when 'updated_at'
      order(updated_at: :desc)
    when 'created_at'
      order(created_at: :desc)
    else
      order(created_at: :desc)
    end
  }
end
