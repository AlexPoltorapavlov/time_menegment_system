class Task < ApplicationRecord
  acts_as_paranoid

  belongs_to :project
  has_many :timers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  scope :by_project, ->(project_id) { where(project_id: project_id) }
  scope :sorted_by, ->(sort_option) {
    case sort_option
    when 'title'
      order(title: :asc)
    when 'created_at'
      order(created_at: :asc)
    when 'updated_at'
      order(updated_at: :asc)
    when 'project'
      includes(:project).order('projects.title')
    when 'total_time'
      left_joins(:timers).group(:id).order('SUM(timers.total_time) DESC')
    else
      order(created_at: :desc)
    end
  }
end
