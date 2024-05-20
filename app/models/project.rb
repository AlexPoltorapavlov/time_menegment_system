class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 100}
end
