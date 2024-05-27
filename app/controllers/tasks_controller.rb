class TasksController < ApplicationController
  before_action :set_projects, only: %i[index new create edit]
  before_action :set_task, only: %i[show update edit destroy]

  def index
    @tasks = Task.joins(:project).where(projects: { user_id: current_user.id })

    @tasks = if params[:project_id].present?
               Task.where(project_id: params[:project_id])
             else
               Task.all
             end

    # сортировка
    sorting_tasks
  end

  def sorting_tasks
    @tasks = case params[:sort]
             when 'title'
               @tasks.order(title: :asc)
             when 'created_at'
               @tasks.order(created_at: :asc)
             when 'updated_at'
               @tasks.order(updated_at: :asc)
             when 'project'
               @tasks.includes(:project).order('projects.title')
             else
               @tasks.order(created_at: :desc) # сортировка по умолчанию
             end
  end

  def new
    @task = Task.new
  end

  def show
    # Сортировка таймеров
    sorting_timers
  end

  def sorting_timers
    @timers = if params[:sort]
                case params[:sort]
                when 'total_time'
                  @task.timers.order(total_time: :desc)
                when 'updated_at'
                  @task.timers.order(updated_at: :desc)
                else
                  @task.timers.order(created_at: :desc) # Сортировка по умолчанию
                end
              else
                @task.timers.order(created_at: :desc) # Сортировка по умолчанию
              end
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Задача успешно создана'
      redirect_to @task
    else
      flash[:error] = @task.errors.full_messages.join(', ')
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
    redirect_to tasks_path
  end

  private

  def set_projects
    @projects = current_user.projects
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :project_id)
  end
end
