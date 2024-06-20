class Timer < ApplicationRecord
  acts_as_paranoid

  belongs_to :task
end
