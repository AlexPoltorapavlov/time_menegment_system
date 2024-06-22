class Project < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  has_many :tasks, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  scope :by_project, ->(project_id) { where(project_id: project_id) }
  scope :sorted_by, ->(sort_option) { order(sort_option.to_sym => :asc) if column_names.include?(sort_option) }

end
