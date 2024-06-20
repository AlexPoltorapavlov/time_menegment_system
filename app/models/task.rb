class Task < ApplicationRecord
  acts_as_paranoid

  belongs_to :project
  has_many :timers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }
end
