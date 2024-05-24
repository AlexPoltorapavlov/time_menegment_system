class Task < ApplicationRecord
  belongs_to :project
  has_many :timers
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 10}
end
