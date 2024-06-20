class Project < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  has_many :tasks, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  scope :by_project, ->(project_id) { where(project_id: project_id) }
  scope :sorted_by, lambda { |sort_option|
    case sort_option
    when 'title'
      order(title: :asc)
    when 'created_at'
      order(created_at: :asc)
    when 'updated_at'
      order(updated_at: :asc)
    when 'project'
      includes(:project).order('projects.title')
    else
      order(created_at: :desc)
    end
  }
end
