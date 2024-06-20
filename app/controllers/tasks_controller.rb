class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_projects, only: %i[index new create edit]
  before_action :set_task, only: %i[show update edit destroy]
  load_and_authorize_resource

  def index
    @tasks = Task.accessible_by(current_ability)

    @tasks = @tasks.where(project_id: params[:project_id]) if params[:project_id].present?

    @tasks = @tasks.page(params[:page]) unless params[:project_id].present? 

    sorting_tasks

    @decorated_tasks = TaskDecorator.decorate_collection(@tasks)
  end

  def sorting_tasks
    @tasks = case params[:sort]
             when 'title'
               @tasks.order(title: :asc).page(params[:page])
             when 'created_at'
               @tasks.order(created_at: :asc).page(params[:page])
             when 'updated_at'
               @tasks.order(updated_at: :asc).page(params[:page])
             when 'project'
               @tasks.includes(:project).order('projects.title').page(params[:page])
             else
               @tasks.order(created_at: :desc).page(params[:page])
             end
  end

  def new
    @task = Task.new
  end

  def show
    sorting_timers
  end

  def sorting_timers
    @timers = @task.timers.page(params[:page]) 

    @timers = @timers.order(total_time: :desc) if params[:sort] == 'total_time'
    @timers = @timers.order(updated_at: :desc) if params[:sort] == 'updated_at'
    @timers = @timers.order(created_at: :desc) unless params[:sort] 

    @decorated_timers = TimerDecorator.decorate_collection(@timers)
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash.notice = 'Задача успешно создана'
      redirect_to @task
    else
      flash.alert = @task.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Задача успешно сохранена'
      redirect_to @task
    else
      flash[:error] = @task.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy
    @task.destroy
    flash.notice = 'Задача успешно удалена'
    redirect_to tasks_path
  end

  private

  def set_projects
    @projects = Project.accessible_by(current_ability)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :project_id)
  end
end
