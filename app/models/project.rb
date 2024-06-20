class Project < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  has_many :tasks, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }
end
