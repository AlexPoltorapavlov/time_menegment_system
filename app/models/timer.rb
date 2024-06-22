class Timer < ApplicationRecord
  acts_as_paranoid

  belongs_to :task

  scope :sorted_by, ->(sort_option) {
    if column_names.include?(sort_option)
      order(sort_option.to_sym => :desc)
    else
      order(created_at: :desc)
    end
  }

end
