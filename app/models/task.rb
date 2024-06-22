class Task < ApplicationRecord
  acts_as_paranoid

  belongs_to :project
  has_many :timers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  scope :by_project, ->(project_id) { where(project_id: project_id) }
  scope :sorted_by, lambda { |sort_option|
    if column_names.include?(sort_option)
      order(sort_option.to_sym => :asc)
    elsif sort_option == 'project'
      includes(:project).order('projects.title')
    elsif sort_option == 'total_time'
      left_joins(:timers).group(:id).order('SUM(timers.total_time) DESC')
    else
      order(created_at: :desc)
    end
  }
end
